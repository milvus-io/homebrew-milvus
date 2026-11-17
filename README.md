# homebrew-milvus

homebrew for milvus ecosystem

## how to usage

Add a new brew tap

```
brew tap milvus-io/milvus
```

- install milvusctl

```
brew install milvusctl
```

- install attu

```
brew install --cask attu
```

## Milvus standalone on macOS (draft)

The candidate formula updates Milvus to 3.0.6 and builds its native dependencies
from source. The default profile is one local standalone instance with embedded
etcd, local object storage and a local Woodpecker WAL. This profile and the release
selection are proposals for [milvus#32445](https://github.com/milvus-io/milvus/issues/32445),
pending maintainer review and native CI validation.

```sh
brew tap milvus-io/milvus
brew trust --formula milvus-io/milvus/milvus
brew install milvus-io/milvus/milvus
brew services start milvus-io/milvus/milvus
curl --fail http://127.0.0.1:9091/healthz
brew services stop milvus-io/milvus/milvus
```

The service runs in the foreground under launchd; the formula does not start a
service during installation. Stop existing Milvus or etcd processes using ports
19530, 9091, 2379 or 2380 before starting this instance.

| Location | Purpose |
| --- | --- |
| `$(brew --prefix)/etc/milvus` | `milvus.yaml`, user overrides and embedded-etcd configuration |
| `$(brew --prefix)/var/lib/milvus` | Persistent metadata, local objects and WAL |
| `$(brew --prefix)/var/log/milvus` | Application and launchd output logs |

Configuration is created only if absent. Reinstalling/upgrading preserves edits
and uninstalling does not delete data. Compare preserved configuration with the
new release defaults in `$(brew --prefix milvus-io/milvus/milvus)/share/milvus/configs`
before a version upgrade. This is not a tested 2.1-to-3.0 data migration.

For a foreground run, use `milvus run standalone`. `MILVUSCONF` may point at a
different configuration directory. The wrapper resolves native libraries through
the installed formula and LLVM runtime; it does not use the source/build tree.

### Native verification

The workflow checks Ruby syntax/style, builds the formula on a macOS runner,
checks installed linkage, then starts/stops the actual `brew services` service.
Its SDK smoke test writes a unique collection, flushes it, stops the process,
starts a new process and verifies both query and vector search after restart.
It refuses to run over an existing local instance and stops the service it starts.

```sh
python3 -m venv .venv
.venv/bin/pip install pymilvus==3.0.3
.venv/bin/python test/service_smoke.py
```

A successful source build on one runner does not establish support for every
macOS release or both CPU architectures. Record the actual runner architecture
and results when reviewing this draft. Source builds fetch the upstream Go,
Cargo and pinned Conan dependencies and can take substantial time/disk space.
