---
name: jti03-project
description: "JTI 03 Talent Marketplace (freelance, E:\\JTI_03) — built from scratch by scripts in _build, old JTI_02 .aep must not be imported"
metadata:
  node_type: memory
  type: project
  originSessionId: 1c8c43a3-b7f6-43cb-bac7-40880af7f537
  modified: 2026-10-13T09:51:31.339Z
---

JTI 03 (Filosofia → JTI, NDA, freelance — not ORKAFILM). Working project `E:\JTI_03\proj\jti_03_v01.aep`; rules in `E:\JTI_03\CLAUDE.md`, data in `data\jti03_structure.json` (I added `people` + `speaker`/`side` fields on 2026-10-13, backup in `data\_backup`).

**Why:** on 2026-10-13 AE crashed importing `jti_02_v08.aep`; the user said not to import old JTI_02 projects (buggy) and to rebuild from scratch with better graphics/animation.

**How to apply:** scenes are built by `E:\JTI_03\_build\01..05_*.jsx` (+ `lib.jsx`), each rebuilds its comps from JSON; run them in order via ae_run_jsx after JSON changes. Teaser `JTI03_TEASER` done first; PV01–PV04 not built yet (TODO comps exist). The AE MCP sandbox guard must point at the current .aep version. Bridge has no ffmpeg in PATH, so render ≤3 frames per call.
