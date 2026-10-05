---
name: warsaw-cheer-agent
description: "Warsaw Cheer lead bot lives in E:\\warsaw_cheer_agent — read HANDOFF.md first; hard $5/month Brave budget, no AI model in the bot yet"
metadata: 
  node_type: memory
  type: project
  originSessionId: ed5ca100-da30-4904-acfc-7b66420031e5
  modified: 2026-09-17T11:36:36.197Z
---

Warsaw Cheer Telegram lead bot (for the user's wife's cheerleading team) lives in `E:\warsaw_cheer_agent`, code in `cheer-agent\`. `HANDOFF.md` there is the authoritative status file — read it before `START_HERE.md` / `CONVERSATION.md`, which hold outdated plans.

Standing constraints agreed with the user (as of 2026-09-17):
- Brave Search spend must stay under $5/month; `cheer-agent\data\search-budget.sqlite` is the persistent counter and must never be deleted or reset.
- Max 5 Telegram cards per rolling 24h; never pad the count with weak leads. Do not reset `sent` to bypass this.
- Since 2026-09-17 the bot has an approved LLM pipeline: Haiku 4.5 triages Brave results, Sonnet 5 reads pages and drafts Polish letters, capped by `ai_budget.py` at $3.50/31 days. Approved plan is $4.14/month total (Brave $1.50 + Anthropic $2.64). New paid spend beyond that is not pre-authorized.
- The rule-based path is the fallback and must stay working: no key, no budget or an API error means the bot keeps running on the old rules instead of stopping.
- Never contact an event organizer without the user's explicit per-case authorization.
- Python is at `C:\Users\tequi\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe`; `python` in PATH is the broken Microsoft Store stub. Run it with `PYTHONUTF8=1`.

Code comments and identifiers there are English, chat is Ukrainian, Telegram card text is Ukrainian, outreach letters Polish — same split as [[feedback_ae_scripts_english]].
