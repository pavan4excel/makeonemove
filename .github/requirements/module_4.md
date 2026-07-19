## Module 4: Move Planning & Weekly Move Management

### 1. Scope & Objective
Manage move records for each project and week, including creation, editing, deletion, primary move selection, completion tracking, and move-copying rules.

### 2. Data Entities involved
- Move
  - id
  - project_id
  - week_key
  - move_text
  - difficulty
  - display_order
  - created_at
- Review
  - project_id
  - week_key
  - moved
  - note
  - momentum
  - primary_move_index
  - completed_move_indices
- Project
  - moves/reviews are week-keyed buckets

### 3. Strict Functional Acceptance Criteria
- Given a project and a specific week, when a user adds a move, then the system should create a new move record for that project and week.
- Given a user adding a move, when the project has reached its plan-defined move limit for that week, then the system should reject the action.
- Given a user editing an existing move, when the move exists, then the text and difficulty should be updated without affecting other moves.
- Given a user deleting a move, when that move exists, then it should be removed from the week and any dependent review indexes should be recalculated.
- Given a user selecting a primary move, when the review for that week does not exist, then the system should create it with the selected primary index.
- Given a user marking a move as completed, when the move exists, then the completion list for that week should be updated.
- Given a user marking all moves as done, when there are moves in the week, then all indices should be added to the completed set.
- Given a user copying moves from one week to the next, when the destination week is within the plan’s allowed move capacity, then the selected moves should be duplicated into that next week.
- Given a user copying moves to the next week, when the destination week has no review yet, then a default review object should be created with primary move index set appropriately.
- Given a user trying to copy moves to a week beyond the plan’s limit, then the system should only copy as many as allowed and stop gracefully.

### 4. AIDLC Implementation Boundary
- This module must not determine the user’s momentum or weekly review outcome.
- It must not manage user plan entitlement except to enforce move limits.
- It must not perform UI state transitions outside the domain of moves and their dependencies.

---