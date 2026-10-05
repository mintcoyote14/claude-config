---
name: feedback-ae-scripts-english
description: "All UI-facing text and comments inside After Effects scripts (D:\\Scripts) must be in English, even though chat conversation is in Ukrainian"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: f96a1e1f-f091-456f-85c5-3c318a3a51cf
  modified: 2026-09-13T16:35:41.341Z
---

Write all After Effects script content in English: alert()/dialog text, ScriptUI labels, log messages shown to the user, and code comments. This applies to [ae-task-jsx](ae-task-jsx) (the rotating `D:\Scripts\!TASK.jsx` slot) and any standalone script written to `D:\Scripts\`.

**Why:** the user gave this as a standing rule ("всі інтерфейси, пояснення і т.д. в скриптах роби англійською, діалогові вікна теж") — scripts are a separate audience/context from our chat, and matches the existing house style already used in the user's other tools (e.g. `drift_layer.jsx`, which is entirely in English).

**How to apply:** conversation with the user stays in Ukrainian as normal — this rule is scoped only to the content written *inside* `.jsx` files. When editing an existing script that still has Ukrainian text (leftover from before this rule), it's fine to leave untouched unless already touching that section; but any new script or task should be English from the start.
