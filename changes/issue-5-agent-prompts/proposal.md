# Proposal: Generate Workflow Agent Prompts

Issue: #5

## Problem

The workflow defines the represented agents and their responsibilities, but it does not provide reusable prompts that a user can give to each agent when starting or resuming work. Without prompt guidance, agent behavior can drift across changes, especially around artifact ownership, state transitions, clarification requests, and handoffs.

## Desired Outcome

The repository should include durable prompt guidance for every agent role represented in `docs/agent-roles.md`.

Each prompt should help the agent operate within the existing repo-first workflow by making clear:

- who the agent is representing
- what context the agent should inspect before acting
- which artifacts the agent owns
- which artifacts the agent must not directly edit
- which workflow state transitions the agent may perform
- when the agent should ask for clarification
- what handoff output the agent should leave for the next role

## Scope

In scope:

- prompts for PO Agent (`PA`), Architect Agent (`AA`), and Implementation Agent (`IA`)
- documentation for where the prompts live and how they should be used
- configurable product-review modes for team and solo PO workflows
- alignment with the existing issue-triggered, repo-backed workflow
- consistency checks against the current workflow docs

Out of scope:

- adding new workflow states
- replacing the existing role definitions
- automating prompt execution
- generating prompts for human-only roles as primary deliverables

## Acceptance Summary

- Every agent role represented in `docs/agent-roles.md` has prompt guidance.
- Each prompt includes identity, inputs, edit boundaries, state authority, clarification rules, and handoff expectations.
- Prompt guidance preserves `changes/<change-id>/state.md` as the canonical workflow state.
- Prompt guidance preserves PO Agent ownership of product artifacts and Architect Agent ownership of architecture/task artifacts.
- Prompt guidance explains how the product review gate works in both `peer-po-review` and `self-comment-acceptance` modes.
- Existing workflow docs link to or describe the prompt location.

## Open Product Questions

- None.
