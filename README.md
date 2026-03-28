# test-greeter

A shell-based greeting tool that picks a random greeting template and personalizes it.

## Usage

```bash
./greet.sh Alice
# => "Hello, Alice!" (or another random greeting)
```

A non-empty name is required. If no name is provided, the script prints:

```text
Usage: ./greet.sh <name>
```

## Testing

```bash
./test.sh
```

## Files

- `greet.sh` — Main script, validates the input name, and prints a greeting from a template
- `greetings.conf` — Greeting templates (one per line, `{name}` placeholder)
- `test.sh` — Test runner (exit 0 = pass, exit 1 = fail)
