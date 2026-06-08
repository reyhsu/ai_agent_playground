FROM node:24.4.1-bullseye

# 安裝 Claude Code
# RUN npm install -g @anthropic-ai/claude-code

# 安裝 Gemini CLI
#RUN npm install -g @google/gemini-cli

# 安裝 Antigravity CLI
RUN curl -fsSL https://antigravity.google/cli/install.sh | bash

RUN mkdir -p /app
WORKDIR /app

CMD ["/bin/bash", "-c", "sleep infinity"]
