#!/bin/bash
set -euo pipefail

llvm_prefix="${1:?Pass the llvm@19 prefix}"
scratch_dir="$(mktemp -d "${TMPDIR:-/tmp}/milvus-native-interop.XXXXXX")"
trap 'rm -rf "$scratch_dir"' EXIT
cd "$scratch_dir"

go version
rustup run 1.92 rustc --version
"$llvm_prefix/bin/llvm-objcopy" --version

cat > smoke.rs <<'RUST'
#[no_mangle]
pub extern "C" fn smoke_answer() -> i32 {
    42
}
RUST
rustup run 1.92 rustc --crate-type staticlib --edition=2021 -O \
    -C embed-bitcode=yes smoke.rs -o libsmoke.a

cat > rustarchive-smoke.pc <<PKGCONFIG
Name: rustarchive-smoke
Description: Rust static archive checked by Go/cgo
Version: 1
Libs: $scratch_dir/libsmoke.a -liconv
PKGCONFIG
export PKG_CONFIG_PATH="$scratch_dir"
export CGO_ENABLED=1
cat > main.go <<'GO'
package main

// #cgo pkg-config: rustarchive-smoke
// int smoke_answer(void);
import "C"

func main() {
    if answer := int(C.smoke_answer()); answer != 42 {
        panic(answer)
    }
    println("Rust archive through Go/cgo: PASS (42)")
}
GO

# Exercise the same security rejection as the full Milvus build first.
if go build -o before main.go > before.log 2>&1; then
    cat before.log
    echo "Expected Go to reject the archive's embedded bitcode" >&2
    exit 1
fi
cat before.log
grep -F 'disallowed LTO section __LLVM,__bitcode' before.log

# Inspect native symbols; Rust 1.92 embeds LLVM 21 IR that LLVM 19's bitcode
# reader cannot decode. The native Mach-O symbol table is sufficient here.
"$llvm_prefix/bin/llvm-nm" --no-llvm-bc --defined-only --extern-only libsmoke.a > symbols-before.txt
"$llvm_prefix/bin/llvm-objcopy" \
    --remove-section=__LLVM,__bitcode --remove-section=__LLVM,__cmdline libsmoke.a
"$llvm_prefix/bin/llvm-nm" --no-llvm-bc --defined-only --extern-only libsmoke.a > symbols-after.txt
diff -u symbols-before.txt symbols-after.txt
go build -o after main.go
./after
