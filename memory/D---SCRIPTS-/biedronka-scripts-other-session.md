---
name: biedronka-scripts-other-session
description: Частину скриптів Biedronka користувач веде в іншій сесії Claude Code — файли в D:\_SCRIPTS_ можуть змінюватися без мене
metadata: 
  node_type: memory
  type: project
  originSessionId: 1dc226e6-00de-4e4b-8f40-506d41cb5487
  modified: 2026-09-15T12:03:31.598Z
---

Користувач паралельно працює над скриптами Biedronka в іншому вікні Claude Code. Станом на 2026-09-15 там ведуться `save_to_new_week.jsx` і `replace_audio.jsx`, а `import_cenowki.jsx` редагується в обох сесіях (звідти взялися поле `Tag` і кнопка `Paste`, яких я не писав).

**Why:** файли в `D:\_SCRIPTS_` можуть відрізнятися від того, що я пам'ятаю з власних правок, і це не помилка й не випадковість.

**How to apply:** перед правкою спільного файлу перечитувати його з диска, а не спиратися на свою версію; чужі зміни не відкочувати й не «виправляти» без прохання. Кнопки Biedronka в панелі привʼязані до імен файлів — при перейменуванні в іншій сесії треба оновити `BIEDRONKA` у [[../_system/ScriptLauncherPanel.jsx]]. Див. [[task-slot-workflow]].
