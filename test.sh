#!/usr/bin/env bash
# test.sh — Test runner for greet.sh
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PASS=0; FAIL=0

# Test basic greeting
output=$("$SCRIPT_DIR/greet.sh" "Alice")
if [[ "$output" == *"Alice"* ]]; then
  ((PASS++))
else
  echo "FAIL: basic greeting does not contain 'Alice': $output"
  ((FAIL++))
fi

# Test another name
output=$("$SCRIPT_DIR/greet.sh" "Bob")
if [[ "$output" == *"Bob"* ]]; then
  ((PASS++))
else
  echo "FAIL: greeting does not contain 'Bob': $output"
  ((FAIL++))
fi

# Test empty input (commented out — this is the bug)
# output=$("$SCRIPT_DIR/greet.sh" "")

echo "Tests: $PASS passed, $FAIL failed"
[[ $FAIL -eq 0 ]]
