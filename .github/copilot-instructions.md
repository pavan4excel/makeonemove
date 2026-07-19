# GitHub Copilot System Architecture Instructions: makeonemove

This document establishes the architectural blueprint, technology constraints, and patterns for the **makeonemove** application. GitHub Copilot should strictly adhere to the guidelines, folder structures, and implementation rules outlined below when generating code, configurations, or schemas.

---

## 1. Architectural Overview

The **makeonemove** application is designed as a lightweight, resource-optimized, cross-platform app deployed via Docker containers on a single VPS virtual machine. 

### High-Level Blueprint
* **Cross-Platform Access:** Single unified Progressive Web App (PWA) client addressing Desktop, iOS, and Android screen form factors.
* **API Layer:** Stateless, high-concurrency asynchronous API server.
* **State Management:** Relational database for transactional data combined with an in-memory store for background queuing.
* **Notification Layer:** Unified push notification delivery across multiple platforms using a singular gateway API.
* **Orchestration:** GitOps-driven deployment running containerized microservices managed via an open-source PaaS layer on top of raw Docker Compose.

---

## 2. Technology Stack & Constraints

Copilot must generate code exclusively within these technology boundaries:

| Layer | Component | Version / Target Constraint |
| :--- | :--- | :--- |
| **Frontend** | React + Next.js (App Router) | TailwindCSS, TypeScript, PWA Service Workers |
| **Backend** | Node.js + Fastify (or Express) | TypeScript, Asynchronous I/O, RESTful patterns |
| **Database** | PostgreSQL | Prisma ORM (TypeScript-safe schema definitions) |
| **Caching/Queue** | Redis | BullMQ for asynchronous notification queuing |
| **Notifications** | Web Push API & Firebase (FCM) | Admin SDK integration for iOS/Android/Web targeting |
| **Deployment** | Docker & Docker Compose | Optimized multi-stage builds, Coolify-compatible configuration |

---

## 3. Directory Layout & Repository Structure

Copilot must organize all code using the following monorepo pattern:

```text
makeonemove/
├── .github/
│   └── workflows/          # CI/CD verification pipelines
├── apps/
│   ├── web/                # Next.js PWA Client (Desktop & Mobile viewports)
│   │   ├── src/app/        # App Router pages and layouts
│   │   └── public/         # Manifest, icons, and worker scripts
│   └── api/                # Fastify Backend Server
│       ├── src/routes/     # API Endpoints
│       └── src/services/   # Push Notifications & Business logic
├── packages/
│   ├── database/           # Prisma schema and shared DB clients
│   └── config/             # Shared TypeScript, ESLint, Tailwind configs
├── docker/
│   ├── web.Dockerfile      # Multi-stage build for frontend production
│   └── api.Dockerfile      # Lightweight Alpine-based API build
├── docker-compose.yml      # Multi-container local orchestration
└── README.md
```

---