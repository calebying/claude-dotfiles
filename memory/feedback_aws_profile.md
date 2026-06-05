---
name: feedback-aws-profile
description: "Always use the aws-sandbox-cli-caleb profile for AWS CLI commands; only switch to the other account when explicitly asked, and confirm out loud."
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 65e5a69c-5d89-4df9-a391-abbb89fb9dda
---

Always append `--profile aws-sandbox-cli-caleb` to every AWS CLI command. This is the default account (`calebying-dev-1188`, `calebying@gmail.com`).

**Why:** User has two AWS accounts. Using the wrong account could provision resources in an unintended account.

**How to apply:** Every `aws ...` command must include `--profile aws-sandbox-cli-caleb` unless the user has explicitly named the other account for that specific task — and when switching, confirm aloud ("Using your other AWS account — not aws-sandbox-cli-caleb") before running anything.

See [[project-contexts]] for account details.
