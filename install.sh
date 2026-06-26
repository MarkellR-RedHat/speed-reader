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
cp "$SCRIPT_DIR/commands/speedread-verdict.md" "$COMMANDS_DIR/speedread-verdict.md"
cp "$SCRIPT_DIR/commands/speedread-chain.md" "$COMMANDS_DIR/speedread-chain.md"
cp "$SCRIPT_DIR/commands/speedread-implement.md" "$COMMANDS_DIR/speedread-implement.md"
cp "$SCRIPT_DIR/commands/speedread-bias.md" "$COMMANDS_DIR/speedread-bias.md"

echo "Installed commands to $COMMANDS_DIR:"
echo ""
echo "  Core:"
echo "  /speedread             - Structured summary with chain-of-thought analysis"
echo "  /speedread-verdict     - Should you read this? One-sentence verdict + hot take"
echo "  /speedread-bullets     - 5-7 bullet points, ready to drop into Slack"
echo ""
echo "  Deep Analysis:"
echo "  /speedread-implement   - Translate research into engineering actions and effort estimates"
echo "  /speedread-bias        - Methodology audit with trust score (1-10)"
echo "  /speedread-chain       - Citation chain analysis and recommended reading order"
echo "  /speedread-annotate    - Annotated version with inline critical commentary"
echo ""
echo "  Extraction and Comparison:"
echo "  /speedread-compare     - Side-by-side comparison of two documents"
echo "  /speedread-extract     - Extract every number, tool, limitation, and open question"
echo "  /speedread-questions   - Peer-reviewer-quality discussion questions"
echo "  /speedread-eli5        - Plain-language explanation for non-technical readers"
echo ""
echo "Done. Restart Claude Code to pick up the new commands."
