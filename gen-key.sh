#!/usr/bin/env bash
set -euo pipefail

KEY_DIR="$HOME/.config/meowza"
KEY="$KEY_DIR/prefix-ed25519.pem"

mkdir -p "$KEY_DIR"
chmod 700 "$KEY_DIR"

if [ ! -f "$KEY" ]; then
  openssl genpkey -algorithm ed25519 -out "$KEY"
  chmod 600 "$KEY"
fi

openssl pkey -in "$KEY" -pubout -outform DER | base64 -w0
