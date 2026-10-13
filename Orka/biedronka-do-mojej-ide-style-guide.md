# Biedronka "Do mojej idę" — Stilomatic 3 "Moja ma" — board **MojaMa AP 01**

Project doc for board `MojaMa AP 01` (started 2026-09-22, scenes 1–14 prompted 2026-09-22 → 23). Follows skill `stillomatic-creation`. All node names, contents and sources live in `biedronka-reference-library.md` — **that library is the single source of truth for what each store photo 01–022 shows.** The per-photo table this doc used to carry was partly wrong and has been removed.

Source material: `D:\_AI_\01.jpg`…`022.jpg` (+ `014_01.jpg`) = 23 current-campaign store photos; `BIEDRONKA_DO_MOJEJ_IDE_60_YT.mp4` (60s brand film — frames grabbed by Artem as needed, named by their frame number); `Stillomatics 1-3 21092026.pdf` (3 scripts + typography mood board); Stilomatic 3 song lyrics ("Moja ma") + audio `biedronka moja ma 02`.

Filenames are kept on import into Magnific, so nodes are cited as `@01`, `@013`, `@00626` — written plainly inline, never in brackets or parentheses. All 23 photos are on the board; film frames are added by Artem one at a time as scenes need them.

## 0. Method — what actually worked

From-scratch text-to-image generation of the store fails every time: wrong store vibe, hallucinated competitor branding (TESCO, invented brands), glossy "AI slop" skin and lighting, garbled duplicated label text, people missing from the frame. Two working modes, both anchored on a real reference:

- **Base-plate edit** — `Edit this exact photograph @X — keep the store environment pixel-for-pixel identical … replace only the person`. Use when the reference's own composition is the shot.
- **Inspired-by build** — `Build this shot inspired by @X — the same camera angle, energy, grade and lens character … the shelving/assortment taken from @Y, adapted naturally to this perspective`. Use when the angle or action has to change; the store still comes from a reference, never from description.

**Never describe the store in words.** Every mention of shelving, signage, assortment or interior points at a node. This is the single rule that separates usable frames from stock-looking slop, and it had to be re-learned mid-session several times.

**Corrections are folded into the scene's full original prompt and redelivered whole** — never a separate "edit the previous image" prompt.

## 1. What we're generating
Photoreal in-store lifestyle stills following the Stilomatic 3 song, one per beat. People are **in motion and dynamic** — walking toward camera, pushing carts, mid-stride, mid-reach — not standing posed. Product in hand, looking at the product (not at shelves or price tags), natural relaxed smile. Every scene gets its own camera setup, several of them deliberately unconventional (cart-level POV, top-down overhead, from inside a fridge case, from between products on a shelf).

## 2. Store interior — build spec (for judging output, not for describing in prompts)
- Near-black/charcoal metal gondola shelving, yellow rectangular "SUPER CENA!" shelf-edge tags on nearly every strip. Category signage: black placards with orange accents, or green/white overhead signs ("OWOCE I WARZYWA", "KOBIETA", "DANIA GOTOWE").
- Refrigerated cases: sliding/hinged glass doors, cool teal interior light, round "ZAMKNIJ LODÓWKĘ" decals on the glass.
- Produce: green angled crates and stands, hanging yellow SUPER CENA! signs on orange-and-black placards.
- Ceiling/floor: white drop-ceiling tiles, long linear LED strips (some yellow-neon edged); light beige ceramic tile floor.
- Carts/baskets: dark grey plastic body, red handle bar and red kickplate.
- Shelves always read fully stocked and abundant, never sparse.
- **No competitor branding, ever** — no Tesco, Lidl, Carrefour, Auchan, Żabka anywhere in frame, including on generic-looking packaging.
- Signage wording is atmosphere only; keep at most one sharp legible tag in frame, everything else soft — Nano Banana garbles small repeated text.

## 3. Products — real Biedronka private label
Reproduce the real assortment, never invent brand names, never substitute a competitor. Dairy/cheese — Delikate, Mleczna Dolina, Światowid. Deli — Kraina Wędlin, Kraina Mięs. Laundry/cleaning — Ultra Expert, Eden. Paper — Queen. Baby — Dada. Beauty — Linda, be beauty, Dentix. Pet — Kitty, ActivPet. Drinks — Remsey, Cafe d'Or, Herbárium, Granella, Riviva. Snacks — Top, BakaD'Or. Frozen — Donatello, Nasze Smaki, Mroźna Kraina. Ice cream — Marletto. Grains — Plony Natury. Canned — Marinero, Rapsodia, Madero. Sweets — Meltié, Bonitki, Hopki (Vitanella). Ready meals / drinks — Yeemy, Vital, GO Active, Fruvita.

