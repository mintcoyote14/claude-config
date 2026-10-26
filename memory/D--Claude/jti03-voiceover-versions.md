---
name: jti03-voiceover-versions
description: "JTI03 voice-over: which file set is which version (client \"variant №3\" = VO3), Artlist voice ids, where each set is used"
metadata:
  node_type: memory
  type: project
  originSessionId: 228b9fbe-1061-48e1-b143-bef5b454ea9c
  modified: 2026-10-26T13:58:21.265Z
---

JTI03 VO sets kept in `E:\JTI_03\vo\` (all Artlist MCP, MiniMax 02 HD modelId 10, American, Best Fit, speed 1). Cleanup 2026-10-26: other sets (VO2, VO5 Edge, VO6 Edge fast, voice tests, early ElevenLabs VO_*.mp3) went to the Windows Recycle Bin, not hard-deleted.

- `_v3_artlist\VO3_*` — voice **All-Rounder, voiceId 13**, generated 2026-10-22. Lines: platform, going_global, in_practice, explore. This is what the client calls **"варіант №3"** (it is in client file `_out\client\2026-10-22\JTI03_LAUNCH_003.mp4`). Since 2026-10-26 used in JTI03_LAUNCH (client asked to go back to it).
- `_v4_pv\VO4_*` — same voice 13 (All-Rounder), 2026-10-23: PV lines whatif, platform, priorities, PV01/PV02/PV03_PV04 keymessage, PV03 questions, PV final. Not used now; ready if PVs must also get the variant-3 voice (note: VO4 texts are the older brief wording, e.g. final "One platform. Thousands of skills…").
- `_v7_explore\VO7_*` — voice **Explore, voiceId 23**, 2026-10-23/24: whatif, platform, priorities, going_global, in_practice, explore, pv_keymessage (PV01 "Sometimes…"), pv_keymessage_2 (PV02/PV04 "It's about finding…"). Used in JTI03_PV01, PV02, PV04. Was in Launch until 2026-10-26.

Other voice ids tried: Edge 38 (rejected, slow), 114/79/18/16/27/6/5 tests.

**How to apply:** to switch a master to another set, replace the VO layer sources keeping startTime, then shift the sentence `cues` in data/jti03_structure.json and the bubbles `var ST=[…]` in SC_final_phrase_* (main + _bubbles comps) by the word-start difference (get word times with faster-whisper), then rerun `_build/music_inplace.jsx` for ducking. See [[jti03-render-queue-not-aerender]].

Also: the user's Premiere music export `JTI03_LAUNCH_006_Music.wav` turned out to be music + my no-music preview baked in; the clean music-only track is `music\crop\JTI03_LAUNCH_006_Music_only.wav` (mix minus preview audio). Check exports for baked-in VO before ducking.
