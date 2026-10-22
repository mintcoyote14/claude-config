---
name: claude-data-on-d
description: "На домашньому ПК (tequi) ~\\.claude перенесено на D:\\ClaudeHome\\.claude через junction; робочий ПК (a.popyk) не чіпали"
metadata:
  node_type: memory
  type: reference
  modified: 2026-10-22T16:00:00.000Z
---

22.10.2026 на домашньому ПК (`C:\Users\tequi`) папку даних Claude Code перенесено скриптом `D:\Claude\move-claude-to-d.ps1`: файли лежать у `D:\ClaudeHome\.claude`, а `C:\Users\tequi\.claude` тепер junction на неї. MD5 звірено, junction-и пам'яті (`projects\D---SCRIPTS-\memory`, `projects\D--Claude\memory` → `D:\Claude\memory\...`) відтворено, резервну копію `.claude.bak-20261022-154514` видалено.

На C: лишились тільки `C:\Users\tequi\.claude.json` і сама програма в `.local\share\claude` (~284 МБ, не переносити, туди пише автооновлення).

Робочий ПК (`a.popyk`) переносити **не треба**, користувач так вирішив.

**How to apply:** шляхи `~\.claude\...` працюють як раніше. Ніколи не запускати `Remove-Item -Recurse` (чи інше рекурсивне видалення) на `C:\Users\tequi\.claude`: це видалить дані на D:. Повторний запуск скрипта безпечний, він бачить junction і виходить.
