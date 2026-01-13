# Stage 1: Build
FROM node:18-alpine AS builder
WORKDIR /app

# Install build tools in case npm ci needs them
RUN apk add --no-cache python3 make g++

COPY package*.json ./
RUN npm ci

COPY . .

# Stage 2: Runtime
FROM node:18-alpine
WORKDIR /app
ENV NODE_ENV=production

RUN apk add --no-cache bash dos2unix

# 2. Copy artifacts from builder
COPY --from=builder /app .

RUN dos2unix start.sh setup.sh && \
    chmod +x start.sh setup.sh && \
    chown -R node:node /app

ENTRYPOINT []

USER node

CMD ["/bin/bash", "./start.sh"]