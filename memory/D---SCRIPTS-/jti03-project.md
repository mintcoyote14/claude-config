---
name: jti03-project
description: "JTI 03 Talent Marketplace (freelance, E:\\JTI_03) — built from scratch by scripts in _build; original JTI_02 .aep crashes AE 26 (use the _noFX copy for reading)"
metadata:
  node_type: memory
  type: project
  originSessionId: 1c8c43a3-b7f6-43cb-bac7-40880af7f537
  modified: 2026-10-14T15:20:24.435Z
---

JTI 03 (Filosofia → JTI, NDA, freelance — not ORKAFILM). Working project `E:\JTI_03\proj\jti_03_v05.aep` (2026-10-14); rules in `E:\JTI_03\CLAUDE.md`, data in `data\jti03_structure.json` (I added `people` + `speaker`/`side` fields on 2026-10-13, backup in `data\_backup`).

**Why:** on 2026-10-13 AE crashed importing `jti_02_v08.aep`; the user said not to import old JTI_02 projects (buggy) and to rebuild from scratch with better graphics/animation.

JTI 02 can be read after all: `E:\JTI_03\proj\02\jti_02_v08_noSS3_noFX.aep` (Shadow Studio 3 + Trapcode Particular stripped by `D:\_SCRIPTS_\Strip_ThirdParty_FX.jsx`) opens in AE 2025 (and 2026 with those plugins off). Only one AE instance can hold the MCP port 7788. Animation dump: scratchpad `jti02_anim.txt` (2026-10-14).

Endcard uses the imported JTI 02 lockup comp `talent marketplace logo 2` (bin `_JTI02_IMPORT`); all pops use the JTI 02 elastic (`POP_STYLE = "elastic"` in lib.jsx), moves/transitions keep the 85 curve.

**State 2026-10-14 (handoff):** teaser `JTI03_TEASER` is assembled in `jti_03_v05.aep` (set the MCP sandbox to the current version). Done: all scenes, pans/round transitions, VO (voice Will, `E:\JTI_03\vo\`), music bed from JTI 02, JTI 02 lockup logo on the endcard (recoloured via `_BRAND`), JTI 02 elastic pops (`POP_STYLE`), sentence cues in JSON. Open: speaker quotes/roles/triangle labels are `TBC` until the agency sends text; interview footage still missing (only Tomas test clip); PV01–PV04 not built (TODO comps exist); logo green in JTI 02 mark now follows `_BRAND`. Working rules the user set: edit only what is asked; skip render checks unless asked; save after each logical step; `jti_03_vNN` — new version for big changes.

**How to apply:** scenes are built by `E:\JTI_03\_build\01..05_*.jsx` (+ `lib.jsx`), each rebuilds its comps from JSON; run them in order via ae_run_jsx after JSON changes. Teaser `JTI03_TEASER` done first; PV01–PV04 not built yet (TODO comps exist). The AE MCP sandbox guard must point at the current .aep version. Bridge has no ffmpeg in PATH, so render ≤3 frames per call.
