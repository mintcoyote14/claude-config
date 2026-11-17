---
name: wawcheers-deploy
description: How to deploy warsawcheer.pl (Cloudflare Pages via wrangler) and when — only on the user's signal
metadata:
  type: feedback
---

Site deploys go to Cloudflare Pages project `warsawcheer` (warsawcheer.pages.dev + warsawcheer.pl, production branch `main`, no git). The user said (2026-11-16) deploys happen **on their signal** ("деплой"), the way they do it in their Garaż project: they tell me what to change, I change the draft, rebuild, and deploy when told.

**Why:** the site is public; they want to see/approve changes in the claude.ai preview first, then say deploy.

**How to apply:**
1. Edit `G:\WAWCHEERS\Claude`, show it in the preview artifact (YBS783vJjhtYiu6pQRc6JQ).
2. On the signal: `python G:\WAWCHEERS\deploy\build_deploy.py build` (new `site-<date>` folder; the script refuses if it exists, so remove only my own earlier build of the same day).
3. Deploy via the Terminal panel (`mcp__terminal__run_in_terminal`, tab titled e.g. "Cloudflare login"): first `npx --yes wrangler pages deploy <folder> --project-name warsawcheer --branch preview-<date> --commit-dirty=true`, smoke-test the preview URL (Playwright script `deploytest.mjs` in the session scratchpad, with `B` set to the preview URL), then the same with `--branch main`.
4. Verify the live site with curl/Playwright (reading terminal output may be blocked by the auto-mode classifier; verify on the live URLs instead).
wrangler is logged in (OAuth, `npx --yes wrangler login` if it expires). The Cloudflare MCP connector has no Pages-upload tool, so wrangler is the way. Details: [[wawcheers-site]].
