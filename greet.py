#!/usr/bin/env python3
"""greet.py — Greet a person using a random template.

Usage:
    python greet.py <name>
    ./greet.py <name>
"""
import random
import sys
from pathlib import Path


def load_templates(path: Path) -> list[str]:
    """Load greeting templates from a file, one per line."""
    lines = path.read_text().splitlines()
    return [line.strip() for line in lines if line.strip()]


def greet(name: str, templates_file: Path | None = None) -> str:
    """Return a random greeting for the given name.

    Args:
        name: The person's name. Must not be empty.
        templates_file: Path to the greeting templates file.
                        Defaults to greetings.conf in the same directory.

    Raises:
        ValueError: If name is empty.
    """
    if not name or not name.strip():
        raise ValueError("Name must not be empty")
    if templates_file is None:
        templates_file = Path(__file__).parent / "greetings.conf"
    templates = load_templates(templates_file)
    template = random.choice(templates)
    return template.replace("{name}", name)


def main() -> None:
    if len(sys.argv) < 2 or not sys.argv[1].strip():
        print("Usage: greet.py <name>", file=sys.stderr)
        sys.exit(1)
    print(greet(sys.argv[1]))


if __name__ == "__main__":
    main()
