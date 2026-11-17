"""Exercise an installed formula and launchd service on a clean macOS runner.

Requires pymilvus==3.0.3. Uses one unique test collection and stops only the
service started by this script. Refuses to run over existing local listeners.
"""

import argparse
import json
import socket
import subprocess
import time
import urllib.error
import urllib.request
import uuid


PORTS = (19530, 9091, 2379, 2380)


def listening(port):
    with socket.socket() as connection:
        connection.settimeout(0.5)
        return connection.connect_ex(("127.0.0.1", port)) == 0


def wait_for(predicate, description, timeout=180):
    deadline = time.monotonic() + timeout
    while time.monotonic() < deadline:
        if predicate():
            return
        time.sleep(1)
    raise TimeoutError(description)


def healthy():
    try:
        with urllib.request.urlopen("http://127.0.0.1:9091/healthz", timeout=2) as response:
            return response.status == 200
    except (OSError, urllib.error.URLError):
        return False


def brew(*arguments):
    return subprocess.run(["brew", *arguments], check=True, text=True, capture_output=True).stdout


def service_status(formula):
    entries = json.loads(brew("services", "info", formula, "--json"))
    if len(entries) != 1:
        raise RuntimeError(f"Expected one service entry, received {entries!r}")
    return entries[0]["status"]


def exercise(formula):
    from pymilvus import MilvusClient

    occupied = [port for port in PORTS if listening(port)]
    if occupied or service_status(formula) == "started":
        raise RuntimeError(f"Use a clean runner; existing service/listeners detected: {occupied}")

    collection = "homebrew_smoke_" + uuid.uuid4().hex
    started = False
    client = None
    try:
        # Set this before invocation so a partially successful start is cleaned up.
        started = True
        brew("services", "start", formula)
        wait_for(healthy, "Milvus did not become healthy after brew services start")
        assert service_status(formula) == "started"
        client = MilvusClient(uri="http://127.0.0.1:19530")
        client.create_collection(
            collection_name=collection, dimension=2, metric_type="L2", consistency_level="Strong"
        )
        row = {"id": 1, "vector": [0.125, 0.25], "payload": "homebrew-persistence"}
        inserted = client.insert(collection_name=collection, data=[row])
        assert inserted["insert_count"] == 1, inserted
        client.flush(collection_name=collection)

        def check_data():
            rows = client.query(
                collection_name=collection, filter="id == 1", output_fields=["id", "payload"]
            )
            assert rows == [{"id": 1, "payload": "homebrew-persistence"}], rows
            hits = client.search(collection_name=collection, data=[[0.125, 0.25]], limit=1)
            assert len(hits) == 1 and hits[0][0]["id"] == 1, hits

        check_data()
        client.close()
        client = None
        # Observe the stopped state before starting again; readiness alone could
        # otherwise accidentally validate the original process.
        brew("services", "stop", formula)
        wait_for(lambda: not any(listening(port) for port in PORTS), "Milvus did not stop", timeout=90)
        assert service_status(formula) != "started"
        brew("services", "start", formula)
        wait_for(healthy, "Milvus did not become healthy after restart")
        assert service_status(formula) == "started"
        client = MilvusClient(uri="http://127.0.0.1:19530")
        assert client.has_collection(collection_name=collection)
        client.load_collection(collection_name=collection)
        check_data()
        client.drop_collection(collection_name=collection)
        print("PASS: install, launchd start/stop, insert/query/search, and restart persistence")
    finally:
        if client is not None:
            client.close()
        if started:
            brew("services", "stop", formula)
            wait_for(lambda: not any(listening(port) for port in PORTS), "Milvus did not stop", timeout=90)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--formula", default="milvus-io/milvus/milvus")
    exercise(parser.parse_args().formula)
