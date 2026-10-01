---
name: seedance-prompting
description: "Use when writing, reviewing, or fixing prompts for Seedance AI video, 2.0 or 2.5 (text-to-video, image-to-video, reference-to-video, video edit, @Image/@Video/@Audio references, shot scripts, extensions and long-form chaining)."
---

# Seedance Prompting — 2.0 and 2.5

Direct, don't describe. Seedance takes quad-modal input (image + video + audio + text) through a dual-branch diffusion transformer: one branch handles space (what things look like), one handles time (how they move). Vague prompts make both branches guess. Write like a shot list, and describe **physical interactions** — "the tires smoke as the car drifts 90 degrees", not "car turns".

This skill is engine knowledge — what Seedance understands. How to organise a prompt so it stays controllable, and the intake to run before writing one, live in `shot-prompt-architecture`; load that first for anything with locked references or recurring subjects. `seedance-emotion-direction` carries the performance library when the shot needs visible acting, `camera-shot-language` the camera clause.

## Versions — check which one you are on

Everything in this skill applies to both 2.0 and 2.5. What differs is capacity, and the differences cut both ways.

| | 2.0 | 2.5 |
|---|---|---|
| Duration | 4–15s | **4–30s in one pass**, no stitching |
| Reference images / videos / audio | 9 / 3 / 3 | **30 / 10 / 10** |
| Resolution ceiling | 480p, 720p, 1080p, **4K** | 480p, 720p, **1080p only** |
| Native audio | yes | yes, `generate_audio` defaults to on |

Two consequences worth planning around:

- **2.5 doubled the clip length**, so a 30-second beat that used to need three chained generations is now one generation with identity intact throughout. Prefer one long generation over a chain whenever it fits.
- **2.5 dropped 4K.** If a deliverable needs 4K, 2.0 is currently the only 2.x route — or finish in 1080p on 2.5 and upscale.

Shared parameter shape across the 2.x line: `duration` (`auto` on some providers, `-1` on others, meaning let the model choose), `resolution`, `aspect_ratio` (`auto`, 21:9, 16:9, 4:3, 1:1, 3:4, 9:16), `generate_audio`, `bitrate_mode` (`standard` / `high`), and the reference URL lists. **`negative_prompt`, `seed` and `camera_fixed` do not exist in the 2.x line** — they were 1.x parameters. Everything negative has to be phrased inside the prompt (see Negatives below), and there is no seed to lock, so reproducibility comes from locked references and locked prompt blocks, not from a number.

Variants: `2.0`, `2.0-fast`, `2.0-mini`, `2.5`. Nothing above 2.5 exists yet. Provider naming differs — verify the exact field spellings in whatever interface you are driving.

## Two length regimes

| Regime | When | Length |
|---|---|---|
| **Compact** | text-to-video, no character locks, single simple shot | 60–100 words (ceiling ~150) |
| **Structured** | Universal Reference with character/environment refs, recurring characters, dialogue, multi-shot | 2500–12000 characters in labelled blocks |

The compact ceiling exists because loose adjectives conflict. Structured prompts don't break that rule — they avoid conflict by putting every instruction in exactly one labelled block, so nothing is restated in two voices. Production boards run hundreds of generations at 2500–12000 characters with no degradation; mature boards sit at the top of that band. Never pad a compact prompt to get there; never compress a reference-locked one down to 100 words. Neither number is a target — write the length the shot needs.

## Core formula

```
[Subject], [Action], in [Environment], camera [Camera Movement], style [Style], avoid [Constraints]
```

| Element | Requirement |
|---|---|
| Subject | specific visual features |
| Action | specific verbs, quantified intensity |
| Environment | include lighting + atmosphere |
| Camera | ONE primary instruction |
| Style | a specific tradition, not adjectives |
| Constraints | exclude known failure modes |

Good: `A skateboarder lands a clean trick in an empty dawn parking lot, camera low tracking shot then subtle rise, modern cinematic contrast, 6 seconds, 16:9, avoid jitter and bent limbs.`

## Shot-script format (use for anything > 5s)

Highest-quality outputs come from shot scripts. Timecodes give temporal precision; named shots force a setup → discovery → payoff arc; physical detail gives the physics engine constraints.

