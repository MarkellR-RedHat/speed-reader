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
cp "$SCRIPT_DIR/commands/speedread-annotate.md" "$COMMANDS_DIR/speedread-annotate.md"
cp "$SCRIPT_DIR/commands/speedread-questions.md" "$COMMANDS_DIR/speedread-questions.md"
cp "$SCRIPT_DIR/commands/speedread-extract.md" "$COMMANDS_DIR/speedread-extract.md"
cp "$SCRIPT_DIR/commands/speedread-eli5.md" "$COMMANDS_DIR/speedread-eli5.md"

echo "Installed commands to $COMMANDS_DIR:"
echo "  /speedread           - Structured summary of a paper or doc"
echo "  /speedread-compare   - Side-by-side comparison of two docs"
echo "  /speedread-bullets   - 5-7 bullet point quick summary"
echo "  /speedread-annotate  - Annotated version with inline commentary"
echo "  /speedread-questions - Discussion questions for meeting prep"
echo "  /speedread-extract   - Extract numbers, tools, future work, limitations"
echo "  /speedread-eli5      - Plain-language explanation for non-technical readers"
echo ""
echo "Done. Restart Claude Code to pick up the new commands."
