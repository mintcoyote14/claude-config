---
name: render-queue-user-presses-render
description: "Рендер через AE MCP — лише ставити в чергу; кнопку Render тисне користувач сам, щоб бачити превʼю й пасок прогресу"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 57b0a09e-f89b-49a9-ae06-98670a53b764
  modified: 2026-09-30T09:46:46.297Z
---

Через MCP (ae_do render.add_to_queue / set_output, render.duplicate_item) лише готуємо чергу й перевіряємо шляхи та тривалість. **За замовчуванням не викликаємо `render.start`** — користувач сам тисне Render у панелі Render Queue. Викликаємо його лише якщо користувач прямо наказав запустити рендер мені («запускай рендер»); тоді нагадати, що смуги прогресу в AE не буде.

**Why:** `render.start` виконується скриптом і блокує UI After Effects: у панелі немає паска прогресу, превʼю зникає, AE виглядає завислим (так було 2026-09-30 з END credits, ~20 хв). Користувач хоче в майбутньому спостерігати за рендером. Крім того, під час блокування він випадково натискав кнопки в AE.

**How to apply:**
- Перед постановкою в чергу: зберегти `_wip` (ae_save_project) і за дозволом записати його поверх vNN (`cp` через Bash, з перевіркою `cmp`).
- Тривалість задавати явно (`render.set_output` timeSpanStart/timeSpanDuration), не покладаючись на Work Area Only: робоча зона комп змінюється від випадкових натискань. Порівнювати з попереднім DI-файлом (mvhd-атом .mov; ffprobe і python на машині немає, читати через PowerShell).
- Дублікат пункту (`render.duplicate_item`) бере шлях за замовчуванням із чужого проєкту (Biedronka) — завжди перевіряти й виставляти outputPath; дублікат DONE-пункту не дозволяє змінити шлях. Надійніше `render.add_to_queue` з outputPath + `outputTemplate`.
- Після старту користувачем стежити за файлом (розмір/mtime) і повідомити через PushNotification, коли готово.
- DI-файли лежать у `X:/SyrenkaPicassa_230681/vfx/_out/credits/`; render змінених комп: start_credits (ProRes 4444 з альфою, 80.75 с) і END_credits (ProRes 422 HQ, 282 с).