## 4. Grade & realism
Teal/cool ambient fluorescent mixed with warm amber accents, shallow-to-medium DOF, filmic contrast, subtle grain. Labels stay legible — bright commercial photography, not moody cinema. **No beauty-retouch look**: visible natural skin texture, no waxy plastic skin, no symmetric stock-photo grin; candid, slightly asymmetric, caught mid-moment. Prompts carry this as a closing line.

## 5. People / casting
Contemporary Polish shoppers, 20s–50s, casual wardrobe with one saturated accent colour (coral, teal, mustard, burgundy) against the cooler store palette. New faces per scene — references give pose, energy and expression, never a locked identity. When a film frame's person is reused, their **expression** is what's kept; hair, clothing and sometimes glasses are changed.

## 6. Composition
- Each scene gets a distinct camera setup; no two consecutive scenes repeat one.
- Subject slightly off-centre with headroom — Artem overlays large condensed-sans typography (arced, or radiating in a circular burst) in the animation pass, so one clean uncluttered zone is reserved. **No text is ever rendered into the frame.**
- Format 16:9.

## 7. Scene list — as prompted on MojaMa AP 01
Scene numbering shifted during the session: the original opening shot became **11**, and a new wide store opener took **1**.

| # | Beat | References used | Notes |
|---|---|---|---|
| 1 | Wide store opener — woman enters with a cart, delighted by how many promos there are | `@015` `@013` `@018` `@021` (store build) | elevated diagonal wide angle, ceiling cropped out, several shoppers in background |
| 2 | NIESPODZIANKI — man shows a GO ACTIVE yogurt to a woman, "look what I found for you" | `@00501` (people + expression) `@04` (store) `@go active 01` (mango bottle) | mirrored horizontally; clothing changed |
| 3 | Man reaching into the snack shelf with a bag of Top chips | `@00612` (person, energy) `@014` (shelves) | burgundy jacket, high shelf-level angle |
| 4 | ŚWIEŻE — ripe apple held close to camera | `@00689` (composition, hand) `@017` (fruit shelves) | Eden bottle swapped for the apple |
| 5 | Woman pushes a cart with a small child clapping in delight | `@00910` (base) `@021` (sweets shelves) | people pulled further back, woman restyled |
| 6 | Camera shoots out from between products on a shelf at a shopper reaching in | `@00987` (camera idea) `@019` (shelf) | checkout-belt angle transposed to a shelf |
| 7 | Boy hugging a snack pack, blissful | `@00557` (expression, hug) `@021` (cereals/sweets) | moved from the car into the store, glasses removed, colour palette of the frame kept |
| 8 | Young woman with two packs of Cafe d'Or coffee | `@013` (assortment kept, angle changed) | low angle up the aisle, shelving running diagonally |
| 9 | Girl pushes a cart, holding a Cafe d'Or ice coffee | `@01223` (person, handheld character) `@espreso 01` `@013` `@018` `@015` (shelves) | wide open main walkway, low camera |
| 10 | Young man opening the ice-cream freezer, delighted | `@09` | camera slightly above, freezer filling the foreground |
| 11 | Woman walking toward camera holding a product (former scene 1) | `@00626` (base) `@02` (food-aisle assortment) | cart removed, Kraina Wędlin pack in both hands |
| 12 | Top-down overhead aisle — man carries a product and looks up into the camera | `@00612` (inspiration) | straight bird's-eye, shelves symmetrical on both sides, hair changed |
| 13 | Camera inside the dairy case, shopper reaching in through the glass | `@022` (camera position + background) `@04` (products in the case) | delivered in a young-man and a young-woman version |
| 14 | Couple outside the store — storefront, then a wider re-angle walking out talking | `@01415` (base plate) | dog removed, people swapped; second version is a wider three-quarter exterior |

Refrain "moja ma, moja ma" (3×) stays background texture, not its own scene.

## 8. Delivery convention
One prompt per message, as a clean copyable block with nothing else inside it — Artem sets model, aspect, resolution and sound on the node himself. Reference chips written as `@name`, plainly inline, never in brackets.
