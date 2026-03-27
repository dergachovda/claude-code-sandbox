FROM node:22-bookworm-slim

# System deps
RUN apt-get update && apt-get install -y \
    git \
    curl \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Non-root user (node:bookworm already has uid/gid 1000 as "node", rename it)
ARG USERNAME=claude
RUN groupmod -n $USERNAME node \
    && usermod -l $USERNAME -s /bin/bash -m -d /home/$USERNAME node \
    && echo "$USERNAME ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Claude Code CLI
RUN npm install -g @anthropic-ai/claude-code

USER $USERNAME

RUN cat >> /home/$USERNAME/.bashrc << 'EOF'

# Claude Code / OpenRouter
export ANTHROPIC_BASE_URL="${ANTHROPIC_BASE_URL:-https://openrouter.ai/api}"
export ANTHROPIC_API_KEY="${ANTHROPIC_API_KEY}"
export ANTHROPIC_MODEL="${ANTHROPIC_MODEL:-anthropic/claude-sonnet-4-5}"
export ANTHROPIC_SMALL_FAST_MODEL="${ANTHROPIC_SMALL_FAST_MODEL:-google/gemini-2.5-flash}"

mkdir -p "$HOME/.claude"
export HISTFILE="$HOME/.bash_history"
export HISTSIZE=10000
export HISTFILESIZE=10000
EOF

# Store a seed copy of the home dir so postCreateCommand can initialize an empty bind-mount
USER root
RUN cp -a /home/${USERNAME}/. /opt/home-seed/ \
    && chown -R root:root /opt/home-seed
USER $USERNAME

WORKDIR /workspace
