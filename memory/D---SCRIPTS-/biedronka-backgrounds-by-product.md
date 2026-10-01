---
name: biedronka-backgrounds-by-product
description: "Який фон-комп ставити в Oferta за типом продукту: порошки і миючі засоби це EDEN, а не CHEMIA"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 8b735979-9994-46a1-a6e0-bebb634e71eb
  modified: 2026-10-01T12:59:07.217Z
---

Користувач (2026-10-01): на миючі засоби (порошки, рідини для прання, Perwoll) ставиться фон **EDEN**, а не `CHEMIA_Precomp`. Інші відповідності з практики W41B: Bakador `PRZEKASKI`, солодощі `SLODYCZE`, кава `KAWA_HERBATA_Precomp`, зубні пасти й косметика `KOSMETYKI_Precomp`.

**Сир → фон `WEDLINY_SER_Precomp`** («wedliny ser»; уточнено 2026-10-01: це саме фон в офертах, не beautyshot).

**Why:** фон агенції для Perwoll (полиці з порошками Ultra) збігається з `EDEN`, а `CHEMIA` виглядає як аптека/косметика.
**How to apply:** вибираючи фон у `Oferta N`, звіряй тип продукту з цим списком і з видом `Blat_Tlo` цінівки; людину в `EDEN` додавай зі scale 142,857%. Деталі в `references/reg.md` скілу [[biedronka-spot-assembly-skill]]. Якщо тип невідомий, спитати користувача.
