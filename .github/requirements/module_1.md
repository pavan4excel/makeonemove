## Module 1: Authentication & User Bootstrap

### 1. Scope & Objective
Handle user identity, sign-in/sign-out, session persistence, and initial account bootstrap so the user can access their personal project workspace.

### 2. Data Entities involved
- User
  - id
  - email
  - display_name
  - avatar_url
  - created_at
- Session
  - user_id
  - token/session reference
  - expires_at
  - is_active
- UserSettings
  - user_id
  - active_group_id
  - current_project_id
  - app_started
  - dismissed_hints
  - notifications_enabled
  - notification_subscription_ref (optional)

### 3. Strict Functional Acceptance Criteria
- Given an unauthenticated visitor, when they access the app, then they should be presented with an entry experience that prompts authentication.
- Given valid authentication credentials or a valid existing session, when the user signs in, then the system should load their personal workspace state.
- Given a previously authenticated user, when they return later, then their prior session should be restored automatically if still valid.
- Given an expired or invalid session, when the user attempts to use the app, then the system should terminate the session and require re-authentication.
- Given a new authenticated user, when their first session is created, then the system should initialize default workspace settings and create a default group if none exists.
- Given a user who has not dismissed onboarding hints, when the app loads for the first time, then the system should mark the app as started and expose onboarding state correctly.
- Given a user with existing data, when the app loads, then the system should restore their projects, groups, settings, and preferences without data loss.

### 4. AIDLC Implementation Boundary
- This module must not render UI components or manage frontend routing.
- It must not implement business logic for projects, moves, reviews, or plan entitlements beyond user identity and session bootstrapping.
- It should not directly manage browser-specific push subscription mechanics unless the notification module explicitly delegates to it.

---