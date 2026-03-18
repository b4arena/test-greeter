# test-greeter

A greeting tool that picks a random greeting template and personalizes it.
Available as both a shell script and a Python module.

## Usage

### Shell

```bash
./greet.sh Alice
# => "Hello, Alice!" (or another random greeting)
```

### Python

```bash
python greet.py Alice
# => "Hello, Alice!" (or another random greeting)
```

Or use the `greet` entry point after installing:

```bash
pip install -e .
greet Alice
```

## Testing

### Shell tests

```bash
./test.sh
```

### Python tests

```bash
# With uv (recommended)
uv venv .venv && uv pip install pytest --python .venv/bin/python
.venv/bin/pytest test_greet.py -v

# Or with an existing pytest install
pytest test_greet.py -v
```

## Files

- `greet.sh` — Shell script entry point
- `greet.py` — Python entry point (fixes empty-name crash from `greet.sh`)
- `greetings.conf` — Greeting templates (one per line, `{name}` placeholder)
- `test.sh` — Shell test runner (exit 0 = pass, exit 1 = fail)
- `test_greet.py` — Python tests (pytest)
- `pyproject.toml` — Python project metadata
