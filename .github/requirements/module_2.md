## Module 2: Workspace & Group Management

### 1. Scope & Objective
Manage user-defined workspaces/groups used to organize projects and define the active context for the user.

### 2. Data Entities involved
- Group
  - id
  - user_id
  - name
  - emoji
  - created_at
  - updated_at
- Project
  - group_id (optional)
- UserSettings
  - active_group_id

### 3. Strict Functional Acceptance Criteria
- Given a user with no groups, when they first load the app, then the system should create a default group automatically.
- Given a user creating a new group, when they provide a non-empty name, then the group should be created with optional emoji and saved under that user.
- Given a user editing a group, when they change its name or emoji, then the update should persist immediately.
- Given a user selecting a group as active, when they confirm the selection, then that group should become the current workspace context.
- Given a user deleting a group, when the group has associated projects, then the system should block deletion and return a clear error.
- Given a user deleting a group, when the group has no associated projects and it is not the last remaining group, then the deletion should succeed.
- Given a user attempting to delete the last remaining group, when the system would otherwise have no group left, then it must block the action.
- Given a user whose plan has a maximum group/workspace limit, when they attempt to exceed that limit, then the system should reject the creation and return a plan-limit error.
- Given a user with projects in a deleted group, when deletion is blocked, then the projects should remain intact and unchanged.

### 4. AIDLC Implementation Boundary
- This module must not manage projects beyond group assignment and validation.
- It must not implement move/review logic.
- It must not decide visual layout or navigation; it only manages the group domain and its restrictions.

---