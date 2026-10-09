---
name: logo-brod-sting-3d
description: "Анімація лого «Бродяги» (вовк) у AE — проєкт E:\\logo_brod\\proj\\logo brod_003.aep, комп STING_3D; стан і відкладені правки"
metadata:
  node_type: memory
  type: project
  originSessionId: 4a154bcd-31d2-4595-893e-3eb798e52a2c
  modified: 2026-10-09T07:19:54.689Z
---

Проєкт `E:\logo_brod\proj\logo brod_003.aep`, мастер-комп `__MASTER\STING_3D` (1920×1080, 25 к/с, 6,6 с). Ассети в `E:\logo_brod\assets`. Бриф: голосові в `E:\logo_brod\audio` (коротка заставка, промальовка контуру → очі → голова).

Будова: прекомпи `P_OUTLINE` (COMET_SABER + OUTLINE_SABER), `P_BEVEL` (BEVEL_COMET + BEVEL_TRAIL + DEFOCUS), `P_FILL` (метал + FLAT_IVORY), `P_EYEGLOW`/`P_EYES` (очі _L/_R), `P_SLASH` (катана), `P_MAP`; камера на CAM_ORBIT/CAM_DOLLY; Particular SPARKS/SPARKS_BEVEL; радар RADAR_CTRL/RADAR_ARM (стрілку користувач вимкнув).

**ЗРОБЛЕНО 2026-10-09:** BEVEL_COMET вогняна (параметри з COMET_SABER, seed 7313, колір темніший), затримка 0,3→0,15 с (BEVEL_TRAIL, SPARK_EMITTER_BEVEL, ключі SPARKS_BEVEL −4 к). Нижче — початкове формулювання задачі.

**Відкладена правка (2026-10-09, «зараз нічого не роби, запиши»):** друга комета (`BEVEL_COMET` у `P_BEVEL`) теж має бути вогняною, як перша (Saber Glow/Core Distortion), але з іншим Random Seed, як віддзеркалення першої. Бігти й далі ЗА першою, лише з меншою затримкою, ніж зараз (НЕ попереду першої). Зараз затримка 0,3 с через вирази `valueAtTime(time-0.3)` на BEVEL_TRAIL End Offset/Opacity → зменшити (напр. 0,1–0,15 с, уточнити); не забути `SPARK_EMITTER_BEVEL` (теж time-0.3).

**Why:** користувач сказав виконати пізніше, не зараз.
**How to apply:** робити лише за командою; перед серією правок зберегти проєкт. Під час сесії був збій AE «undo frame mismatch» (рендер показував старий стан) — якщо користувач править руками паралельно, зупинитись.
