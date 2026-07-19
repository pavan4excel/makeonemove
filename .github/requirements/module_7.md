## Module 7: Momentum History & Insight Generation

### 1. Scope & Objective
Aggregate weekly review data into a momentum history view so users can see past progress and understand how projects are trending.

### 2. Data Entities involved
- Review
  - week_key
  - momentum
  - note
  - completed_move_indices
- Move
- Project

### 3. Strict Functional Acceptance Criteria
- Given a project with one or more historical reviews, when the user views momentum history, then the system should return the most recent available weeks in chronological order.
- Given a project with no historical reviews, when the user views momentum history, then the system should return an empty state.
- Given a user on a plan that disables extended history, when they request historical weeks beyond the allowed count, then the system should limit results according to the plan capability.
- Given a user with a numeric history limit, when they view momentum history, then the system should display only up to the allowed number of weeks.
- Given a review with a momentum value and note, when the history is rendered, then both should be visible in the history card.
- Given a review with completed moves, when the history is rendered, then the system should compute and display an insight summarizing completed versus carried-forward moves.
- Given a project with multiple review weeks, when the history is requested, then the system should compile them from the review records rather than from separate local caches.

### 4. AIDLC Implementation Boundary
- This module must not create or edit reviews; it only reads and summarizes them.
- It must not decide the plan rules itself beyond reading capabilities from the entitlements module.
- It must not perform notifications or export features.

---