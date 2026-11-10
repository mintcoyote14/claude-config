---
name: feedback-keep-render-queue
description: Never remove or clear items in the After Effects render queue
metadata:
  type: feedback
---

Do not remove items from the AE render queue (no `rq.item(1).remove()`, no clearing loops), including finished items I queued myself and the PNG/AIFF clip renders.

**Why:** the user said so directly on 2026-11-09 after I cleared the queue following clip and client renders; the queue is theirs and they may want the history or items in it.

**How to apply:** when queueing a render, only add a new item. If an old item is in the way, leave it and add another, or ask. Previous notes about "clear done queue items" in earlier sessions are superseded. See [[jti03-voiceover-versions]] for the render pipeline context.
