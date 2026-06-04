---
name: feedback-prompt-before-changes
description: "When to prompt the user vs. proceed silently — changes require confirmation, info gathering does not"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 57e22178-92cb-41cc-91f9-537b59b8f65c
---

Always ask the user for confirmation before making changes (editing files, writing files, modifying system settings like PATH or registry, installing things). Do NOT prompt or ask before running PowerShell/Bash commands that only gather information (e.g., checking versions, listing directories, reading config).

**Why:** User finds it disruptive to be asked about read-only queries, but wants control over anything that modifies their system or files.

**How to apply:** Before using Edit, Write, or any PowerShell/Bash that mutates state (SetEnvironmentVariable, registry writes, package installs, config changes), state what you're about to do and confirm. For pure info-gathering (Get-*, where, --version, dir/ls), just run it.
