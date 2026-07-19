# GitHub Copilot DevOps & Docker Instructions: makeonemove

1. Core Constraints
To keep deployments lightweight on our single VPS server, Copilot must stick to these environment primitives:

Deterministic Images: Always pin an explicit LTS version tag alongside the lightweight OS variant. Never use :latest.

Backend Base: node:20-alpine (or node:22-alpine if running contemporary Node.js runtimes).

Production Variable Isolation: Secrets, API keys, database credentials, and production URLs must never be hardcoded or injected during the build process (ARG). They must be passed strictly at runtime via environment variables (ENV).

The Golden Rule: The final container artifact must only house what is strictly necessary to run the service in production. Compilers, build dependencies, raw TypeScript files, and dev tools must be filtered out.

2. Directory Scoping & Context Restraints
The application uses a monorepo setup. Copilot must be mindful of the compilation build boundaries:

The root workspace folder contains your main .dockerignore file.

Your Docker files reside in docker/api.Dockerfile and docker/web.Dockerfile.

When executing a docker build, the build context must always target the root workspace (.), not the subfolder, so that shared database schemas or configurations in packages/ can be properly resolved.

Build Execution Constraints

*   **Build Context Root:** All Docker images in this project are designed to be built exclusively from the absolute root of the monorepo workspace.
*   **Execution Command Pattern:** Copilot must assume all compilation hooks utilize the following invocation pattern:
    `docker build -f docker/api.Dockerfile .`
*   **Path Resolution:** Because the execution context is the root (`.`), all `COPY` commands within the Dockerfile must utilize full relative paths from the root (e.g., `COPY apps/api/package*.json ./apps/api/`), never localized paths (e.g., `COPY ./package.json`).

*   **Production Variable Isolation:** Secrets, API keys, database credentials, environment modes (like NODE_ENV), and production URLs must never be hardcoded, assigned default values, or injected within the Dockerfile using either the `ARG` or `ENV` keywords. The Dockerfile must remain completely agnostic of specific configuration values. All environment configurations must be supplied strictly at runtime via an external environment file (`.env`) or injected by the host orchestrator (e.g., Coolify/Docker Compose) at container launch.