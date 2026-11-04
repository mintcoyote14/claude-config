---
name: ae-bridge-guard
description: AE MCP Bridge sandbox guard refuses edits after a save-as to a new .aep; needs the user in the panel
metadata:
  type: reference
---

The AE MCP Bridge sandbox guard is tied to one .aep. After `app.project.save(new File(...))` to a new version it refused all edits, and `ae_open_project` also needs the guard off, so only the user can fix it (panel: set the new file as sandbox or unlock). When a new version is needed, expect this and tell the user up front.

In `ae_run_jsx`, concatenating an array property value into a string (`"x" + l.transform.position.value`) throws "invalid numeric result"; read components instead (`value[0]`). See [[jti03-render-queue-not-aerender]].
