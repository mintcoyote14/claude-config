# Пайплайн: стілли до TVC у Magnific Spaces + Nano Banana

Схема, за якою зроблено стілли для **Cafe d'Or / Biedronka TVC 30"** (вересень 2026). Передай цей документ у нову сесію разом із брифом, і вона працюватиме так само.

Скіли, які треба підтягнути на старті: `magnific-spaces`, `nano-banana-prompting` (+ `camera-shot-language` для ракурсів).

---

## 1. Хід роботи

1. **Бриф → шот-лист.** Розбити сценарій/VO на окремі кадри-стілли за порядком споту, по одному візуальному біту на кадр. Показати список Артему, не питати зайвого.
2. **Відразу віддати те, що не потребує референсів** (бьюті-макро, нейтральне тло), поки Артем збирає референси.
3. **Запросити референси на борд** для всього, що має бути «справжнім»: фасади, упаковки, герої зі стб, приклад колористики. Кожен новий проєкт = новий борд: **не тягнути номери/файли з попередніх проєктів**.
4. **Артем дає назви нод** → використовувати тільки їх, дослівно (`@biedronka front 01`, `@cafedor 03`, `@stb grandpa`…). Якщо назви невідомі — спитати, не вигадувати. Можна запропонувати коротку назву для нової ноди (`grade`, `flat`), якщо Артем ще не назвав.
5. **Розподілити референси по кадрах**: кожен кадр отримує свій фасад/пак, щоб не повторювались; невикористані лишаються запасними (сказати які).
6. **Ітерація по одному кадру**: Артем кидає результат генерації + коментар → правка вбудовується в **повний промпт цієї сцени** і віддається заново цілим (не окремий «edit» промпт).

## 2. Формат відповіді

- Кожен промпт — **окремий чистий блок коду**, нічого зайвого всередині. Над ним — заголовок `**N — назва сцени**`.
- Модель, аспект, роздільність — Артем ставить на ноді сам, у промпт не писати.
- Промпти англійською, пояснення — українською, коротко (1–3 речення: що змінено / як розкладені референси).
- Референси — `@` + назва ноди, просто в тексті, без дужок.
- Nano Banana: промпт **короткий і по суті**. Жодного окремого negative-блоку — виключення прозою в кінці промпту (2–3 фрази).

## 3. Правила промптингу, які спрацювали

**Референси**
- Середовище/бренд-об'єкти беремо з референсу: `Take the facade, ladybug sign and entrance exactly from @X`. Пак: `exactly matching the reference`.
- Референс колористики/кадру — явно обмежувати, що з нього брати: `Take only the colour grade and lens look from @grade, not its framing or the person in it`.
- Якщо на референсі є люди або текст-оверлей — прямо писати `do not take the woman or the text overlay from @flat`.
- Героя зі стб: `the man from @stb grandpa — same face, hair, beard, sweater… Take only the man, not his background`.

**Пакшот у сцені (найчастіші правки)**
- Пак **не виставлений на камеру**, стоїть на задньому плані серед побутових речей, під кутом, у реальному масштабі, з тінню від того ж світла.
- За замовчуванням **сильно розмитий**: `heavily out of focus in the background blur, so only its colour and round logo are faintly recognisable`, інші предмети частково перед ним.
- Уникати фіолетових/кричущих паків, якщо вони вибиваються з палітри кадру.

**Люди**
- 2–3 людини максимум у кадрі з фасадом, не натовп.
- Реквізит бренду (торби) — тільки в тих, кому логічно (хто виходить з магазину).
- Одяг під сезон зйомки (вересень: легкі куртки, кофти, без зимового).
- `Natural skin texture, candid, nobody looking at camera` (якщо не фінальний погляд у камеру).
- Вираз обличчя описувати конкретно (`thoughtful half-smile, looking off to the side`), інакше виходить «дурнувата» гримаса.

**Камера/кадр**
- Для кожного кадру своя камера, не повторювати низький кут скрізь. Приклади: низька камера біля будівлі; трохи згори з протилежного боку вулиці; рівень очей з парковки, 3/4.
- Фасад займає більшу частину кадру; оточення — лише натяк на краю кадру.
- Фінальний кадр: герой у правій третині, вільне місце зліва під анімацію напису.

**Оточення**
- Не описувати детально населені пункти/інтер'єри — це дає сток/«AI slop». Мінімум оточення, сучасна Польща; «село» з костелом і хатами — не працює, краще просто інша локація.
- Інтер'єри без референсу описувати коротко: `cosy modern Polish apartment`, тепле світло з вікна.

