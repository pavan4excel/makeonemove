## Module 11: Data Export

### 1. Scope & Objective
Generate exportable project data for user review and backup, especially for projects with moves and review history.

### 2. Data Entities involved
- Project
- Move
- Review
- UserSubscription / PlanCapability
  - export_data_csv

### 3. Strict Functional Acceptance Criteria
- Given a user requesting a project export, when the export capability is allowed by their plan, then the system should generate a CSV file containing project metadata and associated move/review data.
- Given a user requesting an export on a plan where the feature is not allowed, then the system should reject the action and return a clear feature restriction.
- Given a project with no moves or reviews, when exported, then the CSV should still include the project’s metadata and empty sections appropriately.
- Given a project with moves and review records, when exported, then all relevant rows should be represented in a structured format.
- Given a user downloading an export, when the file is generated, then the file name should be deterministic and human-readable.

### 4. AIDLC Implementation Boundary
- This module must not alter project state.
- It must not implement notification or plan enforcement beyond capability checks.
- It must not manage UI rendering of the export button.