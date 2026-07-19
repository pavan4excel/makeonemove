## Module 6: Project Archive & Revisit

### 1. Scope & Objective
Provide a way to preserve closed projects and allow users to revisit them when their plan supports archive functionality.

### 2. Data Entities involved
- Project
  - status
  - archived_at (optional)
- UserSettings
  - active_group_id
- SubscriptionPlan / PlanCapability
  - archive_revisit_projects

### 3. Strict Functional Acceptance Criteria
- Given a project that is closed, when the archive capability is enabled for the user’s plan, then the project should appear in the archived/revisit experience.
- Given a project that is closed, when the archive capability is disabled, then the system should block access to archived functionality and return a feature restriction.
- Given a user reopening a closed project, when allowed, then the project should return to an active or paused state depending on the requested change.
- Given a user browsing archived projects, when they select one, then the system should provide the historical project context including name, dates, and prior move/review history.
- Given a user with no closed projects, when they access archive functionality, then the system should return an empty state rather than error.

### 4. AIDLC Implementation Boundary
- This module must not manage ongoing project planning for active projects.
- It must not modify move/review data unrelated to archive semantics.
- It must not implement export or notification behavior.

---