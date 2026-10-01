---
name: magnific-spaces
description: "Use when working in Magnific AI Spaces — the node canvas: which node type to use, how ports and connections work, List fan-out vs references, the @ reference chips, Video Generator settings, one-text prompts with no negative field, and how to lay out a shot pipeline."
---

# Magnific Spaces

A **Space** is a node canvas that lives inside a **Project** (breadcrumb reads `Project › Space`). One Space holds several **Pages** — use them to separate scenes or sections of a job rather than letting one page sprawl. Multiple people can be in a Space at once; presence avatars show who, and **Share** controls access.

Everything below was read off a working production board, so the port names and control labels are literal. Magnific ships changes often — if a label here doesn't match what's on screen, the screen wins.

Spaces is the **harness**, not the model. How a prompt is organised is `shot-prompt-architecture`; what goes *inside* it for a given engine is the model skill — `seedance-prompting`, `kling-prompting`, `veo-prompting`, `minimax-prompting`, `wan-prompting`, `nano-banana-prompting` — plus `camera-shot-language` for the camera clause and `seedance-emotion-direction` for acting beats.

## Handing over a prompt for a Space

Deliver the prompt **alone, as one clean copyable block with nothing else inside it**. Model, aspect ratio, duration, resolution and the Sound toggle are node settings, set on the node — never written into the prompt text. Options, caveats and alternatives go outside the block.

**There is no negative-prompt field anywhere in Spaces.** A node takes one prompt body and nothing else, whatever the underlying model's own API exposes — Kling's `negative_prompt`, Wan's negative field and the rest are not surfaced. So never hand over a separate "Negative:" block for a Space: it has nowhere to go, and pasted under the prompt it reads as more things to include.

Write exclusions as prose **inside** the single prompt, each one attached to the positive statement it qualifies rather than dumped in a tail:

- camera lock → `Static locked-off camera on a tripod, fixed framing, no zoom, no push-in, no pan, no handheld shake`
- identity lock → `the same faces, hair and wardrobe throughout, no face morphing, no identity change`
- clean plate → `no on-screen text, no logos, no watermark, no subtitles`
- performance → `movement stays small and human, no slow motion, no speed ramp`

Two or three such clauses are plenty. A long list of banned words spends prompt attention on things the model was never going to do and dilutes the description that is actually steering the shot.

Reference chips are `@` **+ the node's own name** — a node named `image` is `@image`, one named `Env` is `@Env`. Use the names that exist on the board; never invent a tag or renumber one. If the node names aren't known, ask for them rather than guessing.

## Node types

Nodes are auto-numbered as you add them (`Video Generator #8`, `List #12`, `Assistant #8`), and that number is how you refer to them out loud with a collaborator.

| Node | What it is |
|---|---|
| **Text** | A prompt held as data. In: Image, Video, Text · Out: Text |
| **Assistant** | An LLM step that turns a rough idea into a written prompt. Has its own model picker and an **Export as text** output. In: Media, Text · Out: Text |
| **Image Generator** | Stills |
| **Video Generator** | Clips — the main workhorse, see below |
| **List** | A collection of N items with fan-out control, see below |
| Asset / creation cards | Uploaded or generated media sitting on the canvas as a source |

**Editing an existing video: prefer the Edit video node** (Modify video) over a Video Generator with the clip as a reference video. Source video for Seedance edits: 24 fps, 1920x1080, frames = seconds x 24 + 1 (see `seedance-prompting`).

The wider tool catalogue (All tools) is available around Spaces: Image Generator, Image Editor, Image Upscaler, Image Extender, Variations, Cinematic Shot · Video Generator, Video Project Editor, Clip Editor, Video Upscaler, Modify video, Speak, Video Relight · Voice Generator, Audio Generator, Voice Cloning, Voice Changer, Audio Isolation, Sound Effect Generator, Music Generator · 3D Scenes, 3D Generator, 360° Generator · Design Editor, Auto layers, Mockup Generator, Background Remover, Skin Enhancer, Change Camera, Relight, Sketch to Image. There is also a **Library** with a Characters section — the right home for locked character references instead of re-uploading them per Space.

## Ports are typed, and the type is the whole point

A connection is not just "this feeds that" — it lands on a **named port**, and the port decides what the file is used *for*. The Video Generator's ports:

**Inputs:** `References` · `Reference video` · `Start image` · `End image` · `Text`
**Outputs:** `Start image` · `End image` · `Generated video` · `Audio`

Internally these read as `first-frame` / `last-frame` / `output`. Which means the same still dropped on `Start image` versus `References` produces two completely different generations — first frame versus loose visual guidance. **A mis-aimed drag is the most common silent failure in a Space**: the clip still renders, it just ignores your intended first frame. When a generation comes back wrong for no obvious reason, check where the wires actually landed before touching the prompt.

The outputs are worth noticing too: a Video Generator emits its **Start image**, **End image** and **Audio** separately from the video. That's how you chain — take the previous clip's `End image` into the next clip's `Start image` and the seam is exact, no frame extraction step.

