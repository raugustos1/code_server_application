# Dockerfile.code-server

FROM lscr.io/linuxserver/code-server:latest

USER root

# 1) dependências básicas
RUN apt-get update \
  && apt-get install -y \
       curl \
       gnupg2 \
       lsb-release \
  && rm -rf /var/lib/apt/lists/*

# 2) Node.js 20.x + npm
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
  && apt-get update \
  && apt-get install -y nodejs \
  && rm -rf /var/lib/apt/lists/*

# 3) pnpm globalmente (sem depender de Corepack em runtime)
RUN npm install -g pnpm

# (Opcional) outras CLIs do seu fluxo
# RUN npm install -g supabase

# não definimos USER aqui: o entrypoint do LinuxServer
# vai chown /config e então rodar como o usuário correto
