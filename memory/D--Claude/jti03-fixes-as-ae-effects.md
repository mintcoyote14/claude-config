---
name: jti03-fixes-as-ae-effects
description: "JTI03 picture fixes (grade, sharpen) go on as live AE effects, not pre-rendered files"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 228b9fbe-1061-48e1-b143-bef5b454ea9c
  modified: 2026-11-11T17:34:26.171Z
---

On JTI03, picture fixes for interviews (colour, contrast, sharpening) go on in the AE project as effects on the layer, e.g. Lumetri Color and Unsharp Mask on IV_src. Do not pre-process the footage with ffmpeg or other tools and swap the file.

**Why:** the user said so on 2026-11-11 when we discussed improving Stephanie's picture ("поправки на ефектах ае треба робити"). This keeps the fixes editable in the project.

**How to apply:** add the effects in the IV comp to the source layer, keep the source file untouched, check with ae_render_frame. Related: [[jti03-upscale-precision-only]].
