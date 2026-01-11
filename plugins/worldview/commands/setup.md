---
description: Set up worldview in current project
allowed-tools:
  - Bash(${CLAUDE_PLUGIN_ROOT}/scripts/init-context.sh:*)
---

!`"${CLAUDE_PLUGIN_ROOT}/scripts/init-context.sh"`

Based on the script output above, respond to the user:

- If STATUS:CREATED - Confirm worldview was set up and is ready to use
- If STATUS:EXISTS - Tell them worldview already exists in this project, no action needed
- If STATUS:FAILURE - Explain what went wrong based on the error message
