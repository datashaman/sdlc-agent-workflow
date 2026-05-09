# Spec 01: Agent Prompt Coverage

## Title

Provide prompt guidance for each workflow agent role

## Narrative

As a workflow user, I want a reusable prompt for each represented agent role, so that I can start the right agent with consistent instructions for its workflow responsibilities.

## Acceptance Criteria

Scenario: Prompt guidance covers documented agent roles

Given `docs/agent-roles.md` defines PO Agent, Architect Agent, and Implementation Agent responsibilities
When the prompt guidance is added
Then there is a prompt for PO Agent (`PA`)
And there is a prompt for Architect Agent (`AA`)
And there is a prompt for Implementation Agent (`IA`)

Scenario: Prompt guidance stays aligned with documented role boundaries

Given each agent role has documented responsibilities
When a user reads the prompt for that role
Then the prompt describes the same responsibilities without expanding the agent into another role's ownership area

## Notes

- Human roles and gates may be referenced as review or handoff targets.
- The primary prompt deliverables are for agent roles, not human-only roles.
