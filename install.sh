#!/usr/bin/env bash
# growth - install script
# Usage: ./install.sh <platform>
#   platforms: codex | gemini | cursor | cursor-global
#
# Claude Code users: install via the plugin marketplace instead of this script.
#   /plugin marketplace add YOUR_USERNAME/growth
#   /plugin install growth@growth
# See https://code.claude.com/docs/en/plugin-marketplaces

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLATFORM="${1:-}"

if [[ -z "$PLATFORM" ]]; then
  cat <<EOF
growth — 思考训练 skill 集合

Usage: ./install.sh <platform>

Platforms:
  codex            Install to ~/.codex/skills/
  gemini           Install as Gemini CLI extension (requires gemini CLI)
  cursor           Copy .mdc rules to ./.cursor/rules/ (current project)
  cursor-global    Copy .mdc rules to ~/.cursor/rules/ (user-wide)

For Claude Code, use the plugin marketplace instead:
  /plugin marketplace add YOUR_USERNAME/growth
  /plugin install growth@growth

Example:
  ./install.sh codex
EOF
  exit 1
fi

copy_skills_to() {
  local dst="$1"
  mkdir -p "$dst"
  for skill in taste-audit intent-refine judgment-redteam abstraction-uplift; do
    cp -r "$SCRIPT_DIR/skills/$skill" "$dst/"
    echo "  ✓ installed: $skill"
  done
}

copy_mdc_to() {
  local dst="$1"
  mkdir -p "$dst"
  for mdc in "$SCRIPT_DIR"/platforms/cursor/rules/*.mdc; do
    cp "$mdc" "$dst/"
    echo "  ✓ installed: $(basename "$mdc")"
  done
}

case "$PLATFORM" in
  claude-code)
    cat <<EOF
✗ Claude Code no longer uses this script.

Install via the official plugin marketplace instead:
  /plugin marketplace add YOUR_USERNAME/growth
  /plugin install growth@growth

Docs: https://code.claude.com/docs/en/plugin-marketplaces
EOF
    exit 1
    ;;

  codex)
    DST="$HOME/.codex/skills"
    echo "Installing growth skills to $DST ..."
    copy_skills_to "$DST"
    echo ""
    echo "✓ Done. Restart Codex CLI to load the new skills."
    ;;

  gemini)
    if ! command -v gemini &> /dev/null; then
      echo "✗ 'gemini' CLI not found. Install it first: npm install -g @google/gemini-cli"
      exit 1
    fi
    echo "Installing growth as a Gemini CLI extension ..."
    gemini extensions install "$SCRIPT_DIR/platforms/gemini-cli"
    echo ""
    echo "✓ Done. Run 'gemini extensions list' to verify."
    ;;

  cursor)
    DST="./.cursor/rules"
    echo "Installing growth Cursor rules to $DST (current project) ..."
    copy_mdc_to "$DST"
    echo ""
    echo "✓ Done. Open this project in Cursor and the rules will auto-load."
    ;;

  cursor-global)
    DST="$HOME/.cursor/rules"
    echo "Installing growth Cursor rules to $DST (user-wide) ..."
    copy_mdc_to "$DST"
    echo ""
    echo "✓ Done. Cursor will auto-load these rules across all projects."
    ;;

  *)
    echo "✗ Unknown platform: $PLATFORM"
    echo "Run './install.sh' without arguments to see usage."
    exit 1
    ;;
esac
