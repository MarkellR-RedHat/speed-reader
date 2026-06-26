#!/bin/bash
# ============================================================================
# ai-bu-speed-reader installer
#
# Copies all speedread commands to ~/.claude/commands/ so they show up as
# slash commands in Claude Code. Safe to re-run at any time; existing files
# with the same names are overwritten with the latest versions.
# ============================================================================

set -euo pipefail

COMMANDS_DIR="$HOME/.claude/commands"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/commands"

echo ""
echo "  ai-bu-speed-reader"
echo "  Turn 30-page PDFs into actionable intelligence in under a minute."
echo ""

# ---- Verify source directory exists ----------------------------------------

if [ ! -d "$SOURCE_DIR" ]; then
    echo "  ERROR: commands/ directory not found at $SOURCE_DIR"
    echo "  Make sure you are running this from the ai-bu-speed-reader repo root."
    exit 1
fi

# ---- Create target directory ------------------------------------------------

if [ ! -d "$COMMANDS_DIR" ]; then
    echo "  Creating $COMMANDS_DIR ..."
    mkdir -p "$COMMANDS_DIR"
fi

# ---- Copy each command file -------------------------------------------------

installed=0
for cmd_file in "$SOURCE_DIR"/speedread*.md; do
    if [ -f "$cmd_file" ]; then
        name="$(basename "$cmd_file" .md)"
        cp "$cmd_file" "$COMMANDS_DIR/"
        echo "  installed  /$name"
        installed=$((installed + 1))
    fi
done

echo ""

if [ "$installed" -eq 0 ]; then
    echo "  ERROR: No speedread command files found in $SOURCE_DIR"
    echo "  The commands/ directory may be empty or corrupted."
    exit 1
fi

# ---- Done -------------------------------------------------------------------

echo "  $installed commands installed to $COMMANDS_DIR"
echo ""
echo "  Next steps:"
echo "    1. Restart Claude Code (or open a new session)"
echo "    2. Try your first command:"
echo ""
echo "       /speedread-verdict path/to/paper.pdf"
echo ""
