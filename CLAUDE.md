# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

### Development
- **Build image**: `docker build -t claude-code-sandbox .devcontainer/`
- **Open in dev container**: Reopen in Container via VS Code command palette (`Dev Containers: Reopen in Container`)
- **Rebuild container**: VS Code command palette → `Dev Containers: Rebuild Container`
- **Reset Claude data**: run `./cleanup_claude.sh` inside the container, or from the host: `docker volume rm claude-code-sandbox-claude-data`

### Environment
- **Set API key**: `export ANTHROPIC_API_KEY=sk-or-v1-your-key-here`
- **Set base URL**: `export ANTHROPIC_BASE_URL=https://openrouter.ai/api`
- **Set model**: `export ANTHROPIC_MODEL=anthropic/claude-sonnet-4-5`

## Architecture

The repository uses a Docker-based development environment configured in `.devcontainer/`:
- **Dockerfile**: Installs Node.js, zsh, and the claude-code CLI
- **devcontainer.json**: Configures the container with zsh shell and VS Code extensions
- **.env**: Stores API keys and model settings for local development

## Development Setup
1. Clone the repository
2. Copy `.env.example` to `.env` and fill in your API key and model settings
3. Open the folder in VS Code and choose **Reopen in Container** when prompted
4. Use `claude` CLI commands in the integrated terminal

## Notes
- The container uses a non-root user (`claude`) with sudo privileges
- Oh-My-Zsh is pre-configured for a better shell experience
- All development dependencies are installed via the Dockerfile
- Claude settings and shell history persist across rebuilds via the `claude-code-sandbox-claude-data` named volume (`~/.claude/.zsh_history`)