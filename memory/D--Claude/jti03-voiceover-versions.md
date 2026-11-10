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
- `_v4_pv\VO4_*` — same voice 13 (All-Rounder), 2026-10-23: PV lines whatif, platform, priorities, PV01/PV02/PV03_PV04 keymessage, PV03 questions, PV final. Since 2026-10-26 PV01 uses VO4 whatif / priorities / PV01_keymessage plus VO3 platform / going_global / explore (client: voice must match the teaser). Note: VO4 final "One platform. Thousands of skills…" is the older brief wording.
- `_v7_explore\VO7_*` — voice **Explore, voiceId 23**, 2026-10-23/24: whatif, platform, priorities, going_global, in_practice, explore, pv_keymessage (PV01 "Sometimes…"), pv_keymessage_2 (PV02/PV04 "It's about finding…"). Used in JTI03_PV02, PV04 (PV01 until 2026-10-26). Was in Launch until 2026-10-26.

Other voice ids tried: Edge 38 (rejected, slow), 114/79/18/16/27/6/5 tests.

**How to apply:** to switch a master to another set, replace the VO layer sources keeping startTime, then shift the sentence `cues` in data/jti03_structure.json and the bubbles `var ST=[…]` in SC_final_phrase_* (main + _bubbles comps) by the word-start difference (get word times with faster-whisper), then rerun `_build/music_inplace.jsx` for ducking. See [[jti03-render-queue-not-aerender]].

Also: the user's Premiere music export `JTI03_LAUNCH_006_Music.wav` turned out to be music + my no-music preview baked in; the clean music-only track is `music\crop\JTI03_LAUNCH_006_Music_only.wav` (mix minus preview audio). Check exports for baked-in VO before ducking.

PV01 music had the same problem: clean track is `music\crop\JTI03_PV01_Music_only.wav` (= `JTI03_PV01_preview_Music_v001.wav` minus the audio of `_out\work\2026-10-23\JTI03_PV01_preview_noMusic_v001.mp4`). PV02/PV04 will likely need the same check.

2026-11-03: PV01 restructured per Alina's blue edits (approved structure will then be applied to PV02/PV04): new VO4_PV01_goal / departments / markets (voice 13); priorities and going_global removed from PV01. PV01 temporary music is `music\crop\JTI03_PV01_Music_only_v2.wav` (110 s, bars repeated at 0:34), to be re-cut in Premiere. New scene built by `_build\14_goal_scene.jsx` (GOAL_JOB config).

2026-11-03 (later): PV01 temporary music is now `music\crop\JTI03_PV01_Music_only_v3.wav` (112.16 s). Ring scenes in PV01/PV02/PV04 are driven by `_build\15_ring_motion.jsx` (RING_JOB config; re-runnable); orbit layers in the masters no longer use time remap and run 3 s at speed 1.

Brief timecodes for the videos are approximate (user, 2026-11-03): do not fit durations to them or report a mismatch as a problem.

Client numbering: the file named `JTI03_PV01_preview_v004.mp4` on Drive (folder 26.10.2026) is the same render as local `client\2026-10-23\JTI03_PV01_preview_v003.mp4` (renamed by the user when sending). Local client numbering therefore continues from v005 (2026-11-03).

2026-11-09: PV01 client v006 released (`_out/client/2026-11-09/JTI03_PV01_preview_v006.mp4`, 114.28 s, ~14 Mbps h264 + AAC 320k, built from PNG+AIFF in `_out/work/2026-11-09/_pv01_v006`). New GOAL/SKILLS/SOLUTION scene (script `E:/JTI_03/_build/14_goal_scene.jsx`, bubbles + dots synced to intro) answers Maria Terron comment K7. Master is `proj/jti_03_v28.aep`.

2026-11-09 (evening): PV02/PV03/PV04 follow the brief (no GOAL scene, by the user's choice). All three on voice 13 (VO4_PV_whatif, VO3_platform, VO4_PV_priorities, VO4_PV02_keymessage = the new key message for all three, VO3_going_global, VO3_explore), whoosh SFX per sweep, music = `music/crop/JTI03_PV01_Music_only_v4.wav` (PV03 uses `JTI03_PV03_Music_only_v1.wav`, 134.4 s, bar-aligned loop). Scripts: `_build/20_pv_audio13.jsx` (AUD_JOB {id}), `_build/make_pv03_json.py`, PV03 cloned from PV02 with `dup_pv.jsx`. PV03: Greg Donovan real (Video_Greg 18.54 s), Hitesh Pant and Michaela Dimitrova are placeholders (`assets/placeholders`, files *_v2.mp4 are the live ones; swap clips/photos and set first/speechLen in the JSON). PV03 has two map scenes (PV03_SC_map Malaysia, PV03_SC_europe Austria+Germany). Waveform data (jti03_waveform.json) does not exist for PV02-PV04 yet (flat bars).

2026-11-10: the working project is now `proj/jti_03_v29.aep` (the user saved up; always back up the .aep that AE has open, check with ae_project_info). Alina (agency) confirmed: PV03 cast Greg Donovan / Hitesh Pant / Michaela Dimitrova (Filippo Milani in her countries sheet is not in the video); departments Greg+Michaela Finance, Hitesh Data Management; countries sheet `1IIs3Cr0UHANicsslTqj1uHYnK5jv9Gjp2Wo_vest3Rk`. Hitesh/Michaela interviews in `Interviews JTI/07_Project_Video_3/` (quotes at 165.9 s / 44.45 s). Michaela photo still missing (placeholder), Hitesh title still TBC. PV02-PV04 got the PV01 GOAL structure (scripts 17 and 19 take $.global.PM_PFX, then `21_pv_goal_fixes.jsx`, 14 with GOAL_JOB, `22_pv_goal_master.jsx` GM_ID); Goal/Skills texts are placeholders until Alina sends them and the animation is approved. The title after GOAL shows departments (JSON segment text). Waveform data for all PV interviews: `make_waveform.py` falls back to raw interview audio (`audio_interviews/_raw`).
