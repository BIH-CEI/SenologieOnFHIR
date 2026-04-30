#!/usr/bin/env python3
"""Convert FML .map files to IG-Publisher-compatible syntax.

Fixes:
  1. /// metadata → classic `map "url" = "name"` declaration
  2. `first` keyword removal (unsupported by IG Publisher's FML parser)
"""

import re
import sys
from pathlib import Path


def convert_metadata(content: str) -> str:
    """Replace /// metadata lines with classic FML map declaration."""
    url = None
    name = None
    other_meta = {}

    kept_lines = []
    for line in content.split("\n"):
        m = re.match(r'^///\s*(\w+)\s*=\s*"(.+?)"', line)
        if m:
            key, val = m.group(1), m.group(2)
            if key == "url":
                url = val
            elif key == "name":
                name = val
            else:
                other_meta[key] = val
        else:
            kept_lines.append(line)

    if not url or not name:
        return content  # no metadata found, return unchanged

    header = f'map "{url}" = "{name}"'

    # Preserve title/status as FML comments
    meta_comments = []
    for key, val in other_meta.items():
        meta_comments.append(f"// {key}: {val}")

    result_lines = [header]
    if meta_comments:
        result_lines.append("")
        result_lines.extend(meta_comments)
    result_lines.append("")

    # Remove leading blank lines from kept content
    while kept_lines and kept_lines[0].strip() == "":
        kept_lines.pop(0)

    result_lines.extend(kept_lines)
    return "\n".join(result_lines)


def remove_first_keyword(content: str) -> str:
    """Remove unsupported 'first' keyword from source rules.

    Handles:
      - `as x first then`  → `as x then`
      - `as x first`       → `as x`
      - `first as x then`  → `as x then`
      - `where ... first then` → `where ... then`
    """
    # Pattern: "first as x" → "as x"
    content = re.sub(r'\bfirst\s+(as\s+\w+)', r'\1', content)
    # Pattern: "as x [where ...] first" → "as x [where ...]"
    content = re.sub(r'(\bas\s+\w+(?:\s+where\s+[^)]+?)?)\s+first\b', r'\1', content)
    return content


def process_file(path: Path, dry_run: bool = False) -> bool:
    """Process a single .map file. Returns True if changes were made."""
    original = path.read_text(encoding="utf-8")
    result = convert_metadata(original)
    result = remove_first_keyword(result)

    if result == original:
        return False

    if dry_run:
        print(f"  [dry-run] {path.name}")
    else:
        path.write_text(result, encoding="utf-8")
        print(f"  [fixed] {path.name}")
    return True


def main():
    dry_run = "--dry-run" in sys.argv
    maps_dir = Path(__file__).parent.parent / "input" / "maps"

    if not maps_dir.exists():
        print(f"Error: {maps_dir} not found")
        sys.exit(1)

    map_files = sorted(maps_dir.glob("*.map"))
    print(f"Processing {len(map_files)} .map files{'  (dry-run)' if dry_run else ''}...")

    changed = 0
    for f in map_files:
        if process_file(f, dry_run):
            changed += 1

    print(f"\n{changed}/{len(map_files)} files {'would be ' if dry_run else ''}modified.")


if __name__ == "__main__":
    main()
