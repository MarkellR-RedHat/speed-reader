#!/bin/bash
# install.sh - Install ai-bu-speed-reader commands into Claude Code

set -e

COMMANDS_DIR="$HOME/.claude/commands"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing ai-bu-speed-reader commands..."

mkdir -p "$COMMANDS_DIR"

cp "$SCRIPT_DIR/commands/speedread.md" "$COMMANDS_DIR/speedread.md"
cp "$SCRIPT_DIR/commands/speedread-compare.md" "$COMMANDS_DIR/speedread-compare.md"
cp "$SCRIPT_DIR/commands/speedread-bullets.md" "$COMMANDS_DIR/speedread-bullets.md"

echo "Installed commands to $COMMANDS_DIR:"
echo "  /speedread          - Structured summary of a paper or doc"
echo "  /speedread-compare  - Side-by-side comparison of two docs"
echo "  /speedread-bullets  - 5-7 bullet point quick summary"
echo ""
echo "Done. Restart Claude Code to pick up the new commands."
