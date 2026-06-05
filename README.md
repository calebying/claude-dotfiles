# claude-dotfiles

Claude Code configuration — synced across devices via OneDrive (live) and GitHub (weekly/monthly backup).

## Structure

```
.mcp.json          # MCP server definitions → symlinked from ~/.claude/.mcp.json
memory/            # Shared memory files → symlinked from ~/.claude/projects/C--Users-A103605/memory/
  MEMORY.md
  project_contexts.md
  feedback_aws_profile.md
  project_guardrails.md
settings.json      # Claude Code settings (reference copy — not symlinked, contains session noise)
```

## MCP Servers

| Server | Purpose |
|---|---|
| `azure` | Azure MCP (AI Foundry, ARM, Search, etc.) |
| `awslabs.bedrock-kb-retrieval-mcp-server` | AWS Bedrock Knowledge Bases |
| `awslabs.aws-documentation-mcp-server` | AWS documentation search |
| `awslabs.cloudwatch-mcp-server` | CloudWatch metrics and logs |
| `awslabs.iam-mcp-server` | IAM users, roles, policies |

## Sync Strategy

- **Live sync:** OneDrive symlinks — changes propagate automatically across devices
- **Backup:** GitHub — weekly/monthly manual push

## Setup on a New Device

```powershell
# 1. Symlink MCP config
Remove-Item ~/.claude/.mcp.json -ErrorAction SilentlyContinue
New-Item -ItemType SymbolicLink -Path ~/.claude/.mcp.json -Target "$env:OneDrive/[claude-dotfiles-path]/.mcp.json"

# 2. Symlink memory
Remove-Item -Recurse ~/.claude/projects/C--Users-A103605/memory -ErrorAction SilentlyContinue
New-Item -ItemType SymbolicLink -Path ~/.claude/projects/C--Users-A103605/memory -Target "$env:OneDrive/[claude-dotfiles-path]/memory"
```
