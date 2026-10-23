---
name: jti03-render-queue-not-aerender
description: "JTI 03 renders must go through AE's own render queue; background aerender (ae_render_video) drops the JSON-driven texts"
metadata:
  node_type: memory
  type: project
  originSessionId: 228b9fbe-1061-48e1-b143-bef5b454ea9c
  modified: 2026-10-22T22:07:25.022Z
---

In JTI 03 (`E:\JTI_03\proj\jti_03_v18.aep`), texts (quotes, names, roles) come from `jti03_structure.json` via expressions. Background aerender (`ae_render_video`) renders them as placeholders ("Name Last / Role") with no quotes. Verified on 2026-10-22.

**Why:** the user got a render without quotes and had to ask again.

**How to apply:** when the user explicitly asks for a render, queue it in the AE render queue and run `app.project.renderQueue.render()` (it blocks the MCP call past 5 min; wait for the file to stop growing). Check 1–2 frames of the mp4 with ffmpeg afterwards.
