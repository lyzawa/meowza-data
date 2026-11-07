#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

openssl pkeyutl -sign -rawin -inkey "$HOME/.config/meowza/prefix-ed25519.pem" -in chat.json | base64 -w0 > chat.json.sig
