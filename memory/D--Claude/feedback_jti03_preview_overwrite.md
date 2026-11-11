---
name: feedback-jti03-preview-overwrite
description: "JTI03 work previews - one unnumbered file per video in _out\\work\\preview, overwritten every time (no draft_00N)"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 228b9fbe-1061-48e1-b143-bef5b454ea9c
  modified: 2026-11-11T09:12:13.388Z
---

Work previews for JTI03 have no version numbers: `E:\JTI_03\_out\work\preview\JTI03_PVnn_preview_draft.mp4`, overwritten on every new render. Do not create `..._draft_003`, `_004` etc. any more.

**Why:** the user asked on 2026-11-11 ("зроби прев'ю драфти без попередніх версій, просто надписуй їх постійно") - numbered drafts piled up in dated work folders.

**How to apply:** encode the preview straight into the fixed name (overwrite without asking, this file only). PNG frame folders from the render queue still go to a new folder per render (render queue items are never removed). Client versions are a separate rule: `_out\client\<date>\` with the next number, only on the user's command. See [[jti03-render-queue-not-aerender]].
