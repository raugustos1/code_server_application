# Dockerfile.code-server

# 1) Partimos da imagem oficial LinuxServer do code-server
FROM lscr.io/linuxserver/code-server:latest

# 2) Como root, instalamos as ferramentas necessárias
USER root

# 2.1) Instalar dependências básicas e Docker CLI
RUN apt-get update \
  && apt-get install -y \
       curl \
       gnupg2 \
       lsb-release \
       docker.io \
  && rm -rf /var/lib/apt/lists/*

# 2.2) Instalar Node.js 20.x via NodeSource (inclui npm)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
  && apt-get update \
  && apt-get install -y nodejs \
  && rm -rf /var/lib/apt/lists/*

# 2.3) Ativar pnpm via Corepack
RUN corepack enable \
  && corepack prepare pnpm@latest --activate

# (Opcional) Instalar aqui outras CLIs do seu fluxo, ex. supabase CLI:
# RUN npm install -g supabase


