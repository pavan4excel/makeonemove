## Module 9: Notifications, Reminder Preferences & Subscription Management

### 1. Scope & Objective
Manage weekly notification preferences and the storage of notification delivery subscriptions so the user can opt in or out of reminders.

### 2. Data Entities involved
- UserSettings
  - notifications_enabled
  - notification_subscription_ref
- NotificationSubscription
  - user_id
  - provider
  - endpoint
  - keys
  - created_at
  - updated_at
- NotificationPreference
  - user_id
  - frequency
  - enabled

### 3. Strict Functional Acceptance Criteria
- Given a user enabling notifications, when the browser/device permission is granted, then the system should store a valid notification subscription.
- Given a user disabling notifications, when the action succeeds, then the stored subscription should be removed or invalidated.
- Given a user who denies notification permission, when they try to enable notifications, then the system should not persist a subscription and should return a clear permission error.
- Given a user with notifications enabled, when their settings are loaded, then the app should reflect that state.
- Given a user who has no notification support, when the feature is toggled, then the system should fail gracefully and preserve the existing state.
- Given a user changing notification preference, when the change is saved, then it should persist across sessions.

### 4. AIDLC Implementation Boundary
- This module must not own the visual toggle UI.
- It must not implement arbitrary email/SMS delivery logic unless explicitly defined as part of the product.
- It should not be responsible for the project or review domain.

---