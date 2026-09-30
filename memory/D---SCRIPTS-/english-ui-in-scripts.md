---
name: english-ui-in-scripts
description: "All AE script UI text (dialogs, buttons, alerts, tooltips) must be in English; Ukrainian stays only in code comments"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 1dc226e6-00de-4e4b-8f40-506d41cb5487
  modified: 2026-09-11T13:09:27.324Z
---

Скрипти в `D:\_SCRIPTS_` пишуться **повністю англійською** — і інтерфейс (назви вікон, кнопки, чекбокси, `alert`/`confirm`/`prompt`, `helpTip`, звіти), і **коментарі в коді**. Українською лишається тільки листування в чаті.

**Why:** попросив 11.09.2026: спершу «в майбутньому роби всі скрипти з англійським інтерфейсом», потім «коментарі теж можеш переписати англійською, бо по суті українську розумію лише я» — тобто файли можуть потрапити до колег.

**How to apply:** новий скрипт одразу EN. Наявні 13 скриптів переведено 11.09.2026 (бекапи українських версій — `_task_archive/*_ua_2026-09-11.jsx`). Оскільки кирилиці у файлах більше немає, BOM критичним не є, але лишаємо для однаковості ([[task-slot-workflow]]).
