## Module 5: Weekly Review & Reflection

### 1. Scope & Objective
Support the weekly reflection process by allowing users to record whether progress happened, add a note, select momentum, and decide follow-up actions such as copying moves or closing projects.

### 2. Data Entities involved
- Review
  - project_id
  - week_key
  - moved
  - note
  - momentum
  - primary_move_index
  - completed_move_indices
- Move
- Project
  - status

### 3. Strict Functional Acceptance Criteria
- Given a project and a week, when the user records momentum as green, then the review should store a green status.
- Given a project and a week, when the user records momentum as yellow, then the review should store a yellow status and allow optional move selection for follow-up copying.
- Given a project and a week, when the user records momentum as red, then the review should store a red status and allow optional next-week copying or pause-related follow-up.
- Given a user entering a note for a review, when the note is saved, then it should be stored against that week’s review.
- Given a user clearing a review value, when they remove momentum or note, then the system should persist the cleared state.
- Given a user selecting a set of moves for follow-up, when they confirm the action, then those selected moves should be copied to the next week.
- Given a user marking all moves as done from the review experience, when the action succeeds, then all move indices should be marked as completed.
- Given a user closing a project from the review screen, when the action succeeds, then the project’s status should change to closed.
- Given a user reopening a project from the review screen, when the action succeeds, then the project should return to active status if allowed.
- Given a user reviewing a week with no moves, when they save momentum, then the review should still be stored successfully.

### 4. AIDLC Implementation Boundary
- This module must not manage plan entitlements beyond the capability checks that influence available follow-up actions.
- It must not implement the full analytics/history layer.
- It must not decide how the weekly review screen is rendered.

---