```
[Style]Specific anchor (director / film stock / art movement / colorist tool)
[Duration]Total length

[00:00-00:04] Shot 1: Shot Name (Camera Type).
Scene description with physical details.
Character action with specific body language.
Audio cue.

[00:04-00:07] Shot 2: ...

Consistency constraints. Physics requirements. Palette notes.
```

Use **sub-second markers** (`0.3s`, `[0.0s–0.5s]`, "200–400 milliseconds") only when a beat is shorter than a second AND timing changes the meaning — e.g. "stunned for 0.4 seconds". Don't over-fragment.

An 11s clip holds up to 7 named shots with hard cuts, if every shot header carries its own duration, angle and lens, and the global rules block keeps light and scale identical across them.

## Reference tags

`@Image1`…, `@Video1`…, `@Audio1`… — up to **9 / 3 / 3** on 2.0 and **30 / 10 / 10** on 2.5. Tags follow upload order per type. The tag syntax did not change between versions; only the counts did. The `<<<Image1>>>` form works identically (common in JP community morphing templates) — pick one syntax and stay consistent within a prompt. In a host UI the chip may be `@img1` or the node's own name (`@image`, `@Env`) — use whatever that board actually uses, never an invented tag.

**Golden rule:** always state *which element* comes from *which file*.

```
❌ Use @Video1 for the scene
✅ Reference @Video1 for camera movement only. Character appearance references @Image1.
```

Images: `as first frame` / `as last frame` / `as character reference` / `as background environment` / `as style reference` / `as size and framing reference only`.
Videos: `follow @Video1 camera movement` / `character moves like @Video1` / `apply @Video1 transition effects` / `match @Video1 pacing and cuts`.
Audio: `as background soundtrack` / `as ambient sound` / `as voice style reference`. No audio file? `Background BGM references the sound effects from @Video1.`

**Negative reference scoping.** When a reference is right for one property and wrong for another, say both: "@img1 is used ONLY for output size, aspect ratio, subject scale and framing. Do NOT use @img1 for facial expression or mood — the expression in @img1 is what needs correcting." Without the exclusion the model averages the whole image in.

**Edit vs. Reference — always make the intent explicit:**
- Edit = change the uploaded video itself ("In @Video1, replace the woman with @Image1...")
- Reference = extract a quality and apply it elsewhere ("Reference @Video1's camera movement for a new scene...")

Entry modes: **First/Last Frame** (simple single shot) and **All-in-One / Universal Reference** (full multimodal). In the Dreamina UI, "Smart Multi-Frame" and "Subject Reference" appear but cannot be selected with Seedance 2.0.

Fewer high-quality references beat many weak ones. Start with 2–4 assets; production character scenes run 3–8 and stay stable when each tag is given a semantic ALLCAPS name at the top of the prompt.

## Camera — 3 rules that matter most

Eight movements: push-in, pull-out, pan, tracking, orbit, aerial, handheld, fixed.

1. **ONE primary instruction.** Compound only as primary → secondary: `camera low tracking shot then subtle rise`. Never "push-in, then pan left, zoom out, orbit".
2. **Rhythm words, not specs.** `slow, smooth, stable, gradual, gentle` — never `24fps, f/2.8, ISO 800, 85mm`. Talk to it like an editor. Lens *character* is the exception and is worth naming: "ultra-wide rectilinear lens, zero barrel distortion, straight verticals" and "long-lens close-up, shallow depth of field, creamy bokeh, rack focus" both land.
3. **Separate camera motion from subject motion.** `The dancer spins slowly. Camera holds fixed framing.` — not "spinning camera around a dancing person". Mixing them is the #1 cause of shaky, uncontrollable output.

**Dialogue framing rule** — for any speaking character, add: "when a character speaks on screen the camera stays locked on that speaker from first syllable to last — no pan, cut, reframe or cutaway, and the shot only moves on once the mouth closes." This single line removes most mid-line cutaways and lip-sync drift.

## Lighting, style, speed

**Lighting is the highest-leverage single addition.** If you add only one thing, add a lighting description: golden hour, rim light, soft natural window light, neon-lit rainy street, backlit silhouette, even overcast diffused light.

For multi-shot clips add a **lighting continuity** line naming key, fill and direction, and stating it is identical in every shot except the named exception.

