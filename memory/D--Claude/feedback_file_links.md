---
name: feedback_file_links
description: "Give file paths as clickable markdown links (open in the app's file pane); don't open them in Explorer unless asked"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 228b9fbe-1061-48e1-b143-bef5b454ea9c
  modified: 2026-10-23T11:34:33.813Z
---

Give result files and folders as clickable markdown links like `[name](E:/path/file.mp3)`, which open in the app's file pane. Don't call reveal_path to open them in Explorer on your own.

**Why:** the user said (2026-10-23) that the in-app window is enough and they don't need Explorer.

**How to apply:** for a project outside the working directory (for example `E:\JTI_03`), first grant access with request_directory so the links work.
