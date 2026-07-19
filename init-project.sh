#!/usr/bin/env bash
set -euo pipefail

mkdir -p \
  .github/workflows \
  apps/web/src/app \
  apps/web/public \
  apps/api/src/routes \
  apps/api/src/services \
  packages/database \
  packages/config \
  docker

touch \
  README.md \
  package.json \
  .github/workflows/ci.yml \
  apps/web/package.json \
  apps/web/README.md \
  apps/web/public/manifest.json \
  apps/api/package.json \
  apps/api/README.md \
  packages/database/package.json \
  packages/config/package.json \
  docker/web.Dockerfile \
  docker/api.Dockerfile \
  docker-compose.yml