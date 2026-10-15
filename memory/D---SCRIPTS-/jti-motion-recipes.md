---
name: jti-motion-recipes
description: "JTI motion style reverse-engineered from JTI 02 (elastic pops, heartbeat pulse, orbit/counter-rotation, dissolving lines, gooey) — how to rebuild it in a new JTI project"
metadata:
  node_type: memory
  type: reference
  originSessionId: 1c8c43a3-b7f6-43cb-bac7-40880af7f537
  modified: 2026-10-14T14:51:39.115Z
---

How the approved JTI 02 film is animated (read from `E:\JTI_03\proj\02\jti_02_v08_noSS3_noFX.aep` on 2026-10-14). Ready-made ExtendScript helpers live in `E:\JTI_03\_build\lib.jsx`, section "JTI 02 motion recipes" — copy them into a new project's build lib.

- **Pops** (people, skills, icons, circles, logo): 2 LINEAR scale keys 0 → N over 0.2–0.28 s + Motion Tools Elastic Controller 100/100/100 (logo 60/100/100). Helpers `popElastic`, `elasticExpr`, `linKeys`.
- **Moves** (regrouping, flying in/out): Bezier, influence 17 out / 80 in (snappy start, long settle), sometimes 80/80. Note: for JTI 03 the user asked for symmetric 85/85 ("Motion Tools 85") — see [[jti03-project]].
- **Heartbeat pulse** (0:00 dot): steps every ~1.2–1.4 s, up in 0.2 s, settle 0.2 s later slightly lower, every beat bigger (100→250→200, 165→350→300…), elastic on top; child ring per beat scale 100→200 + opacity 100→0 in 0.4 s. Helper `pulseSteps`.
- **People network**: rotating root null (loopOut, ~−0.85°/s, slow shrink) → group nulls with `wiggle(.4,30)` that regroup by keys → worker; skills orbit the worker (orbit expression, −4°/s); every layer counter-rotates so circles stay upright. Helpers `orbit`, `counterRotate`. "blink" ring behind people: scale 1→100 %, opacity 100→0 every second.
- **Lines**: path between two nulls; dissolve = stroke 16→0, dash 1→39, Turbulent Displace 0→185 over ~0.8 s. Helper `lineDissolve`.
- **Gooey/metaballs**: circles in a precomp + adjustment Fast Box Blur 57 (+ white Fill), Simple Choker 100 on the precomp layer. Helper `gooeyBox`.
- **Big transitions**: a circle scale 0 → 1000–1250 % in 0.36 s with elastic; final wipe 0→1037 % with 80/17.
- **Text**: Animation Composer overshoot presets (8PR, PZB, CIP, U2T, YRD), "What if" starts at ~317 % and shrinks to ~147 % in 0.7 s.
- **Diagram (TALENT/SKILLS/OPPORTUNITIES)**: centre null rotates ~−4.6°/s, sub-nulls +10.6°/s, items counter-rotate; arcs Trim Start 100→0 in 0.36 s; exit scale→0 in 0.24 s.
- Comps: motion blur on, Advanced 3D renderer; AUTOMATICALLY scene used a real 3D camera with a slow dolly and a fly-through on Z at the end.
