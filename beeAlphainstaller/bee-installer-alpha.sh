#!/data/data/com.termux/files/usr/bin/bash

set -e

DISTRO="bee"
ARCH="arm64"

URL="https://github.com/rebangkkuser/beeOS/releases/download/beeAlpha11.0/beeOS-alpha.tar.xz"
SHA256="982ba82bbad9d2170b663b0d853cb8efed7a50bfcc2ecb8628a6bd40a96aa3f4"

ROOTFS_DIR="$PREFIX/var/lib/proot-distro/installed-rootfs/$DISTRO"
TMP_DIR="$PREFIX/tmp/beeos_install"
FILE="$TMP_DIR/beeOS-alpha.tar.xz"

mkdir -p "$TMP_DIR"
mkdir -p "$ROOTFS_DIR"

curl -L "$URL" -o "$FILE"

echo "$SHA256  $FILE" | sha256sum -c -

tar -xJf "$FILE" -C "$TMP_DIR"

EXTRACTED_DIR=$(find "$TMP_DIR" -mindepth 1 -maxdepth 1 -type d | head -n 1)

cp -rf "$EXTRACTED_DIR"/* "$ROOTFS_DIR/"

rm -rf "$TMP_DIR"

echo "beeOS installed successfully"
echo "run: proot-distro login bee"