**Реквізит і дрібні артефакти**
- Прямо прибирати зайве: `no coffee pot, no extra cups`, `only a faint wisp of steam`.
- Метал: `clean, smooth steel, no water drops, no stains`.
- Масштаб предмета: `compact 2–3 cup size… true-to-life scale`.

## 4. Шаблони

**Фасад магазину**
```
Cinematic photorealistic shot of a [BRAND] store in [LOCATION/TIME]. Take the facade, sign and entrance exactly from @[FACADE NODE]. Take only the colour grade and lens look from @[GRADE NODE], not its framing or the person in it. Camera [ANGLE, LENS], the facade filling most of the frame and the sign clearly readable. Only two or three people: one walking out carrying the bag from @[BAG NODE], another walking in empty-handed, slightly motion-blurred; a few shoppers softly visible inside. [SEASON] clothing. Natural candid people, nobody looking at camera, no text beyond the store sign and the bag, no other brands.
```

**Люди вдома з продуктом на фоні**
```
Cinematic photorealistic [SHOT SIZE] of [PEOPLE, ACTION, EXPRESSION] in a warm modern Polish apartment. Shallow depth of field with the focus only on [SUBJECT]. In the background, the [PRODUCT] from @[PACK NODE] stands small on the kitchen counter among everyday things, turned slightly at an angle, heavily out of focus, so only its colour and logo are faintly recognisable, lit by the same window light with a natural soft shadow. [CLOTHING], soft window light. Take only the colour grade and lens look from @[GRADE NODE]. Natural skin texture, candid moment, no text beyond the packaging, no other brands.
```

**Бьюті-макро (без референсів)**
```
Photorealistic macro commercial shot of [PROCESS]. Warm amber backlight against a deep dark background, shallow depth of field, rich filmic contrast. No text, no logos.
```

## 5. Приклад: Cafe d'Or / Biedronka — фінальна розкладка

Ноди на борді: `biedronka front 01–04` (фасади), `grade` (колористика з кадру кампанії), `torba_v001–005` (червона торба «Do mojej idę»), `cafedor 01` Oro мелена, `02` Premium, `03` Crema зерно, `04` Classic розчинна, `05` Gold розчинна, `flat` (кадр квартири з попередньої кампанії), `stb grandpa` (дід зі стб).

| # | Сцена | Референси |
|---|---|---|
| 1–4 | Бьюті: обсмажування, мелення, еспресо, наливання | — |
| 5 | Місто, сутінки, камера трохи згори з того боку вулиці | front 04, grade, torba 001/002 |
| 6 | Містечко, вечірнє світло, низька камера | front 01, grade, torba 001/002 |
| 7 | Інша Biedronka, золоте пообіддя, рівень очей з парковки | front 03, grade, torba 001/002 |
| 8 | Руки засипають зерно в еспресо-машину | cafedor 03, grade |
| 9 | Мала кавоварка наливає каву в чашку, без паку | grade |
| 10 | Пара за столиком, круасан, пак сильно розмитий на фоні | cafedor 01, grade |
| 11 | Жінка ~40 на дивані, чашка двома руками, дивиться вбік | cafedor 05, grade |
| 12 | Фінал: дід зі стб, права третина, погляд у камеру | stb grandpa, flat, cafedor 03 |

Фінальний промпт 12 (як еталон складного кадру з кількома референсами):
```
Cinematic photorealistic medium shot of the older man from @stb grandpa — same face, grey hair, white beard and grey knitted sweater — sitting on a sofa in the right third of the frame, in a warm modern Polish apartment with an open kitchen behind him. He holds a glass cup of latte in both hands at chest height and looks straight into the camera with a warm, calm, knowing smile. Take only the man from @stb grandpa, not his background. Follow the composition, warm low sunlight and colour grade of @flat, but with a slightly different angle and a different, similar-style interior; do not take the woman or the text overlay from it. Calm open space on the left two thirds of the frame. Shallow depth of field with the focus only on the man. On the kitchen counter in the background, the Cafe d'Or Crema pack from @cafedor 03 stands among everyday kitchen things — glass jars, a small plant, a wooden cutting board, a kettle — some of them slightly in front of it, heavily out of focus in the background blur, so only its colour and round logo are faintly recognisable and it blends into the scene, lit by the same light with a natural shadow. Faint wisp of steam from the cup. Natural skin texture, relaxed genuine expression, no text beyond the packaging, no other brands.
```
