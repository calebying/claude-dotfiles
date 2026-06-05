---
name: project-contexts
description: "Active work contexts organised as main projects with sub-projects. Three main projects: AI Factory, Azure AI Foundry, Red Teaming. Currently active: AI Factory › azure-dynamic-search."
metadata: 
  node_type: memory
  type: project
  originSessionId: 2e4d47eb-26d3-4329-8f5c-94fffa722298
---

## Project Root

All Python projects live under: `C:\Users\A103605\projects\`

## Currently Active Context

**Azure AI Foundry › Model Router** — Interactive Python tool to test model-router deployment.
- Project dir: `C:\Users\A103605\projects\ai-factory\`
- Env file: `C:\Users\A103605\projects\ai-factory\.env`
- AWS Account: `222634400408` (alias: `calebying-dev-1188`), profile: `aws-sandbox-cli-caleb`
- Status: Config/guardrails skeleton only; no Python implementation yet

---

## Main Projects

### 1. AI Factory  ← currently active

Building AI workloads across cloud platforms. Two active sub-projects:

#### 1a. AWS
- **Location:** `C:\Users\A103605\projects\ai-factory\`
- **Env file:** `.env` (AWS_ACCOUNT_ALIAS, AWS_PROFILE, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION)
- **AWS account ID:** `222634400408`
- **AWS account alias:** `calebying-dev-1188`
- **AWS CLI profile / IAM user:** `aws-sandbox-cli-caleb`
- **User ARN:** `arn:aws:iam::222634400408:user/aws-sandbox-cli-caleb`
- **Console:** `https://calebying-dev-1188.signin.aws.amazon.com/console`
- **Login email:** `calebying@gmail.com` (personal AWS account — **always confirm explicitly before creating resources here**)
- **Region:** `ap-southeast-1` (default)
- **AWS CLI config:** `~/.aws/config` — profile `aws-sandbox-cli-caleb` created, region ap-southeast-1
- **Status:** Directory, .env, and CLI config created; access key / secret / account ID still need to be filled in
- **Two AWS accounts:** User has 2 accounts. **Default is always `aws-sandbox-cli-caleb` (`calebying-dev-1188`).** Always add `--profile aws-sandbox-cli-caleb` to every AWS CLI command. Only switch to the other account if the user explicitly requests it — and always confirm out loud when doing so.

#### 1b. LiteLLM
- **Location:** `C:\Users\A103605\projects\litellm\litellm`
- **Branch:** main (full BerriAI/litellm clone, v1.83.3)
- **Purpose:** Understanding and potentially extending LiteLLM proxy — token/key admin, routing algorithms, spend accounting
- **Key files:** `litellm/proxy/proxy_server.py`, `litellm/router.py`, `litellm/proxy/schema.prisma`, `litellm/proxy/management_endpoints/`, `litellm/proxy/spend_tracking/`
- **Analysis done:** Token admin (keys/users/teams/orgs), routing strategies (cost/latency/usage/complexity/tag), accounting model (6-level spend tracking, daily rollups, budget enforcement)
- **Status:** Analysis phase; not currently being built

---

