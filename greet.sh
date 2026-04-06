#!/usr/bin/env bash
# greet.sh — Greet a person using a random template.
# Usage: greet.sh <name>
# BUG: no check for empty $1 — crashes with "unbound variable" under set -u
set -euo pipefail

goodbye() {
  echo 'Goodbye from fabro!'
}

NAME="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE=$(shuf -n1 "$SCRIPT_DIR/greetings.conf")
echo "${TEMPLATE/\{name\}/$NAME}"
