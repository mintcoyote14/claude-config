---
name: biedronka-cnc-sheet-and-shows
description: Як читати таблицю CNC 2026 (oferty vs TVC) і що йде в REG / FRESH / GANG; де шаблони й проєкти тижня
metadata:
  node_type: memory
  type: reference
  originSessionId: 8b735979-9994-46a1-a6e0-bebb634e71eb
  modified: 2026-09-30T10:13:30.258Z
---

Таблиця CNC 2026 (Google Sheets, id `14sx3NGmiSQVzUtOWI2aBmjG_xbHPhfWlQWPSDVFwvw4`). Читати через Chrome (claude-in-chrome): у вкладці таблиці `fetch(.../gviz/tq?tqx=out:csv&sheet=<ім'я вкладки>)` — за назвою аркуша, не за gid (gid у виводі блокується). Клік по вкладках URL не міняє.

Вкладки тижня: **`CNC T<NN> oferty`** — складання ВІЗОК (dmp): продукт, тексти цінівки, колонки M WIZKI і N UWAGI. **`CNC T<NN> TVC`** — складання СПОТІВ (compo): `nazwa spotu` (REG_T41A_1), `produkt 1/2/3`, дата здачі, «(DN)» = особливий варіант (Dzień Nauczyciela).

Три проєкти-шоу в таблиці:
- **REG** — звичайні оферти (2 споти на частину: `_1_`, `_2_`).
- **FRESH** — м'ясо, риба + іноді одна оферта з REG (залежить від замовлення).
- **GANG** — овочі й фрукти (Świeżaki).

Частини тижня: **A** — перша половина тижня, **B** — кінець тижня (напр. T41A FRESH 5–7.10, T41B 8–10.10; матеріали B здаються пізніше — 5/10 проти 30/09 для A).

Шаблони: `X:\BiedronkaPricesOnGoing2026_231510\vfx\shots\2026\NISKIE CENY\_TEMPLATE\` — візки `Template_PRODUCTS_v03_AE2026.aep` у `W<NN>\dmp`, споти `Template_SPOT_v08.aep` у `W<NN>\compo`. Назва спота в compo: `W41A_1_<P1>_<P2>_<P3>_vNN` — порядок продуктів = колонки produkt 1/2/3 у TVC.

**Why:** користувач хоче, щоб я сам підставляв файли в темплейт по даних таблиці; ці зв'язки не видно з коду.
**How to apply:** спершу TVC (які 3 продукти в споті), потім oferty (звідки візки/тексти); правила переносу візок — [[biedronka-wizki-rules]].
