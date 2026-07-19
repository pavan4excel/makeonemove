📝 Today's Architecture & AI Lifecycle Learnings
1. High-Level Project Tech Stack & Architecture
Cross-Platform Delivery: Settled on a unified codebase strategy using a Progressive Web App (PWA) via Next.js or a cross-platform framework like Flutter to dynamically target desktop and mobile viewports effortlessly from a single codebase.

Lightweight VPS Infrastructure: Designed a highly resource-efficient backend using Node.js/Fastify coupled with PostgreSQL, leveraging a Redis/BullMQ background worker layer to process occasional push notifications asynchronously.

Push Notification Routing: Recognized that native mobile devices must be woken up via platform gateways; integrated Firebase Cloud Messaging (FCM) as the unified, free API abstraction for iOS, Android, and Web Push.

Self-Hosted PaaS Orchestration: Selected Coolify / Dokku on top of Docker Compose to build a modern, GitOps-driven deployment workflow, giving a raw VPS the automated capabilities of a premium managed host.

2. Multi-Layer AI Guardrail Strategy
Single Source of Truth (SSoT): Discovered the pattern of separating specialized instruction sets. Instead of overloading a single text file, we structured instructions into logical domains: global architecture rules reside at the root (.github/copilot-instructions.md), while specific environment build protocols live within their corresponding modules (docker/docker-instructions.md).

Prompt Attention Engineering: Realized that AI models weigh immediate prompt text heavier than background config files. Even with instruction documents present, passing brief, contextual "anchors" (like explicitly stating the workspace build context path) guarantees flawless execution.

Output Profile Constraints: Formulated a "Zero Questions" prompt template to force the AI model into an binary state: either verify a technical document as production-ready using custom shorthand validation keys, or systematically call out missing edge-cases.

3. Production Hardening & Change Management
Strict Parameter Isolation: Hardened the Docker execution profile by completely banning the hardcoding of environmental states or config flags (ENV/ARG) inside the Dockerfile. The configuration remains strictly agnostic, deferring all injections entirely to the orchestrator at runtime.

Workspace Cleanliness & Caching Rules: Locked down the build context to the repository root (.) to accurately map across monorepo package boundaries (apps/ and packages/). Enforced direct runtime binary execution (CMD ["node", ...]) over shell managers like npm start to gracefully hand off OS shutdown signals.

Sandbox Iteration Loop: Established a fast, non-destructive prototyping cadence using Git: isolate and commit documentation edits first, then use target sandbox file outputs (*.sandbox) or git checkout discards to rapidly pressure-test code variations until they achieve absolute stability.

BM: Even after all specifications, copilot, may be because of free version, failed to obey and hardcoded the production variables, when I asked to fix it, it removed the code. 
The docker it generated failed and I copy pasted the error to fix it. which it did now. 