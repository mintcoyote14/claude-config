---
name: task-slot-workflow
description: "How to edit the universal task slot D:\\_SCRIPTS_\\!TASK.jsx — archive the old version first, keep the TASK: header, save as UTF-8 with BOM"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 1dc226e6-00de-4e4b-8f40-506d41cb5487
  modified: 2026-09-08T15:25:26.798Z
---

Разові побутові задачі в After Effects користувач ставить через один файл — `D:\_SCRIPTS_\!TASK.jsx` (кнопка `TASK` угорі його `ScriptLauncherPanel.jsx`). Кожне нове завдання перезаписує попереднє. Перед перезаписом:

1. Скопіювати поточний `!TASK.jsx` у `D:\_SCRIPTS_\_task_archive\` під іменем `YYYY-MM-DD_коротка-назва.jsx` (чистий шаблон-скидання лежить там як `_TEMPLATE.jsx`).
2. Міняти **тільки** блок `task()` і рядок `// TASK:` у шапці (панель читає його і показує як підказку кнопки) + `// DATE:`. Обгортку (undo-група, catch, `__CANCEL__`, хелпери `comp/layers/props/comps/items/walk/prop/ask/askNum/confirmOr/log`) не чіпати.
3. Після запису обов'язково додати UTF-8 BOM, інакше ExtendScript покаже кирилицю в alert-ах як кракозябри:
   `$t=Get-Content -LiteralPath $p -Raw -Encoding UTF8; [System.IO.File]::WriteAllText($p,$t,(New-Object System.Text.UTF8Encoding($true)))`

Слот запускається з двох місць: кнопка `TASK` у `ScriptLauncherPanel.jsx` і кнопка `TASK` у Motion Tools Pro → Panel 1. Кнопки MTP лежать у `%APPDATA%\MDS\Motion_Tools_Pro\configs\userConfig.json` (`layouts` → `Motion Tools Layout` = Panel 1, тип `execute-script` + абсолютний `fileLink`). Правити цей JSON **тільки при закритому After Effects** — MTP перезаписує його на виході. Бекапи — в `_task_archive\userConfig_backup_*.json`.

**Why:** файл запускається однією кнопкою і має завжди лишатися робочим; архів рятує разову задачу, якщо вона знадобиться вдруге; ExtendScript без BOM читає файл у системному кодуванні.

**How to apply:** нове завдання → архівуєш → переписуєш `task()` → BOM → у відповіді коротко, що робить, без інструкцій (див. [[new-scripts-go-to-scripts-folder]]).
