#!/bin/bash
set -e

# Update Claude Code to the latest version
sudo npm update -g @anthropic-ai/claude-code
echo "✅ Claude Code updated: $(claude --version)"

# Launch Claude Code
echo "Starting Claude Code..."
claude
