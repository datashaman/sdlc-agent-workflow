# SDLC Agent Workflow

This repository captures a lightweight two-person SDLC workflow where a Product Owner and Architect use agents to manage issue/PR state, implementation, review, and acceptance.

The workflow assumes:

- product intent lives on the issue
- implementation and review happen on the PR
- agents communicate through issue/PR artifacts, not direct private handoffs
- humans remain approval gates for product and architecture decisions

## Core Roles

- `PO`: human Product Owner
- `PA`: PO Agent
- `Arch`: human Architect
- `AA`: Architect Agent
- `IA`: Implementation Agent

## Docs

- [Activity Log](docs/activity-log.md)
- [State Machine](docs/state-machine.md)
- [Agent Roles](docs/agent-roles.md)
