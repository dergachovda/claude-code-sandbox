# claude-code-sandbox

Claude Code Dev Container Sandbox

[openrouter.ai](https://openrouter.ai) is a gateway

This repository provides a development environment for working with the Claude Code API. It includes a Dockerfile that sets up a container with all the necessary dependencies, as well as an example .env file for configuring your API key and model settings.

## Development Setup

1. Clone the repository
2. Copy `.env.example` to `.env` and fill in your API key and model settings
3. Open the folder in VS Code and choose **Reopen in Container** when prompted
4. Use `claude` CLI commands in the integrated terminal

## Commands

### Dev Container
- **Build image**: `docker build -t claude-code-sandbox .devcontainer/`
- **Open in dev container**: VS Code command palette → `Dev Containers: Reopen in Container`
- **Rebuild container**: VS Code command palette → `Dev Containers: Rebuild Container`

### Environment Variables
- **Set API key**: `export ANTHROPIC_API_KEY=sk-or-v1-your-key-here`
- **Set base URL**: `export ANTHROPIC_BASE_URL=https://openrouter.ai/api`
- **Set model**: `export ANTHROPIC_MODEL=anthropic/claude-sonnet-4-5`

## Architecture

The repository uses a Docker-based development environment configured in `.devcontainer/`:
- **Dockerfile**: Installs Node.js, zsh, and the claude-code CLI
- **devcontainer.json**: Configures the container with zsh shell and VS Code extensions
- **.env**: Stores API keys and model settings for local development

## Notes

- The container uses a non-root user (`claude`) with sudo privileges
- Oh-My-Zsh is pre-configured for a better shell experience
- All development dependencies are installed via the Dockerfile
- The `./workspace/` folder is bind-mounted as `/workspace` inside the container — clone projects there and work on them with Claude Code
