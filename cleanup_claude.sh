#!/bin/bash

# Configuration
CLAUDE_DIR="$HOME/.claude"

# NOTE: Claude settings are stored in a named Docker volume (claude-code-sandbox-claude-data).
# This script removes the directory contents inside the running container, which wipes the volume.
# Alternatively, from the HOST machine run: docker volume rm claude-code-sandbox-claude-data

# Display warning and confirmation
echo "WARNING: This script will remove all Claude Code settings and persistent data"
echo "That includes: $CLAUDE_DIR"
read -p "Are you sure you want to proceed? (y/N) " confirm

# Only proceed if user confirms
if [[ $confirm =~ ^[yY] ]]; then
    echo "Cleaning up..."

    # Remove Claude directory
    if [ -d "$CLAUDE_DIR" ]; then
        rm -rf "$CLAUDE_DIR"
        echo "Removed: $CLAUDE_DIR"
    fi

    echo "Cleanup complete! All Claude Code settings have been removed."
else
    echo "Operation cancelled. No changes were made."
fi