Speed: extremely slow (imperceptible, barely) → slow (gentle, gradual) → medium (smooth, controlled) → fast (dynamic, swift — **only ONE element may be fast**, it's the keyword most likely to wreck a shot).

**Style anchors — name a specific tradition, not adjectives.** These are learned strongly:

| Anchor | Triggers |
|---|---|
| Naturalistic Film Print Emulation | film stock character, organic grain, accurate color science |
| DaVinci industrial-grade color grading | precise contrast, controlled saturation, premium commercial |
| 35mm handheld film camera, natural grain, subtle organic shake | documentary realism, breathing camera |
| 100% real-life shooting texture | suppresses CGI tells |
| Cold documentary style, natural light on a cloudy day | desaturated, even, no dramatic shadows |
| Hollywood IMAX blockbuster quality | large-format, deep dynamic range, epic scale |
| Pixar / DreamWorks theatrical 3D animation | fluid keyframe acting, appealing faces, squash and stretch |
| Ultra-realistic PBR materials, subsurface scattering | real matter instead of toy plastic |
| Tsui Hark new style Wuxia blockbuster | bright tonality, cold jade blue-black + amber, mist as soft filter |
| 8K cinematic, ultra-fine detail, HDR glow, no artifacts | quality ceiling for hero shots |

Stack **2–3 anchors** per prompt, never all of them.

**Never stack contradictory traditions.** Two competing style lineages in the same prompt — for instance a stop-motion / claymation reference alongside "fully rigged CG, never stop-motion" — get resolved at random per generation, and this is a common cause of inconsistent takes from an unchanged prompt. Pick one and delete the other everywhere, including inherited boilerplate.

Keyword-triggered effects: `Hitchcock zoom`, `robotic arm multi-angle circular movement`, `speed accelerates like a roller coaster`, `golden sand particles scatter` / `particle dispersion effect`.

## Negatives and quality killers

Always include: `avoid jitter` (all), `avoid bent limbs` (characters), `avoid temporal flicker` (long clips), `avoid identity drift` (consistency), `avoid chaotic composition` (complex scenes).

Words that kill quality: `fast` alone, `cinematic` alone, `epic`, `amazing`/`beautiful`, `lots of movement`. Replace each with something concrete.

**Double-lock recurring failures.** State the constraint positively in the subject/scene description AND negatively in the negative block, describing the actual failure: "avoid the wings detaching from his sides and curling inward to rest against his chest like a hand — this specifically must not happen." Generic negatives don't suppress a failure the model has already committed to.

**Prohibited / Allowed blocks** work well — explicit negative space beats hoping the model avoids something:

```
Camera behavior — Allowed: push-in/pull-out, horizontal tracking, orbit, light perspective change.
Prohibited: sudden blur, loss of subject, unnatural jumps.
Constraints: cut editing prohibited; reuse of the same effect prohibited; flicker/noise/breakdown prohibited.
```

## Identity and scale locks

For recurring subjects, carry a fixed **IDENTITY LOCKS** block between prompts: what the subject is, **size in absolute units**, materials, design, colours, permanent props, and an ANATOMY LOCK in capitals for whatever the model keeps inventing. Add a **scale lock** line ("the subjects stay tiny against a human-scale set — the table and bowls are giant next to them"); relative scale is otherwise the first thing to drift between shots.

## Dialogue

Lock it, don't suggest it — the shape, with the language and names swapped for the job:

```
DIALOGUE LOCK — <LANGUAGE> ONLY
Exactly two spoken lines, in this order, nowhere else:
1. <SPEAKER A> (Beat A): "<line>"
2. <SPEAKER B> (Beat B): "<line>"
Native <language> pronunciation, <voice character>.
No narrator, no ad-libs, no other language, no on-screen text.
Mouths stay closed when a character is not speaking.
```

Write the prompt in English and keep the dialogue in its own language, in quotes, with the language named. Add `Audio:` cues per shot for SFX.

## Mode differences

- **Text-to-video:** full formula, describe everything.
- **Image-to-video:** do NOT re-describe the image. Focus on motion + camera, and emphasize "preserve composition and colors". Camera move must fit the existing composition.
- **Video-to-video:** describe the style transformation, preserve core motion and timing, `avoid identity drift`.

**Division of labour between image and prompt — the rule that fixes most reference-mode failures:** stable identity goes in the image, evolving narrative goes in the prompt. Face, costume, brand mark, logo, product shape → supply as a reference image. Action, mood, lighting change, camera move → describe in the prompt. Describing a face in words while also supplying it as a reference makes the two fight, and the words usually win — which is exactly backwards.

End single-take prompts with: `No scene cuts throughout, one continuous shot.`

For multi-angle coverage, just ask: `Natural multi-camera coverage with shot-reverse-shot editing. Subject details stay consistent across cuts.` For rapid cutting: `20 hard cuts in 10 seconds, no fade-in/fade-out, no transitions.`

## Actions and emotion must be visible

```
❌ character is very sad
✅ tears slide down cheeks, mouth trembles slightly
```

See `seedance-emotion-direction` for the 25-entry performance library.

## Extension and long-form chaining

One clip = 4–15s on 2.0, 4–30s on 2.5 — so on 2.5, chain only what genuinely exceeds 30 seconds. Longer videos chain extensions; the model reads the whole trajectory of the previous clip, not just its last frame. No hard chain limit, but **3–6 extensions (30–90s) is the consistency sweet spot**.

```
Continue from @Video1.
[What happens next — new action, camera direction, new elements]
[Continuity anchors — maintain same lighting angle, color temperature, subject appearance]
[Duration: Ns]
```

Rules: extensions describe **only what happens next** (never recap); every extension starts with the continuation command; every extension repeats continuity anchors; identical aspect ratio across all clips; re-anchor with the original reference image every 2–3 extensions. **Duration set = new seconds only, not total.** Specify "extend forward" or "extend backward".

Variants: reference-guided extension (bring in @Video2 for camera only), style evolution across chains, A/B branching from one clip, seamless looping ("the camera completes the full orbit, returning to the exact same angle, lighting and composition as the first frame").

**Multi-chapter** is different from chaining: one master script with `Chapter 1 / 2 / 3` blocks, each generated as its own full-length clip (15s on 2.0, 30s on 2.5) with shared subject/style anchors, stitched in post. Use it when the whole arc is storyboarded upfront; use chaining when discovering the story as you go.

## Editing without regenerating

```
In @Video1, replace the woman with @Image1. Keep all camera movement, lighting, background and timing exactly the same. Only the character identity changes.
In @Video1, add @Image1 (a coffee cup) to the right side of the desk, lit consistently with the scene. Everything else unchanged.
In @Video1, remove the plant from the left corner. Fill the area with a continuation of the wall.
Subvert the plot in @Video1. [new direction along 0-3s / 3-6s / 6-9s]
I want to add a scene between @Video1 and @Video2, with the content being [bridging scene].
```

**Source video spec for edits.** The video sent to Seedance for editing must be **24 fps, 1920x1080**, and its length must follow the rule **seconds x 24 + 1 frames** (4s = 96 + 1 = 97 frames, 5s = 121, 15s = 361). If the source comp is 25 fps, conform it to 24 fps before sending, and conform the result back to the project fps before overlaying it on the original.

**Node choice in Magnific Spaces.** For editing an existing video, prefer the **Edit video** node (Modify video) over a Video Generator with the clip wired as a reference. See `magnific-spaces`.

Post-generation in Dreamina: "Generate soundtrack", "Interpolate frames", "Regenerate".

Upstream image fixes are often cheaper than a re-roll: an image-edit pass on the reference ("change only the facial expressions, do not change designs, poses, accessories, background, lighting or framing") fixes a bad reference for every shot that uses it.

## JSON-style prompt (alternative format)

Good for VFX-heavy and POV work, and for templating programmatically. The `vfx_focus` array is an emphasis layer — list 2–4 effects to prioritize.

```json
{
  "location": "Tokyo Cityscape (Night)",
  "duration": "10s",
  "prompt": "A cinematic POV shot riding an invisible rollercoaster through Tokyo at night...",
  "vfx_focus": ["Procedural rail generation", "Dynamic environment transformation", "High-speed camera motion with light streaks"]
}
```

## Specs and limits

| Input | Formats | Qty (2.0 / 2.5) | Size | Duration |
|---|---|---|---|---|
| Image | JPEG, PNG, WebP, BMP, TIFF, GIF | ≤9 / ≤30 | <30MB | — |
| Video | MP4, MOV | ≤3 / ≤10 | <50MB | total 2–15s |
| Audio | MP3, WAV | ≤3 / ≤10 | <15MB | total ≤15s |

Output: 4–15s on 2.0 (up to 4K), 4–30s on 2.5 (up to 1080p); native sound effects + BGM, stereo, lip-sync across multiple languages. Input quality sets output quality — 1080p+ sharp images, stable well-lit video refs, 256kbps+ clean audio.

Aspect ratios: 16:9 (YouTube/cinematic default), 9:16 ("vertical format, 9:16" for TikTok/Reels/Shorts), 1:1 (IG feed), 4:3 (retro), 2.35:1 (widescreen, put it in the style line). Keep one ratio across a whole chain.

Compliance: realistic human face photos are not supported (stricter verification since the Face-to-Voice suspension) — use illustration, AI-generated virtual characters, animals, products, scenes. Video references cost more credits.

## Troubleshooting

| Problem | Fix |
|---|---|
| Subject changes between shots | "maintain consistent features and clothing from @Image1 throughout entire video" + an IDENTITY LOCKS block |
| Relative sizes drift | absolute size per subject + an explicit scale-lock line |
| A body part keeps being invented | ANATOMY LOCK in capitals + the same failure spelled out in the negative block |
| Motion doesn't match reference | be specific: "exactly replicate the camera movement from @Video1, smooth tracking left to right"; escalate with "completely reference all camera movement effects from @Video1" |
| Visuals miss audio beats | "camera movements and transitions hit beats in @Audio1" + name sync points |
| Style drifts mid-video | restate style: "visual style from @Image1 applies to entire duration, consistent color grading"; check for two contradictory style traditions in the prompt |
| Camera cuts away mid-line | add the dialogue framing rule |
| Extension seam feels wrong | open the extension by describing the state at the end of the previous clip |
| Jitter / chaos | one fast element max; separate camera from subject; cut adjectives |

Common mistakes: wrong @tag numbering, no duration/resolution, conflicting modalities (image is day, prompt says night), no camera direction, no style anchor, no timecodes, contradictory style traditions, a reference used for everything instead of one named property.

## Iteration

Change **one variable at a time**: baseline 2–3 generations → adjust camera OR motion OR style (never several) → score continuity, instruction adherence, post-production usability → keep the winner → next variable.

Draft at low resolution, finish at high — the prompt-level failures all read at 480p.

Keep three template tiers: Starter (short, validates direction), Production (strict camera + consistency constraints), Fallback (stripped back for unstable output).

**Pre-send checklist:** read it as a stranger · cut redundant adjectives · exactly ONE primary camera instruction · constraints achievable · no style/motion conflict · @tags match the actual inputs · each tag's scope stated, including what it must NOT supply · negatives present, with the last real failure named · at least one lighting description · scale locked · dialogue locked · edit-vs-reference intent explicit.

## Quick card

```
FORMULA   Subject + Action + Environment + Camera + Style + Constraints
LENGTH    60-100 words compact / 2500-12000 chars structured, blocks only
CAMERA    ONE instruction + pacing words; name lens character
LIGHTING  always include one — highest leverage; continuity line for multi-shot
NEGATIVE  "avoid jitter and bent limbs" + the last real failure, named
TIMECODES [00:00-00:05] for anything > 5s
STYLE     name a tradition, not adjectives; stack 2-3; never contradictory ones
REFS      2.0: 9/3/3 * 2.5: 30/10/10 (img/vid/audio); scope each one
IMAGE/TXT identity -> reference image; narrative/motion -> prompt
SCALE     absolute size + scale-lock line
DIALOGUE  exact lines, exact order, "and nowhere else" + speaker-locked framing
SPEED     only ONE element fast
PHYSICS   describe interactions, not appearance
INTENT    edit @Video1 != reference @Video1
EXTEND    "Continue from @Video1." + next scene + continuity anchors
CHAIN     15s per clip on 2.0, 30s on 2.5; 3-6 extensions
DRIFT     re-anchor subject/lighting/style every 2-3 extensions
STRUCTURE see shot-prompt-architecture for the block layout and intake
```