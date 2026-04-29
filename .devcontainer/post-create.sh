#!/bin/bash
set -e

# Persist .claude config dir on the host volume
mkdir -p /workspace/.claude
ln -sfn /workspace/.claude /home/claude/.claude

echo "✅ Claude Code ready: $(claude --version)"
