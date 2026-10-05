---
name: jti02-ae-crash
description: JTI_02 AE project family crashes AE 26.3 on open; footage moved E: -> G:, junctions created on E:
metadata:
  type: project
---

`G:\PROJECTS\JTI_02\proj\jti_02_v01..v08.aep` crash AE 26.3 deterministically on open
(`BEE.dll +0x5241e7`, AV read 0x19ac, stack TDB.dll -> BEE.dll -> dvacore -> FLT/FILE/MEE).
Goal as of 2026-09-10: produce a Collect Files for the client.

Ruled out by testing: Shadow Studio 3 (absent in v01, still crashes), missing footage paths
(relinked, still crashes), Trapcode Particular (copied 2025 build into AE 2026, loaded, still crashes),
missing pseudo-effect definitions (Animation Composer `pseudofx` in %TEMP% is empty, but other
projects with MHAC pseudo effects open fine). Crash signature matches a reported AE 26.3 regression.

Environment changes made on 2026-09-10 (remove when no longer needed):
- Junctions `E:\JTI_02` -> `G:\PROJECTS\JTI_02` and `E:\JTI` -> `G:\PROJECTS\JTI`
  (project stores absolute E: footage paths; those folders were deleted after archiving to G:).
- Copied `Particular.aex` (2025 build) into `…\After Effects 2026\Support Files\Plug-ins\Trapcode\`.
  Trapcode Suite is installed only for AE 2024/2025; AE 2026 got no Trapcode folder from the installer.
- `E:\DOWNLOADS\06.png` and `07.png` are gone for good (2 of 35 footage items).

Untried: full third-party plugin isolation on 26.3; installing AE 25.6 (all plugins for 2025 are
already in place, project was authored on 25.x).
