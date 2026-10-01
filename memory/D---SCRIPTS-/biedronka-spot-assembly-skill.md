---
name: biedronka-spot-assembly-skill
description: "Де лежить скіл складання спотів Biedronka і що в ньому (references), пам'ять-джерело, стан на 2026-10-01"
metadata:
  node_type: memory
  type: reference
  originSessionId: 8b735979-9994-46a1-a6e0-bebb634e71eb
  modified: 2026-10-01T14:46:01.277Z
---

Скіл `biedronka-spot-assembly` у `D:\_SCRIPTS_\.claude\skills\biedronka-spot-assembly\`: `SKILL.md` (ролі, золоті правила, схема оформлення, нестандартні випадки, таблиця references) + `references/`: `sheet`, `reg`, `fresh`, `swiezaki`, `festiwale`, `bumper`, `stickers` (в т.ч. святковий значок/DN як ОПЦІЯ), `ae-mcp`, `replace-cenowka` (заміна цінівки, варіант «цілим компом», звірка 1:1), `carry-over` (перенос візок, `_shotcode`, W/T), `wizki-photoshop` (client\_WIZKI, скрипт маски), `render-prep` (DPX, finals) + `scripts/compare_frames.ps1` (піксельна звірка кадрів). Загальні правила також у `D:\Claude\CLAUDE.md` (діє лише в сесіях, відкритих у `D:\Claude`).

Пам'яті-джерела: [[biedronka-spot-assembly-pipeline]], [[biedronka-cnc-sheet-and-shows]], [[biedronka-wizki-rules]], [[biedronka-carry-over-wizki]], [[biedronka-stage3-checks]], [[biedronka-backgrounds-by-product]], [[biedronka-jpg-comparison-for-whole-comp-offers]], [[biedronka-dont-edit-rendered-spots]], [[x-drive-careful]], [[render-queue-user-presses-render]], [[work-in-real-project-with-backup]], [[biedronka-session-state-2026-10-01]].

**How to apply:** у задачах зі складання/правки спотів спершу підключай скіл; якщо користувач поправляє правило — оновлюй `SKILL.md`/потрібний `references/*.md` і відповідну пам'ять.
