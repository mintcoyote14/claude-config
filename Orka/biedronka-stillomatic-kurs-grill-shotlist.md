# Biedronka "Więcej, taniej" 2027 — stillomatics KURS 30" + GRILL 30"

- Board: **Kurs Grill AP 01** (Magnific project BiedronkaAITest_231450), one page, panels `SHARED REFS`, `KURS 30''`, `GRILL 30''`. Each scene = row: reference node(s) → Image Generator → List "stills" (accumulate).
- Brief: `X:\BiedronkaAITest_231450\client\20261012\stilomatiki_biedra.pdf` (pages KURS and GRILL only).
- Model: **Nano Banana Pro** (node slug `imagen-nano-banana-2`), 16:9, 2k.
- Season: summer (grill). Tomek (KURS 2) = random delivery driver, no character ref.
- End logo / slogan board: Artem makes it himself — not generated.
- **3 generations per scene**, all collected in the scene's List (run the generator `downstream` 3×). Clear obsolete items from a List (patch `data.items`) when the prompt changes.
- Approved stills go to `X:\BiedronkaAITest_231450\vfx\shots\KursGrill\genai\YYYYMMDD\`.

## Rules for this campaign (from Artem's / client's corrections, 2026-10-13)
- **One VO sentence can be several shots.** Split the brief's image line into separate stills (KURS opening = 1 wide + 4 close-ups; KURS shelf = 4 close-ups, one per product named; GRILL opening = 3 shots with people).
- **People must never look like the people in the references.** Always write "completely new people, look nothing like … in the photo" with a new age / hair / clothing.
- **Supers WIĘCEJ / TANIEJ** (client): every shot of a customer reaching for / holding a product gets the words placed in post — WIĘCEJ left of the product, TANIEJ right, tracked to it, turned towards the customer, may be only partly readable. Generate **no text**, but compose with calm, uncluttered space left and right of the product (product = sharp centre). Close-ups too.
- **Customers hold the product in their hands** (meat trays, fruit) — that is the hero of the shot.
- **Reference ≠ camera.** When a shot must not look like the reference, use it "only as an example of the setting" and describe a completely different camera position; base-plate wording only when the framing should be kept.
- **Meat is always raw** — fresh or raw in marinade; never cooked, grilled, roasted or glazed in store shots.
- Meat packs: sealed with clear film, white sticker on the lid "Produkt z Polski" + small Polish flag.
- Staff uniform (freshness lead): from `biedronka pracownik` — black shirt, red inner collar, small red embroidered ladybug. Not the meat-counter outfit from `01074`.

## KURS 30"
| # | Beat (VO) | Refs | Status |
|---|---|---|---|
| K1 | Road at dawn, truck with crates ("Więcej dostaw prosto z pola") | `00034` grade only | v1 OK (Artem) |
| K1a–d | Close-ups on the truck: apples, carrots, lettuce with dew, radishes — space for supers | `KURS 1 v1` (continuity) | v2 |
| K2 | Storeroom / goods receiving: Tomek hands a crate to the freshness lead, produce all around ("Więcej świeżości") | `biedronka pracownik` (uniform only) | v2 |
| K3a–d | Close-ups: Polish apples, imported citrus, fresh herbs, berries ("Więcej wyboru") | `017` setting | v2 |
| K4 | Customer's hand picks an apple, new camera angle ("Więcej smaku") | `00817` setting only | v3 |
| K5 | Wide big store, fruit/veg department as hero ("Więcej, niż znasz…") | `018` | v3 |
| K6 | Exterior, customer walks in | `biedronka front 03` + `biedr logo` + `00034` grade | v1 |

## GRILL 30"
| # | Beat (VO) | Refs | Status |
|---|---|---|---|
| G1a | Young couple, he holds a tray of marinated pork neck ("…z Twoją ulubioną marynatą") | `01040` setting only | v3 |
| G1b | Woman holds sealed tray "Produkt z Polski" at the self-service meat fridge | `016` base plate | v3 (Artem: good example) |
| G1c | Father + son at the counter, son holds tray of marinated ribs | `022` setting only | v3 |
| G2 | Woman reads label "Produkt z Polski" ("…od lokalnych dostawców") | `01074` counter/sign/grade | v2 (Artem: good example) |
| G3 | Full counter, raw cuts + raw world marinades ("Więcej smaków z całego świata") | `01123` | v3 |
| G4 | Home garden grill, host serves, 4 guests compliment ("Więcej powodów do dumy") | `00034` grade only | v2 |
| G5 | Wide big store, meat department as hero | `016` + `01074` | v3 |
| G6 | Exterior, customer walks out with red "Do mojej idę" bag | `biedronka front 01` + `biedr logo` + `grade` (bag + grade) | v2 |

## AE edit (2026-10-13)
- Project `X:\BiedronkaAITest_231450\vfx\shots\KursGrill\compo\KursGrill_stillo_v001.aep` (backup before my changes in `compo\_backup\`). Comps `_MASTER/Kurs_stillo_` and `_MASTER/Grill_stillo_`, 1920×1080, 25 fps, 30 s, stills scaled 70.3125 % (2752×1536 source), comp markers = VO lines, no audio. Last ~3.5–4 s left empty for Artem's end board.
- KURS (frame-aligned): K1 0–2.52 · K1a–d 1 s each to 6.52 · K2 6.52–9.52 · K3a–d ~1.36 s each to 15 · K4 15–18 · K5 18–22 · K6 22–26 · END BOARD 26–30. Old full-shelf K3 removed (Artem).
- GRILL: G1a 0–2.52 · G1b 2.52–5 · G1c 5–7.52 · G2 7.52–11 · G3 11–14.52 · G4 14.52–18.52 · G5 18.52–22.52 · G6 22.52–26.52 · END BOARD 26.52–30.
- End board placeholder: black solid + text "END BOARD", Futura PT Medium 120 px, white, centred (Artem replaces it with the real board).
- 2nd correction round (Artem): K3a no empty crates, K3b no cut fruit (all whole), K3c no obvious drops/mist, G1a lower meat display behind the couple, G1c smaller tray, G5 = meat/deli wall across the whole back wall with blue "Kraina Mięs" / "Kraina Wędlin" signs. Replaced files in `genai\20261013\`, previous versions in `genai\20261013\_prev\`. Artem: if a round gives an acceptable image, use it — no extra rounds.
- Stills in `genai\20261013\`: Artem's picks (magnific__… files: K1, K1a–d, K2, K3 shelf, K6) + mine named `KURS_…` / `GRILL_…`.
- Later corrections (Artem): K4 green plastic crates as in `00817`; G1a counter lower (waist height) — based on `GRILL 1a v2`; G1c darker like `022` + "Produkt z Polski" sticker; G5 must look like Biedronka, Kraina Mięs counter always in the corner against the load-bearing wall (based on `GRILL 5 v3` + `018`).

Spare refs not used yet: store `015`, `014`, `05`, `013`, `019`, `020`, `021`; facades `biedronka front 02`, `04`.
