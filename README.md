# DOKPLOY CODE SERVER

## Premissas
- Dokploy já instalado
- code-server compartilha binários e socket do Docker do host
- Dockerfile instala tudo necessário para rodar o(s) projeto(s)
- code-server roda com UID/GID `1000:1000` (mesmo GID do Docker)

## Project Makerkit
- Node.js 20+ instalado
- `pnpm` instalado globalmente

## Exemplo de `.env` 
```env
CODE_SERVER_IMAGE=lscr.io/linuxserver/code-server:v5.17.0
PUID=1000
PGID=1000
TZ=America/Sao_Paulo
CODE_SERVER_PASSWORD=senha
DOCKER_GID=988  # getent group docker | cut -d: -f3
```
