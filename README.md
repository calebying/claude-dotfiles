# claude-dotfiles

Claude Code configuration files.

## Files

| File | Location | Purpose |
|---|---|---|
| `.mcp.json` | `~/.claude/.mcp.json` | MCP server definitions |
| `settings.json` | `~/.claude/settings.json` | Permissions, theme, effort level |

## MCP Servers

| Server | Purpose |
|---|---|
| `azure` | Azure MCP (Azure AI Foundry, ARM, Search, etc.) |
| `awslabs.bedrock-kb-retrieval-mcp-server` | AWS Bedrock Knowledge Bases |
| `awslabs.aws-documentation-mcp-server` | AWS documentation search |
| `awslabs.cloudwatch-mcp-server` | CloudWatch metrics and logs |
| `awslabs.iam-mcp-server` | IAM users, roles, policies |

## Setup

```bash
# Copy MCP config
cp .mcp.json ~/.claude/.mcp.json

# AWS profile used: aws-sandbox-cli-caleb (ap-southeast-1)
# Azure MCP: requires az login
```
