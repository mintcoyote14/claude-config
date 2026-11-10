---
name: wawcheers-site
description: "Сайт Warsaw Cheerleaders: робоча папка, порядок робіт, за якими скілами перевіряти дизайн і писати тексти"
metadata:
  node_type: memory
  type: project
  originSessionId: 8a1bc641-5d7f-47e5-9fed-ddf4c3c80b0d
  modified: 2026-11-10T12:49:56.419Z
---

Сайт Warsaw Cheerleaders (warsawcheer.pl), команда дружини користувача. Робоча чернетка: `G:\WAWCHEERS\Claude`, оригінальна чернетка `G:\WAWCHEERS\site` не змінюється, знімки в `G:\WAWCHEERS\Claude_versions`. Локальний перегляд у вбудованому браузері (`wawcheers-claude` у `D:\Claude\.claude\launch.json`, порт 8702). Для телефона користувач дивиться приватний артефакт https://claude.ai/artifact/YBS783vJjhtYiu6pQRc6JQ (лише польські сторінки). Особливості claude.ai: обгортка дає `body{background:#fff}` (у design.css стоїть `body{background:transparent}`); сайт іде з підшляху, тож кореневі посилання (`/`, `/#oferta`) у копії для артефакту треба переписувати на відносні (`index.html#oferta`); на iPhone рамка розтягується на всю сторінку й прокрутка зберігається між сторінками (у design.js є scrollIntoView для сайту в рамці).

Порядок робіт, сказаний користувачем 2026-11-03:
- спершу допрацювати польські сторінки, англійські версії не створювати: переклад робимо разом наприкінці;
- тексти не чіпати зараз; займатися ними пізніше за SEO-скілами зі списку https://github.com/stars/mintcoyote14/lists/seo;
- дизайн сайту перевіряти за UI-скілами зі списку https://github.com/stars/mintcoyote14/lists/ui-design (impeccable, taste-skill, emilkowalski/skills);
- фігури дівчат (ротоскоп) вирізає сам користувач у Photoshop, готові PNG кладе в `G:\WAWCHEERS\cutouts`.

**Why:** користувач веде дизайн дрібними правками й сам робить графіку; тексти й переклад мають йти одним проходом після затвердження дизайну.
**How to apply:** нові завдання під час роботи ставити в чергу й виконувати всі. Правки дизайну звіряти зі скілами до звіту. Перекладів і переписування текстів не робити без окремого прохання. Скрипти збирання в scratchpad сесії зникають, тому зміни вносити прямо у файли `G:\WAWCHEERS\Claude`.
