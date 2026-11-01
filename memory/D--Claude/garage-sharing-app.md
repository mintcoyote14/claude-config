---
name: garage-sharing-app
description: "E:\\garage\\app — PWA for neighbours of Skarbka z Gór 29a to share garage spots with guests; demo vs Supabase, garage layout facts"
metadata:
  node_type: memory
  type: project
  originSessionId: 2cd52e8e-3af2-414e-9a30-a10e1af73aa3
  modified: 2026-10-30T18:30:54.934Z
---

Spot-sharing PWA for the user's building (Skarbka z Gór 29a, Warsaw), started 2026-10-30. Code in `E:\garage\app` (Vite + React + TS, own git repo); old v1 moved to `E:\garage\_old_v1`. UI is Polish; user chats in Ukrainian. Style: yellow-grey garage palette (pillar yellow = free, graphite = guest), Onest font, must read well in light and dark. The earlier pixel style is kept on request as git tag `pixel-style` and `design/pixel-demo.html`.

- No `.env.local` → demo mode (localStorage). Supabase mode needs `VITE_SUPABASE_URL` / `VITE_SUPABASE_ANON_KEY`; rules live in `supabase/schema.sql` (tested in PGlite, test script was in session scratchpad, not in repo).
- Preview: config `garaz` in `D:\Claude\.claude\launch.json` (`npm --prefix E:/garage/app run dev`, port 5180).
- Building chat is Messenger: no bot, so the app shares prefilled text+link (Web Share / clipboard).
- Garage facts from the user's photos: 29a has spots 54–105. Side A 105→80 (105 and 80 single by walls, pairs between). Side B (confirmed by user 2026-10-30): 54,55 floor | E | 56,57 floor pair, 58/59 lift, 60 floor | F | 61 floor, 62/63 lift, 64/65 lift, 66 floor | G | 67 floor, 68/69, 70/71, 72/73 lifts | H | 74/75, 76/77, 78/79 lifts. Lifts: even ▼ lower, odd ▲ upper; one pillar carries plates for both neighbouring lifts. Building 29 is mirrored (01 where 29a has 105).
- Lift rule: can only drive onto a platform if no car is under it; owners offer either "under raised platform (low car)" or "on lowered platform" (only owner raises it with key) → `mode` field on openings.
- Every booking/request requires the guest's phone; it lives in private tables (booking_phones/request_phones) visible only to spot owner, host, admin.
- Map: side B (54-79) left, side A (105-80) right (user asked to swap); a lift is ONE cell split ▲ upper | ▼ lower.
- Demo link (private artifact): https://claude.ai/artifact/ErtumWECyeXEWrXyJJpsng, built by `SINGLE=1 vite build --outDir dist-single` + `scripts/pack-single.mjs`.
- It's a just-for-fun app for willing neighbours; the building management won't share owner data. Decided 2026-10-30: join via invite link with a code from the Messenger chat (no admin approval); a free spot is yours at once (plus the other level of your lift); changing spots / owned spots go through the admin (the user). E-mail login vs no-email (anonymous) still open.
- Guests are let in by the host resident (who has the key/remote); booking requires owner's opening = consent.

**How to apply:** layout lives in `src/garageLayout.ts`; check it before changing spot geometry. Not done yet as of 2026-10-30: real Supabase deploy, hosting, web push, building 29.
