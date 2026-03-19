# test-greeter

A shell-based greeting tool that picks a random greeting template and personalizes it.

## Usage

```bash
./greet.sh Alice
# => "Hello, Alice!" (or another random greeting)
```

## Testing

```bash
./test.sh
```

## Files

- `greet.sh` — Main script, reads name and prints greeting from template
- `greetings.conf` — Greeting templates (one per line, `{name}` placeholder)
- `test.sh` — Test runner (exit 0 = pass, exit 1 = fail)

<!-- smoke test -->
