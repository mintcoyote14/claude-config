---
name: claude-config-repo
description: "D:\\Claude це git-репозиторій з пам'яттю, скілами і CLAUDE.md користувача; як він підтягується в усі сесії"
metadata:
  node_type: memory
  type: reference
  originSessionId: 8b735979-9994-46a1-a6e0-bebb634e71eb
  modified: 2026-10-01T14:52:36.472Z
---

`D:\Claude` це git-репозиторій (синхронізується `sync.ps1`/`sync.bat` разом з `D:\_SCRIPTS_`): `memory\<project-key>` (junction-ом `setup.ps1` підключена до `~\.claude\projects\<key>\memory`), `skills`, `CLAUDE.md`, `setup*.ps1`. Пам'ять, яку я пишу в `C:\Users\a.popyk\.claude\projects\D---SCRIPTS-\memory`, фізично лежить у `D:\Claude\memory\D---SCRIPTS-`.

Щоб правила з `D:\Claude\CLAUDE.md` діяли в **усіх** сесіях (не лише відкритих у `D:\Claude`), глобальний `C:\Users\a.popyk\.claude\CLAUDE.md` імпортує його рядком `@D:/Claude/CLAUDE.md` і додатково дублює критичне правило про диск X: ([[x-drive-careful]]). Правити загальні правила треба в `D:\Claude\CLAUDE.md` (одне джерело); глобальний файл лише підтягує.

**How to apply:** нові загальні (не Biedronka-специфічні) правила додавай у `D:\Claude\CLAUDE.md`; Biedronka-специфічне в скіл `biedronka-spot-assembly` (`D:\_SCRIPTS_\.claude\skills\…`) і пам'ять.
