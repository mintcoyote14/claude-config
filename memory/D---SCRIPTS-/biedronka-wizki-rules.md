---
name: biedronka-wizki-rules
description: "Правила переносу візок з таблиці CNC 2026 у новий тиждень — що автоматизуємо, а що руками"
metadata: 
  node_type: memory
  type: project
  originSessionId: dfd37c63-860d-49b7-a77a-d0b5a77dc3be
  modified: 2026-09-15T12:42:35.675Z
---

Таблиця CNC 2026 (Google Sheets, вкладки `<SHOW> T<NN> oferty`), колонка **N — UWAGI** каже, з якого тижня брати візку (візка = проект товару, .aep). Колонка **A** ділить аркуш на блоки **A** і **B** — це частина ЦІЛЬОВОГО тижня, і вона може не збігатися з частиною бази: оферта з `T35B` може йти в блок A і навпаки. Частину брати з блоку таблиці, а не з назви базового проекту.

Літера в увазі каже, з якого шоу візка: **A або B → CNC (FRESH / NISKIE CENY), C → Weekend**. Тому голий `T37B` у вкладці Weekend означає проект CNC, а не Weekend.

Автоматизуємо лише уваги в межах того самого шоу: `wizka: T38A`, `wizki T35B`, `T38B fresh`.

Руками, не чіпати: уваги на інший проект (`T29C football` → BiedronkaFootballCzerwiec, `T24B Grill` → BiedronkaGrill, `WEEKEND T35C`, `ostatni DM T35C`) і уваги з лінками на transfernow — це нові матеріали, їх збирають вручну.

**Weekend завжди йде -1**: коли решта шоу на W39, актуальний тиждень Weekend — W38 (і вкладка в таблиці зветься `WEEKEND T38C`). Świeżaki — це овочі та фрукти з розділу FRESH, окремий корінь `BiedronkaSwiezaki2026_231584`, споти лежать у `compo` (`W39A_1_Winogrona_Ziemniaki_v01`), не в `dmp`.

Відповідність шоу → корінь на X:: REG = `BiedronkaPricesOnGoing2026_231510\vfx\shots\2026\NISKIE CENY`, FRESH = той самий корінь, папка `FRESH`, WEEKEND = `BiedronkaWeekend2026_231673\vfx\shots`.

Перенос робить [[save-to-new-week-script]].
