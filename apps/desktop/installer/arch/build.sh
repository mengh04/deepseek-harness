#!/usr/bin/env bash
# Pack the linux-x64 unpacked Desktop output and build the local pacman package.
set -euo pipefail
cd "$(dirname "$0")"
root=$(git rev-parse --show-toplevel)
out=$root/apps/desktop/.desktop-build/targets/linux-x64/artifacts/linux-unpacked
test -d "$out"
pkgver=$(node -p "require('$root/apps/desktop/package.json').version" | tr '-' '.')
tarball="deepseek-harness-desktop-$pkgver.tar.zst"
sed -i "s/^pkgver=.*/pkgver=$pkgver/" PKGBUILD
tar --zstd -cf "$tarball" -C "$(dirname "$out")" linux-unpacked
makepkg -f
