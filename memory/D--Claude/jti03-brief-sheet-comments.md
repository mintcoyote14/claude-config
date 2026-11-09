---
name: jti03-brief-sheet-comments
description: "JTI03 brief Google Sheet id and how to read the client's cell comments (Sheets API does not return them)"
metadata:
  node_type: memory
  type: reference
  originSessionId: 228b9fbe-1061-48e1-b143-bef5b454ea9c
  modified: 2026-11-09T09:59:06.524Z
---

Brief & timeline sheet: `1qs-Ub1h3xLce8DsG83NyWH5TRcRWOwKAvpeBQwHAuSQ` (tabs Video №1–4, LAUNCH VIDEO). Client-side author is Maria Terron, agency is Alina Ievdokimova.

The Sheets connector (`get_spreadsheet`, `get_values`) returns cell text, notes and colours but **not Google comments**. Comments come through the Drive connector: `download_file_content` with `exportMimeType` xlsx returns base64; decode it into a fresh folder in the scratchpad, then read `xl/threadedComments/threadedComment*.xml` (`ref` = cell, author via `xl/persons/person.xml`, `done` = resolved). Run Python with `-I` and `sys.stdout.reconfigure(encoding='utf-8')`, and use Windows paths, not `/c/...`.

First seen 2026-11-09: Maria's comment on Video №1 cell K7 (GOAL/SKILLS/SOLUTION row, 2026-11-06). See [[jti03-voiceover-versions]] for the PV01 structure.
