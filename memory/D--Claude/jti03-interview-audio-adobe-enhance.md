---
name: jti03-interview-audio-adobe-enhance
description: "JTI03 interview audio: I cut WAVs into audio_interviews\\_raw, the user runs Adobe Enhance (esv2 75%) into _adobe; the project uses _adobe"
metadata:
  node_type: memory
  type: project
  originSessionId: 228b9fbe-1061-48e1-b143-bef5b454ea9c
  modified: 2026-11-11T17:35:49.296Z
---

How interview audio is cleaned in JTI03:
1. I cut a piece from the source into `E:\JTI_03\audio_interviews\_raw\`.
   - Name: `<Name>__src_<a>_<b>.wav`, where a and b are seconds in the source video.
   - Format: 48 kHz, 16 bit, mono.
   - About 2 s of handle before the first word.
2. The user runs it through Adobe Enhance Speech themself. The result goes to `audio_interviews\_adobe\` with the suffix `-esv2-speech-75p`, at 75 % strength.
3. The AE project uses the `_adobe` file.

Audio fixes are not done with AE audio effects. If the interview cut changes, cut a new `_raw` piece (new name, old ones kept) and the user re-enhances it.

**Why:** the user explained this on 2026-11-11 for Abdurashid's PV01 sound fix: "звук ми раніше рендерили окремо і я проганяв через адобі енханс". Related: [[jti03-fixes-as-ae-effects]] (that rule is for picture fixes).
