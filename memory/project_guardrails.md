---
name: project-guardrails-sit-foundry
description: "SIT Azure AI Foundry guardrails implementation — two hubs in SIT-AI-Foundry-Exploration, eastus2"
metadata: 
  node_type: memory
  type: project
  originSessionId: 2e4d47eb-26d3-4329-8f5c-94fffa722298
---

Implemented guardrails for two Foundry hubs in resource group `SIT-AI-Foundry-Exploration` (eastus2), subscription `bad3b55c-7d64-4695-8809-9394df8ba15d` (Enterprise Architecture).

**Why:** SIT needs a guardrailed hub for public/partner-facing use and a minimal-restriction hub for internal POC/research.

**Hub 1: AI-Guardrailed-Models-US-East-2**
- Policy: `SIT-External-Guardrail` (tightest settings — Low threshold, block on all 13 filters)
- Sourced from: `SIT_guardrail_external.yaml` in Downloads
- Assigned to: all 29 model deployments
- Note: PII and Groundedness filters not available via ARM API contentFilters — must be configured in Foundry portal

**Hub 2: AI-Base-Model-No-Guardrails** (new hub, also in SIT-AI-Foundry-Exploration)
- Policy: `SIT-POC-Minimal-Policy` (lowest without exceptions approval — High threshold, blocking=true, Protected Material annotate-only)
- Fully disabling filters requires aka.ms/oai/rai/exceptions approval from Microsoft
- Assigned to: all 29 model deployments
- 3 Anthropic models (claude-haiku-4-5, claude-sonnet-4-6, claude-opus-4-7) required manual portal deployment (terms acceptance) or modelProviderData field

**29 models (both hubs):** DeepSeek-R1-0528, DeepSeek-V3.2, DeepSeek-V4-Flash, DeepSeek-V4-Pro, claude-haiku-4-5, Llama-3.3-70B-Instruct, Llama-4-Scout-17B-16E-Instruct, Phi-4, Phi-4-mini-reasoning, Phi-4-multimodal-instruct, Mistral-Large-3, mistral-medium-2505, mistral-small-2503, gpt-4o, gpt-4o-mini, gpt-4.1, gpt-4.1-mini, gpt-5.5, gpt-5.4, gpt-5.4-mini, gpt-5.4-nano, gpt-5-pro, gpt-5.1-codex-max, gpt-5-codex, grok-4.3, grok-4-20-reasoning, grok-4-1-fast-reasoning, claude-sonnet-4-6, claude-opus-4-7

**How to apply:** When working on this project, reference ARM resource IDs above and use api-version `2025-04-01-preview` for raiPolicies and deployments.
