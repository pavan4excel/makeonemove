## Module 3: Project Lifecycle Management

### 1. Scope & Objective
Handle the creation, editing, status changes, and deletion of projects, including plan-based project limits and lifecycle states.

### 2. Data Entities involved
- Project
  - id
  - user_id
  - name
  - start_date
  - end_date
  - status
  - emoji
  - importance
  - ease_of_starting
  - group_id
  - created_at
  - updated_at
- UserSettings
  - current_project_id
- SubscriptionPlan / PlanCapability (derived)
  - active_projects limit
  - pause_resume_projects capability
  - archive_revisit_projects capability

### 3. Strict Functional Acceptance Criteria
- Given a user creating a project, when they provide a valid name and start date, then the project should be created successfully.
- Given a user creating a project, when the start date is in the future, then the system should reject the project with a validation error.
- Given a user creating a project, when the start date is older than the allowed window (current app uses six months back), then the system should reject it.
- Given a user creating a project, when the end date is earlier than today, then the system should reject it.
- Given a user creating a project, when they provide optional metadata such as emoji, importance, ease of starting, and a group, then those values should be saved.
- Given a user editing a project, when they change its basic details, then those updates should persist without affecting unrelated fields.
- Given a user changing a project status to paused or active, when pause/resume is not allowed by their plan, then the action should be rejected with a clear feature restriction error.
- Given a user changing a project status to active or paused, when the plan’s active project limit is exceeded, then the action should be rejected.
- Given a user closing a project, when the action succeeds, then the project should enter a closed state and become unavailable in active planning contexts.
- Given a user reopening a closed or paused project, when it is allowed by plan rules, then the project should return to an active/paused state.
- Given a user deleting a project, when the deletion succeeds, then the project and all associated move/review data should be removed from the user’s workspace.
- Given a user who has no current project selected, when they create a project, then the newly created project should become the default current project.
- Given a user with a plan that restricts active projects, when they attempt to create or reopen a project beyond that limit, then the system should return a plan-limit error before persistence.

### 4. AIDLC Implementation Boundary
- This module must not implement move creation, review scoring, or weekly navigation.
- It must not decide how the UI presents projects.
- It should not send notifications or export data.

---