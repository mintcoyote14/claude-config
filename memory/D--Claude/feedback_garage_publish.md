---
name: feedback-garage-publish
description: "Garage app: deploy to the live site only after the user agreed the changes and they are verified not to break anything"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 2cd52e8e-3af2-414e-9a30-a10e1af73aa3
  modified: 2026-11-02T11:14:30.964Z
---

Garaż app (garaz-rytmo.pages.dev): publish to the site only when the changes are agreed with the user and checked so that nothing breaks. No deploying right after each edit.

**Why:** real neighbours use the site now (feedback is coming from the building chat); the user said "на сайт публікуй тільки коли погодимо зміни і від них нічого не злетить".

**How to apply:** work on a branch or locally, show changes in a private draft demo, run checks (typecheck, SQL tests, click-through), ask for a go-ahead, then deploy. The same goes for live database migrations and the `notify` function. See [[garage-sharing-app]].
