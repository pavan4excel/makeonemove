# syntax=docker/dockerfile:1.7

FROM node:20-alpine3.20 AS base
WORKDIR /app

FROM base AS deps
COPY apps/api/package.json ./apps/api/package.json
COPY packages/database/package.json ./packages/database/package.json
COPY packages/config/package.json ./packages/config/package.json
COPY package.json ./package.json
RUN npm install --omit=dev --ignore-scripts

FROM base AS runtime
COPY --from=deps /app/node_modules ./node_modules
COPY apps/api ./apps/api
COPY packages/database ./packages/database
COPY packages/config ./packages/config
EXPOSE 3000
CMD ["node", "/app/apps/api/src/index.js"]
