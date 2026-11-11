---
name: ae-stale-keys-after-script
description: "AE 26.3 bridge - keys/slider values moved by script (removeKey+addKey, setValue) can stay stale in renders though the script reads new values"
metadata:
  node_type: memory
  type: reference
  originSessionId: 228b9fbe-1061-48e1-b143-bef5b454ea9c
  modified: 2026-11-10T22:44:27.343Z
---

In AE 26.3 via the MCP bridge (JTI03, 2026-11-10), shifting keyframes with removeKey/addKey/setValueAtKey and changing a slider with setValue left the RENDER on the old timing, while valueAtTime() in scripts already returned the new values. app.purge(ALL_CACHES) did not help.

Fix that worked: "touch" every key (setValueAtKey to value+0.001, then back), reassign every expression (expr+" " then expr), and nudge slider values the same way. Then the render matched.

The same session also ignored layer `enabled` changes, a comp duplicated by script (rendered as nothing) and even a whole master re-render (PV02 draft looked old: missing logo, old relay timing). What fixed all of it: reopening the .aep (ae_open_project with saveFirst, needs the bridge guard off). After that every frame matched the script state.

**How to apply:** after any scripted retiming, check by rendering a frame at the changed time (not by reading values); if stale, run the touch pass; after big scripted changes (new comps, enabled flags) just save and reopen the project before the queue render, and compare a few draft frames with fresh ae_render_frame shots. See [[ae-bridge-guard]].
