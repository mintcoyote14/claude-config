---
name: biedronka-different-people-per-offer
description: "У спотах (REG/FRESH/GANG) одна й та сама людина у фонах не повторюється між офертами; фон-комп спільний, тому дублювати"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 8b735979-9994-46a1-a6e0-bebb634e71eb
  modified: 2026-10-20T15:01:46.436Z
---

Правило користувача (20.10.2026): **в одному споті у фонах різних оферт мають бути різні люди; та сама людина не може повторюватися** (стосується й риби: Łosoś і Krewetki не з однією woman_03).

**Why:** у FRESH-шаблоні обидві рибні оферти тягнуть один комп `Ryby` з однією `woman_03`, і в споті вона з'являлась двічі підряд.

**How to apply:**
- Перед здачею збірки перевіряти, яка людина в фоні кожної ввімкненої оферти (включно з `Mieso_VAC` → `Czlowiek_VAC.mov`, `WEDLINY_Precomp`, `READY TO EAT`, `Ryby`, `EDEN` тощо). Комп-фон спільний між офертами, тому для другої оферти: `comp.duplicate` фону (напр. `Ryby_2`), у копії `layer.replace_source` людини на інший кліп з набору `NOWE_ROTO`/`LUDZIE` (`man_01…04`, `woman_01…04`), у шарі фону потрібної оферти `layer.replace_source` на копію.
- Дозволені лише довгі рукави/штани; чергування жінка/чоловік зберігати, коли можливо.
- Зроблено в W44B_1: `Ryby` (woman_03) в Oferta 1, `Ryby_2` (woman_04) в Oferta 2, у Schab людина `Czlowiek_VAC`.

Пов'язане: [[biedronka-fresh-rules-2026-10-01]], [[biedronka-spot-assembly-skill]].