What is wired changes what the prompt must say. With a start frame only, the prompt describes the motion that leaves that frame. With **both** `Start image` and `End image` wired, the prompt describes the **transition** between two fixed frames and should end by stating that the final pose matches the last frame and holds — reusing a start-frame-only prompt on a start+end pair is where rushed, drifting or looping motion comes from. A still that contradicts the action described (a pose that is already the end of the beat) belongs on `End image`, not `Start image`.

## Video Generator settings

On the node itself: **model picker** (e.g. Kling 3.0 Omni), **aspect ratio** (16:9), **duration** (3s), **resolution** (1080p), a **Sound** toggle, a **batch stepper** for how many variants to render, **Add reference** with named reference chips, a **timecode range** (`00:00 - 00:03`) placing the clip on the timeline, and a **Status** field for review state. A version counter sits in the header.

Name your reference chips. A board with chips called `white solid #2` and `image` is readable a month later; one with three chips called `image` is not — and the names are what the `@` chips display.

## The `@` convention

Inside a Text, Assistant or Video Generator prompt, typing `@` inserts a **reference chip** bound to a connected input. Prompts read like:

```text
On a clean white background, the ham composition from @image appears element by
element, each drawn into existence with detailed black ink engraving strokes…
```

Both forms appear in practice: `@image` for a single bound reference, and numbered `@img1`, `@img2`… when several are connected. Pick one convention per board and hold it — mixing them makes it unclear which chip maps to which wire. The node's own hint says it plainly: a connected prompt uses `@` to add references.

Note this is Spaces' own chip syntax, not the model's. Seedance's `@Image1` and Kling's `<<<image_1>>>` are what those models see; the chip is how the Space binds a file to that slot.

## Lists — the highest-leverage node

A **List** holds N items: prompt variants, or generated clips. It has a mode toggle (**Replace items** / **Keep items**) and a badge showing the contents (`3 text`, `9 videos`, `6 videos`). Its items can carry their own durations (a list of nine `00:05` clips, a list of six `00:03` clips).

The critical detail is that a List has **two different outputs**:

- **As list** — fans out. The downstream node runs **once per item**. Three prompt variants → three generations. This is how you A/B a prompt or batch a whole scene from one wired pipeline.
- **As references** — collapses. All items enter **one** node together as references. Nine stills → a single generation that sees all nine.

Same wire, opposite behaviour. Choosing `As list` when you meant `As references` burns a batch of credits on nine near-identical clips; choosing `As references` when you meant `As list` gives you one muddled generation instead of nine takes.

## Layout that stays readable

The pattern that recurs on a working board: **assets and a Text/Assistant prompt on the left → an Image Generator → its still → a Video Generator → a List collecting the clips**. Chains run about five nodes deep, and the Video Generator is where three wires converge — typically start frame, end frame, and the prompt.

Practical habits that follow from that shape:

- **One prompt, many consumers.** Put the stable prompt in a Text node and wire it to every generator that needs it. Retyping it into each node is how two shots silently drift apart.
- **Assistant for expansion, Text for the final wording.** Let the Assistant turn a rough beat into a full prompt, then export it as text — but once wording is locked, keep the locked version in a Text node so a re-run of the Assistant can't quietly change it.
- **Chain on End image → Start image**, not on re-uploaded stills.
- **Fix upstream.** If a reference still is wrong, correct that one node; every generation wired to it inherits the fix. Re-rolling downstream clips one at a time is the expensive way to solve the same problem.
- **One page per scene.** Twelve pages of ten nodes beats one page of a hundred and twenty.
- **Use Status.** On a board with dozens of clips, the per-node status field is the only thing that tells you what has been approved.

## Canvas mechanics

Left toolbar: add node, run, pan (hand), cut, note, comment, undo, redo, settings, and a toggle at the bottom.

Zoom menu (bottom right): Zoom in `⌘+` · Zoom out `⌘-` · Zoom 100% `⌘0` · **Zoom to fit `D`** · Zoom to selection `F`. Plus a **MiniMap** for jumping around a large board.

Keyboard: `Enter`/`Space` selects a node, then arrow keys move it. Select an **edge** and `Delete` removes it — worth knowing precisely because it is easy to do by accident on a dense board.

**History** keeps the board's revisions; **Flows** and the **AI Assistant** sit in the top bar alongside Share.

## Typing into a node from outside

A Text node takes two clicks to reach: the first selects the node, the second puts the caret in its rich-text editor. Text sent after only the first click goes to the canvas as keyboard shortcuts, not into the node — so type a few words and confirm they landed before sending a long prompt. Send long text in one piece: the editor can expand into a full-screen view mid-way and drop focus, silently swallowing whatever is sent next. Read the whole body afterwards, not just the opening line.

## Reading someone else's board

When you inherit a Space, read it in this order: what are the entry nodes (assets and prompts with no input), where do wires converge (those are the generators doing the real work), and what do the terminal nodes hold (the deliverables). The numbered node titles and the Status fields tell you what stage the job is at faster than opening every node.