# SDLC Agent Workflow

This repository captures a lightweight SDLC workflow where a Product Owner and Architect use agents to prepare repo-backed change artifacts, implement work through PRs, and record human approval gates.

The current approach is repo-first:

- issues capture the initial product trigger and discussion history
- `changes/<change-id>/` contains the durable workflow artifacts
- `state.md` is the canonical workflow state
- PR draft/ready state signals review readiness
- PR reviews capture Architect technical approval and PO product approval
- labels are limited to active visual signals
- GitHub merged PR and closed issue state capture completion

## Core Roles

- `PO`: human Product Owner
- `PA`: PO Agent
- `Arch`: human Architect
- `AA`: Architect Agent
- `IA`: Implementation Agent

## GitHub Labels

Only two workflow labels are expected:

- `implementing`: implementation work is actively underway
- `needs-product-input`: progress is blocked on PO or PO Agent input

Do not duplicate native GitHub state with labels or repo states for draft PRs, reviews, approvals, merges, or closes.

## Docs

- [Activity Log](docs/activity-log.md)
- [Workflow State](docs/workflow-state.md)
- [Agent Roles](docs/agent-roles.md)
- [Agent Prompts](docs/agent-prompts.md)
- [Conventions](docs/conventions.md)
- [Automation Backlog](docs/automation.md)
- [Change Artifacts](changes/)
