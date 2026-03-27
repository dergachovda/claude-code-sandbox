FROM node:22-bookworm-slim

# System deps + zsh
RUN apt-get update && apt-get install -y \
    zsh git curl sudo \
    && rm -rf /var/lib/apt/lists/*

# Non-root user (node:bookworm already has uid/gid 1000 as "node", rename it)
ARG USERNAME=claude
RUN groupmod -n $USERNAME node \
    && usermod -l $USERNAME -s /bin/zsh -m -d /home/$USERNAME node \
    && echo "$USERNAME ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Claude Code CLI (глобально, поки root)
RUN npm install -g @anthropic-ai/claude-code

USER $USERNAME

# Oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# OpenRouter env-и в .zshrc як fallback
RUN cat >> /home/$USERNAME/.zshrc << 'EOF'

# Claude Code / OpenRouter
export ANTHROPIC_BASE_URL="${ANTHROPIC_BASE_URL:-https://openrouter.ai/api}"
export ANTHROPIC_API_KEY="${ANTHROPIC_API_KEY}"
export ANTHROPIC_MODEL="${ANTHROPIC_MODEL:-anthropic/claude-sonnet-4-5}"
export ANTHROPIC_SMALL_FAST_MODEL="${ANTHROPIC_SMALL_FAST_MODEL:-google/gemini-2.5-flash}"

# Persist shell history in the named volume (mounted at ~/.claude)
mkdir -p "$HOME/.claude"
export HISTFILE="$HOME/.claude/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
EOF

WORKDIR /workspace