#!/usr/bin/env bash
set -e

URL="https://dl.pstmn.io/download/latest/linux_64"
FILE="postman.tar.gz"
DEST_DIR="postman"

echo "Descargando Postman..."
curl -L "$URL" -o "$FILE"

echo "Descomprimiendo..."
mkdir -p "$DEST_DIR"
tar -xzf "$FILE" -C "$DEST_DIR"

echo "Limpieza..."
rm "$FILE"

echo "Postman descargado en ./$DEST_DIR"
