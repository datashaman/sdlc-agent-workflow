# Spec 02: Agent Prompt Content

## Title

Define the required content for each agent prompt

## Narrative

As a workflow maintainer, I want each agent prompt to use a consistent structure, so that agents receive complete operating instructions for their workflow stage.

## Acceptance Criteria

Scenario: Prompt identifies the agent and operating context

Given a prompt exists for an agent role
When a user opens the prompt
Then it states the agent identity
And it states the workflow stage or stages where the agent normally operates
And it lists the repo and GitHub context the agent should inspect before acting

Scenario: Prompt defines edit boundaries

Given a prompt exists for an agent role
When a user opens the prompt
Then it lists the artifacts the agent may edit
And it lists the artifacts the agent must not edit directly
And it explains when the agent should request clarification instead of changing another role's artifact

Scenario: Prompt defines handoff expectations

Given a prompt exists for an agent role
When the agent completes its stage of work
Then the prompt tells the agent what state or artifact updates to leave behind
And it tells the agent what summary or review context to provide to the next role or human gate

## Notes

- Prompt structure should be consistent enough to compare across roles.
- Prompt text should remain operational and copy-paste friendly.
