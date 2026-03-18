"""Tests for greet.py"""
import pytest
from pathlib import Path

from greet import greet, load_templates

TEMPLATES_FILE = Path(__file__).parent / "greetings.conf"


def test_basic_greeting_contains_name():
    """Greeting output should contain the requested name."""
    assert "Alice" in greet("Alice", TEMPLATES_FILE)


def test_different_name():
    """Works for different names."""
    assert "Bob" in greet("Bob", TEMPLATES_FILE)


def test_empty_name_raises():
    """Empty name should raise ValueError (fixes the bash set -u crash)."""
    with pytest.raises(ValueError, match="Name must not be empty"):
        greet("", TEMPLATES_FILE)


def test_whitespace_only_name_raises():
    """Whitespace-only name should also raise ValueError."""
    with pytest.raises(ValueError):
        greet("   ", TEMPLATES_FILE)


def test_custom_templates(tmp_path: Path):
    """Custom templates file is respected."""
    t = tmp_path / "custom.conf"
    t.write_text("Hi, {name}!\n")
    assert greet("Carol", t) == "Hi, Carol!"


def test_placeholder_replaced_not_literal(tmp_path: Path):
    """Ensure {name} is replaced, not left as a literal."""
    t = tmp_path / "t.conf"
    t.write_text("Hello, {name}!\n")
    result = greet("Dave", t)
    assert result == "Hello, Dave!"
    assert "{name}" not in result


def test_load_templates_skips_blank_lines(tmp_path: Path):
    """Blank lines in templates file are ignored."""
    t = tmp_path / "t.conf"
    t.write_text("\nHello, {name}!\n\nHi, {name}!\n\n")
    templates = load_templates(t)
    assert len(templates) == 2
    assert all("{name}" in tmpl for tmpl in templates)
