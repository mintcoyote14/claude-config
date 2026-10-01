---
name: seedance-video-input-spec
description: "Required spec for source videos fed to Seedance 2.5 for editing (fps, resolution, frame count rule)"
metadata:
  node_type: memory
  type: feedback
  originSessionId: b778ca7a-f4d8-4cb2-ad06-2751d993e7a8
  modified: 2026-10-01T09:54:31.074Z
---

Відео, яке подається в Seedance на правку (edit / Video Generator з референс-відео), має бути:
- 24 fps
- 1920x1080
- кількість кадрів = секунди × 24 + 1 (наприклад, 4 с → 96 + 1 = 97 кадрів; 15 с → 361 кадр)

**Why:** вимога користувача для правок відео в Seedance (вихід Seedance теж 24 fps); комп'и в AE зазвичай 25 fps, тому треба конвертувати перед відправкою. Правило +1 кадр задав сам користувач.

**How to apply:** коли готуєш або перевіряєш кліп для Seedance (рендер з AE, обрізка сегмента), став 24 fps, 1920x1080 і довжину рахуй як N×24+1 кадрів. Нагадай про це, якщо комп 25 fps. Результат Seedance (24 fps) перед накладанням на оригінал у 25 fps конформуй.