---
name: photoshop-scripts-exchange-folder
description: Папка обміну скриптами Photoshop між робочим і домашнім компом — <OneDrive>\_scripts_\photoshop + sync-ps-scripts.ps1
metadata:
  node_type: memory
  type: project
  originSessionId: 1dc226e6-00de-4e4b-8f40-506d41cb5487
  modified: 2026-10-05T14:21:12.295Z
---

Скрипти Photoshop ходять між компами через OneDrive-папку **`<OneDrive>\_scripts_`** (робочий акаунт ORKA; на робочому це `C:\Users\a.popyk\OneDrive - STUDIO PRODUKCYJNE ORKA Sp. z o.o\_scripts_`). Підпапки за програмою: `photoshop\`, а в ній `actions\` для резерву панелі Actions. Станом на 2026-10-05 там лежать `Rasterize_All_Smart_Objects.jsx`, `create_select_smart_object_placeholder.jsx`, `fit_layer_to_square.jsx`, `guides_from_selection.jsx`, `ps_path_mask_script.js` і копія `Actions Palette.psp` з робочого PS 2026.

Синхронізацію робить **`D:\Claude\sync-ps-scripts.ps1`** (лежить у git-репо [[claude-config-repo]], тож є на обох компах):
- без параметрів — обидва напрямки, новіший файл перемагає, нічого не видаляється;
- `-Pull` / `-Push` — лише один напрямок;
- `-Add <шлях>` — додати новий скрипт в обмін (інакше він не синхронізується).

**Why:** у папці Photoshop `Presets\Scripts` лежать ще й стокові скрипти Adobe — тягнути їх в обмін не можна, тому синхронізуються лише ті імена, що вже є в обмінній папці.

**How to apply:** на домашньому компі один раз: увійти в OneDrive тим самим робочим акаунтом, підтягнути `D:\Claude` (`git pull` або `sync.bat`), запустити `D:\Claude\sync-ps-scripts.ps1`. Шлях до Photoshop скрипт знаходить сам — найновіша `C:\Program Files\Adobe\Adobe Photoshop *\Presets\Scripts`; запис туди потребує адмінських прав, і без них скрипт це прямо скаже. Для After Effects окремої синхронізації не треба: `D:\_SCRIPTS_` і так git-репо (див. [[claude-config-repo]]).

Actions у Photoshop живуть не файлами, а в `%APPDATA%\Adobe\Adobe Photoshop <рік>\Adobe Photoshop <рік> Settings\Actions Palette.psp`. Перенести можна або цим файлом (та сама версія PS, замінює всю панель), або штатно: в панелі Actions виділити **набір** → меню панелі → Export Actions → `.atn` → на іншому компі Load Actions. Окремий екшен без набору PS не експортує — спершу New Set і перетягнути в нього.
