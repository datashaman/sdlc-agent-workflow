# SDLC Agent Workflow

This repository captures a lightweight two-person SDLC workflow where a Product Owner and Architect use agents to manage issue/PR state, implementation, review, and acceptance.

The workflow assumes:

- product intent starts on the issue
- implementation and review happen on the PR
- agents communicate through issue/PR artifacts, not direct private handoffs
- humans remain approval gates for product and architecture decisions

For each change, source of truth is stage-specific:

- before proposal creation, the issue is the trigger and initial product source material
- after PO preparation, committed files under `changes/<change-id>/` are the canonical product artifacts
- the PR body is an index and status summary, not the canonical product artifact

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

## Change Artifacts

Each change may keep its proposal, specs, architecture review, and implementation planning artifacts together under `changes/`.

- [Changes](changes/)
