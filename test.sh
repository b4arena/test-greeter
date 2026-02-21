#!/usr/bin/env bash
# test.sh — Test runner for greet.sh
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PASS=0; FAIL=0

# Helper
assert_contains() {
  local label="$1" output="$2" needle="$3"
  if [[ "$output" == *"$needle"* ]]; then
    PASS=$((PASS + 1))
  else
    echo "FAIL: $label — expected '$needle' in: $output"
    FAIL=$((FAIL + 1))
  fi
}

assert_not_contains() {
  local label="$1" output="$2" needle="$3"
  if [[ "$output" != *"$needle"* ]]; then
    PASS=$((PASS + 1))
  else
    echo "FAIL: $label — did NOT expect '$needle' in: $output"
    FAIL=$((FAIL + 1))
  fi
}

# ── Existing casual tests ─────────────────────────────────────────────────────

output=$("$SCRIPT_DIR/greet.sh" "Alice")
assert_contains "basic greeting contains name" "$output" "Alice"

output=$("$SCRIPT_DIR/greet.sh" "Bob")
assert_contains "greeting contains Bob" "$output" "Bob"

# ── Formal flag tests ─────────────────────────────────────────────────────────

# (a) --formal produces a formal greeting (templates from formal-greetings.conf)
formal_templates=("Dear" "Good evening" "Greetings" "Good day" "esteemed")
output=$("$SCRIPT_DIR/greet.sh" --formal "Alice")
assert_contains "--formal: output contains name" "$output" "Alice"
matched_formal=0
for tmpl in "${formal_templates[@]}"; do
  if [[ "$output" == *"$tmpl"* ]]; then
    matched_formal=1
    break
  fi
done
if [[ $matched_formal -eq 1 ]]; then
  PASS=$((PASS + 1))
else
  echo "FAIL: --formal did not produce a formal greeting: $output"
  FAIL=$((FAIL + 1))
fi

# (b) Omitting --formal still produces a casual greeting
casual_templates=("Hello" "Hey" "Welcome" "Good day")
output=$("$SCRIPT_DIR/greet.sh" "Carol")
assert_contains "casual: output contains name" "$output" "Carol"
matched_casual=0
for tmpl in "${casual_templates[@]}"; do
  if [[ "$output" == *"$tmpl"* ]]; then
    matched_casual=1
    break
  fi
done
if [[ $matched_casual -eq 1 ]]; then
  PASS=$((PASS + 1))
else
  echo "FAIL: casual greeting did not match any casual template: $output"
  FAIL=$((FAIL + 1))
fi

# (c) --formal with a name containing spaces
output=$("$SCRIPT_DIR/greet.sh" --formal "Dr. Jane Smith")
assert_contains "--formal with spaced name contains full name" "$output" "Dr. Jane Smith"

# ── Summary ───────────────────────────────────────────────────────────────────
echo "Tests: $PASS passed, $FAIL failed"
[[ $FAIL -eq 0 ]]
