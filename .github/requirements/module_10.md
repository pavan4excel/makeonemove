## Module 10: Hints, Onboarding & Welcome Experience

### 1. Scope & Objective
Control the welcome modal, onboarding tour, and contextual hints so first-time users receive guidance without being overwhelmed.

### 2. Data Entities involved
- UserSettings
  - dismissed_hints
  - app_started
- HintState
  - user_id
  - hint_key
  - dismissed_at

### 3. Strict Functional Acceptance Criteria
- Given a new user, when the app is first loaded, then the welcome experience should be available until dismissed.
- Given a user dismissing a hint, when the action is saved, then the hint should not appear again for that user.
- Given a user who creates their first project, when the system detects the “first project” state, then it should trigger the onboarding flow.
- Given a user who has already dismissed the onboarding state, when the app loads, then the onboarding flow should not appear again.
- Given a user with an existing app state, when they revisit the app, then the system should preserve their onboarding completion state.
- Given a user with no projects, when they arrive at the dashboard, then the system should offer a guided path to create a first project.

### 4. AIDLC Implementation Boundary
- This module must not implement actual project creation logic.
- It must not evaluate plan capabilities beyond deciding whether to show certain guidance.
- It must not manage move/review domain data.

---