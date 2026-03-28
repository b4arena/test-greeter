#!/usr/bin/env bash
# test.sh — Test runner for greet.sh
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PASS=0; FAIL=0

# Test basic greeting
output=$("$SCRIPT_DIR/greet.sh" "Alice")
if [[ "$output" == *"Alice"* ]]; then
  PASS=$((PASS + 1))
else
  echo "FAIL: basic greeting does not contain 'Alice': $output"
  FAIL=$((FAIL + 1))
fi

# Test another name
output=$("$SCRIPT_DIR/greet.sh" "Bob")
if [[ "$output" == *"Bob"* ]]; then
  PASS=$((PASS + 1))
else
  echo "FAIL: greeting does not contain 'Bob': $output"
  FAIL=$((FAIL + 1))
fi

# Test empty input
if "$SCRIPT_DIR/greet.sh" "" >/dev/null 2>&1; then
  echo "FAIL: empty input should return a usage error"
  FAIL=$((FAIL + 1))
else
  PASS=$((PASS + 1))
fi

echo "Tests: $PASS passed, $FAIL failed"
[[ $FAIL -eq 0 ]]
