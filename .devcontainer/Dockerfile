FROM node:lts-alpine

# System deps
RUN apk add --no-cache \
    git \
    curl \
    sudo \
    bash \
    shadow

# Non-root user (node:bookworm already has uid/gid 1000 as "node", rename it)
ARG USERNAME=claude
RUN groupmod -n $USERNAME node \
    && usermod -l $USERNAME -s /bin/bash -m -d /home/$USERNAME node \
    && echo "$USERNAME ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Claude Code CLI
RUN npm install -g @anthropic-ai/claude-code

COPY .bashrc /tmp/.bashrc
COPY post-create.sh /usr/local/bin/post-create.sh
COPY post-start.sh /usr/local/bin/post-start.sh
RUN chmod +x /usr/local/bin/post-create.sh /usr/local/bin/post-start.sh

USER $USERNAME

RUN cat /tmp/.bashrc >> /home/$USERNAME/.bashrc

WORKDIR /workspace
