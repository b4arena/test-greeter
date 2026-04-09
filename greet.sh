#!/usr/bin/env bash
# greet.sh — Greet a person using a random template.
# Usage: greet.sh <name>
set -euo pipefail

if [[ $# -lt 1 ]] || [[ -z "${1:-}" ]]; then
  echo "Usage: greet.sh <name>" >&2
  exit 1
fi

NAME="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE=$(shuf -n1 "$SCRIPT_DIR/greetings.conf")
echo "${TEMPLATE/\{name\}/$NAME}"
