---
name: biedronka-bumpers-w41
description: "Бампери W41 (01-02.10.2026): що зібрано, звідки, правило «регуляр→регуляр, фреш→фреш», відкрите питання про рендер"
metadata:
  node_type: memory
  type: project
  originSessionId: 8b735979-9994-46a1-a6e0-bebb634e71eb
  modified: 2026-10-02T08:58:42.528Z
---

Зібрано 4 бампери W41A у `_ai_progress` (REG: `NISKIE CENY\W41\compo\_ai_progress` Makarony, Praliny, Wedliny; FRESH: `FRESH\W41\compo\_ai_progress` Schab). Таблиця «бампер → джерело → Oferta N» у `references/bumper.md` скілу [[biedronka-spot-assembly-skill]].

**Правило користувача:** з регуляра береш у регуляр, з фреша у фреш.

**Рендер:** 02.10.2026 за прямою командою користувача я сам запустив `render.start` у всіх чотирьох (після перевірки шляху `finals\T41\DIGITAL_41A_6\<аудіо-папка>\<майстер>\`, порожньої цілі, Work Area Only 0-6 с, DPXseq); результат по 150 dpx (00000-00149) на бампер. Проєкти скопійовано з `_ai_progress` у `compo` (MD5 ок): `W41A_1_Bumper_Makarony_v01`, `W41A_1_Bumper_Praliny_v01`, `W41A_2_Bumper_Wedliny_v01` (REG), `W41A_1_Bumper_Schab_v01` (FRESH).

**Відкрите:** у Praliny legal агенції має «do 10.08.2026» (ймовірно помилка PSD, не правив, сказав користувачу); FRESH `W41B_1` скопійовано в `FRESH\W41\compo` (оригінал лишився в `_ai_progress`).

**Оновлення 02.10.2026:** виноград (GANG, `GANG_T41A_1_WINOGRONA_6`, 144 кадри) відрендерено в `finals\T41\DIGITAL_41A_6\BIEDR_GANG_W41A_WINOGRONA_6\`, проєкт `X:\BiedronkaSwiezaki2026_231584\vfx\shots\W41\compo\_ai_progress\W41A_1_Bumper_Winogrona_v01.aep`. У легалі Praliny виправлено «10.08»→«10.10» (конвертація в текст + `text.paste_range`, див. `references/ae-mcp.md`): бампер перерендерено поверх тих самих кадрів, `W41A_1_Bumper_Praliny_v01` у compo оновлено (резерв у `_ai_progress\_backup`); 30-с спот `W41A_1_Makarony_Kawa_Praliny_v01` виправлено, у compo оновлено v01 (резерв там же), черга на робочу зону 18,48–25,60 с (кадри 462–639) підготовлена, рендерить користувач. Правило: після правки в одній оферті рендерити лише її + 5 кадрів запасу (користувач виставляє B/N).

**Правило 144 кадри (02.10.2026):** бампери рендерити 144 кадри (робоча зона 0-5,76 с). У W41 (Makarony, Praliny, Wedliny, Schab) за командою користувача видалено зайві кадри 00144-00149, лишилось по 144 (00000-00143), wav на місці; Winogrona вже було 144. Проєкти бамперів ще мають зону 0-6 с у черзі, при перерендерці ставити 5,76.

**Робоча зона 5,76 (02.10.2026):** у проєктах бамперів W41 (`_ai_progress`, REG/FRESH також у `compo`, резерви `_backup\…_compo-before-workarea576_20261002.aep`) і в нових версіях шаблонів: REG `Template_SPOT_v09`, FRESH `Template_SPOT_Fresh_v11`, Świeżaki `Template_spot_5`. Нові споти й бампери брати з цих версій.

**Фестивалі (02.10.2026):** FW `FW_TEMPLATE_Spot_v02` і FN `Festiwal_Nabialu_TEMPLATE_SPOT_v03` мають 6-с майстри з робочою зоною 5,76 с (144 кадри); брати їх для нових спотів і бамперів.
