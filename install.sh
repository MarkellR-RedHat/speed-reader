#!/bin/bash
# install.sh -- Install ai-bu-speed-reader commands into Claude Code
#
# Copies all speedread command files to ~/.claude/commands/ so they are
# available as slash commands in Claude Code. Safe to re-run; existing
# command files with the same names will be overwritten with the latest
# versions.

set -euo pipefail

COMMANDS_DIR="$HOME/.claude/commands"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/commands"

# Verify source commands exist
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: commands/ directory not found at $SOURCE_DIR"
    echo "Are you running this from the ai-bu-speed-reader repository root?"
    exit 1
fi

echo "Installing ai-bu-speed-reader commands..."
echo ""

mkdir -p "$COMMANDS_DIR"

# Copy all command files
installed=0
for cmd_file in "$SOURCE_DIR"/speedread*.md; do
    if [ -f "$cmd_file" ]; then
        cp "$cmd_file" "$COMMANDS_DIR/"
        installed=$((installed + 1))
    fi
done

if [ "$installed" -eq 0 ]; then
    echo "Error: No speedread command files found in $SOURCE_DIR"
    exit 1
fi

echo "Installed $installed commands to $COMMANDS_DIR:"
echo ""
echo "  Core:"
echo "    /speedread             Full structured analysis with chain-of-thought reasoning"
echo "    /speedread-verdict     Should you read this? Decisive verdict, not a summary"
echo "    /speedread-bullets     5-7 bullet points, ready to drop into Slack"
echo ""
echo "  Deep Analysis:"
echo "    /speedread-implement   Translate research into engineering actions and effort estimates"
echo "    /speedread-bias        Skeptical peer review with trust score (1-10)"
echo "    /speedread-chain       Intellectual lineage and pedagogical reading order"
echo "    /speedread-annotate    Inline margin notes from a skeptical senior engineer"
echo ""
echo "  Extraction and Comparison:"
echo "    /speedread-compare     Side-by-side comparison with a clear winner"
echo "    /speedread-extract     Extract every number, tool, limitation, and open question"
echo "    /speedread-questions   Peer-reviewer-quality questions that probe real weaknesses"
echo "    /speedread-eli5        Plain-language explanation for non-technical readers"
echo ""
echo "Done. Restart Claude Code to pick up the new commands."
