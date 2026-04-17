#!/usr/bin/env python3
"""Convert SKILL.md (Claude Code / Codex) to .mdc (Cursor) format."""

import re
from pathlib import Path

SRC_DIR = Path("/home/claude/growth/skills")
DST_DIR = Path("/home/claude/growth/platforms/cursor/rules")
DST_DIR.mkdir(parents=True, exist_ok=True)

for skill_dir in SRC_DIR.iterdir():
    if not skill_dir.is_dir():
        continue
    skill_md = skill_dir / "SKILL.md"
    if not skill_md.exists():
        continue

    content = skill_md.read_text(encoding="utf-8")

    # Parse frontmatter
    m = re.match(r"^---\n(.*?)\n---\n(.*)$", content, re.DOTALL)
    if not m:
        print(f"skip {skill_md}: no frontmatter")
        continue
    fm_text, body = m.group(1), m.group(2)

    # Extract name and description (simple parse, trusting our own files)
    name_match = re.search(r"^name:\s*(.+)$", fm_text, re.MULTILINE)
    desc_match = re.search(r"^description:\s*(.+)$", fm_text, re.MULTILINE | re.DOTALL)

    name = name_match.group(1).strip() if name_match else skill_dir.name
    # description can span multiple lines until next key or end
    # For our files it's single line. Take as-is.
    description = desc_match.group(1).strip() if desc_match else ""
    # Terminology: skill -> rule (Cursor vocabulary)
    description = description.replace("本 skill", "本 rule").replace("skill。", "rule。")

    mdc = f"""---
description: {description}
globs: 
alwaysApply: false
---
{body}"""

    out_path = DST_DIR / f"{name}.mdc"
    out_path.write_text(mdc, encoding="utf-8")
    print(f"wrote {out_path}")

print("Done.")