#### 1c. Agentic RAG & Search (azure-rag)
- **Location:** `C:\Users\A103605\projects\azure-rag\`  |  **Env:** `.env`
- **Resource Group:** `SIT-AI-Factory-RAG` (southeastasia / Singapore)
- **Stack:** Purely Azure — Azure AI Agent Service (Foundry), Azure AI Search, Azure OpenAI
- **Key resources (all in SIT-AI-Factory-RAG):**
  - Azure OpenAI: `foundry-exploration-azure-openai-rag` — deployment: `text-embedding-3-small` (1536-dim), `gpt-4.1-mini`
  - AI Search: `sit-factory-rag-search` — index: `sharepoint-ai-foundry-exploration-rag-index` (HNSW + BM25)
  - Storage: `sitairagblob`
- **RAG modes:** Simple RAG (vector + keyword), Agentic RAG (agent-selected strategy), Search-only
- **Data source:** SharePoint `General/SIT-Policies-RAG` → vector + index (event-triggered via Logic App)
- **Auth Phase 1 (dev):** user credential; branch `feature/agent-identity` → managed identity
- **Status:** Infrastructure complete, `query.ps1` working; no Python code yet

#### 1d. Dynamic Search (azure-dynamic-search)

- **Location:** `C:\Users\A103605\projects\azure-dynamic-search\`  |  **Env:** `.env`
- **Resource Group:** `SIT-AI-Factory-RAG` (same as azure-rag)
- **Stack:** Azure AI Search (keyword-only, BM25 + semantic reranking), Azure OpenAI (optional LLM answer)
- **Search index:** `dynamic-search-index` (no vectors — keyword/BM25 + semantic reranker only)
- **Data source:** SharePoint `General/SIT-Policies-Search` → blob `search-documents/` → `search-indexer`
- **Key files:** `setup_index.py` (one-time provisioning), `search.py` (interactive CLI), `lib/` (config, schema, indexer, answer)
- **Logic App:** `sharepoint-search-ingest` (already deployed) triggers `search-indexer` on file change
- **Status:** Code complete; run `python setup_index.py` to provision index in Azure AI Search

#### 1e. Graph Search (tool-graph-search)  ← currently active sub-project
- **Location:** `C:\Users\A103605\projects\tool-graph-search\`  |  **Env:** `.env`
- **Resource Group:** `SIT-AI-Factory-RAG` (same as azure-rag / azure-dynamic-search)
- **Stack:** Microsoft Graph Search API — queries SharePoint's own index directly, no Azure AI Search
- **Purpose:** Alternative to azure-dynamic-search; uses SharePoint's built-in index via Graph `/search/query`
- **Status:** Directory created; context gathering in progress before build

---

### 2. Azure AI Foundry

All Azure work. Three sub-projects:

#### 2a. LLM Setup / ARM Provisioning
- **Location:** Azure ARM (no local code dir) — managed via `az rest` commands
- **Purpose:** Azure AI Foundry infrastructure — two hubs, RAI policies, 30 model deployments each
- **Key resources:**
  - `AI-Guardrailed-Models-US-East-2` (resource group: `SIT-AI-Foundry-Exploration`) — 30 deployments, policy: `SIT-External-Guardrail`
  - `AI-Base-Model-No-Guardrails` — 30 deployments, policy: `SIT-POC-Minimal-Policy`
  - Both hubs include `model-router` (v2025-11-18, GlobalStandard, capacity 10)

#### 2b. Model Router Testing
- **Location:** `C:\Users\A103605\projects\model-router\`
- **Purpose:** Interactive Python tool to test the `model-router` deployment — fetch routable models, select by provider group / specific / all, enter prompts via prompt_toolkit windows, show responses + token counts
- **Key files:** `main.py` (interactive CLI), `models.py` (ARM queries), `runner.py` (API calls + token tracking), `client.py` (shared clients)
- **Run:** `python main.py` from `C:\Users\A103605\projects\model-router\`


### 3. Red Teaming

#### 3a. Guardrails Red-Team Exercise
- **Location:** `C:\Users\A103605\projects\guardrails\red-teaming\`
- **Branch:** `with-system-prompt` (3-column comparison — most complete)
- **Purpose:** Compare AI-Base-Model-No-Guardrails vs AI-Guardrailed-Models-US-East-2 across 14 exploit tests (content filtering, prompt injection, PII output, protected material, groundedness)
- **Key files:** `main.py`, `exploits/runner.py`, `exploits/categories.py`, `reports/report.py`
- **Output:** `output/report.md`, `output/summary.txt`

---

## Context Switching Rules

- User signals context switch by naming the main project and/or sub-project
- If the user mentions red-teaming files (`runner.py`, `categories.py`, exploit IDs like CS-01, PII-01) → Red Teaming › Guardrails
- If the user asks about Azure ARM, RAI policies, Foundry accounts → Azure AI Foundry › LLM Setup
- If the user mentions model-router testing, routing behaviour, token counts → Azure AI Foundry › Model Router
- If the user mentions Azure RAG, AI Search, agentic retrieval → Azure AI Foundry › Agentic RAG
- If the user mentions AWS, boto3, S3, Bedrock, Lambda → AI Factory › AWS
- If the user mentions LiteLLM proxy, routing algorithms, spend tracking → AI Factory › LiteLLM
- No built-in Claude Code context switching — recommend separate VS Code windows for true isolation
