FROM node:22-bookworm-slim

# System deps + zsh
RUN apt-get update && apt-get install -y \
    zsh git curl sudo \
    && rm -rf /var/lib/apt/lists/*

# Non-root user
ARG USERNAME=claude
RUN groupadd --gid 1000 $USERNAME \
    && useradd --uid 1000 --gid 1000 -m -s /bin/zsh $USERNAME \
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
EOF

WORKDIR /workspace