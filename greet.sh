#!/usr/bin/env bash
# greet.sh — Greet a person using a random template.
# Usage: greet.sh [--formal] <name>
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

FORMAL=0
if [[ "${1:-}" == "--formal" ]]; then
  FORMAL=1
  shift
fi

NAME="${1:-}"
if [[ -z "$NAME" ]]; then
  echo "Usage: greet.sh [--formal] <name>" >&2
  exit 1
fi

if [[ $FORMAL -eq 1 ]]; then
  CONF="$SCRIPT_DIR/formal-greetings.conf"
else
  CONF="$SCRIPT_DIR/greetings.conf"
fi

TEMPLATE=$(shuf -n1 "$CONF")
echo "${TEMPLATE/\{name\}/$NAME}"
