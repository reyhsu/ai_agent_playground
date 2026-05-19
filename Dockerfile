FROM node:22-bookworm-slim

# 避免 apt 卡互動
ENV DEBIAN_FRONTEND=noninteractive

# Google Cloud SDK 使用的 Python
ENV CLOUDSDK_PYTHON=/usr/bin/python3

# Gemini Vertex AI
ENV GOOGLE_GENAI_USE_VERTEXAI=true
ENV GOOGLE_CLOUD_PROJECT=gemini-enterprice-poc
ENV GOOGLE_CLOUD_LOCATION=us-central1

# 安裝必要套件
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    wget \
    ca-certificates \
    git \
    bash \
    && rm -rf /var/lib/apt/lists/*

# 安裝 Google Cloud CLI
RUN wget -q https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz && \
    tar -xf google-cloud-cli-linux-x86_64.tar.gz && \
    ./google-cloud-sdk/install.sh --quiet && \
    rm google-cloud-cli-linux-x86_64.tar.gz

# 加入 PATH
ENV PATH="/google-cloud-sdk/bin:${PATH}"

# 安裝 Gemini CLI
RUN npm install -g @google/gemini-cli

# 工作目錄
WORKDIR /app

# 預設 shell
CMD ["/bin/bash", "-c", "sleep infinity"]