## Module 8: Subscription Plan, Entitlements & Feature Gating

### 1. Scope & Objective
Enforce plan-based capabilities such as project limits, move limits, group limits, archive access, pause/resume access, history depth, and export capability.

### 2. Data Entities involved
- SubscriptionPlan
  - id
  - name
  - display_name
  - description
  - is_active
  - sort_order
- PlanCapability
  - id
  - capability_key
  - display_name
  - description
  - value_type
  - category
- PlanCapabilityValue
  - plan_id
  - capability_id
  - limit_value
- UserSubscription
  - user_id
  - plan_id
  - started_at
  - expires_at
  - is_active

### 3. Strict Functional Acceptance Criteria
- Given a user with no active subscription, when the system evaluates capabilities, then it should use the default free-plan behavior.
- Given a user on a plan with a numeric limit, when the limit is reached, then the relevant action should be blocked with a clear message.
- Given a user on a plan with a boolean capability such as pause/resume or archive access, when the capability is disabled, then the associated action should be blocked.
- Given a user on a plan with a text-based capability such as “unlimited” or “disabled”, when the system evaluates the capability, then it should interpret it correctly.
- Given a user whose subscription has expired, when the system checks entitlements, then it should fallback to the appropriate free-plan limits.
- Given a plan change, when the user’s capabilities change, then subsequent actions should immediately reflect the new entitlements.
- Given a feature that is restricted by plan, when the user attempts it, then the system should return a consistent error message and stop the action before persistence.

### 4. AIDLC Implementation Boundary
- This module must not directly create projects, moves, or reviews.
- It should not render UI or manage user-facing messages beyond structured errors or capability results.
- It must not implement notification delivery.

---