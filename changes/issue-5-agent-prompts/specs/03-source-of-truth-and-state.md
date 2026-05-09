# Spec 03: Source Of Truth And State

## Title

Preserve repo-first workflow state in prompts

## Narrative

As a Product Owner, I want the generated prompts to preserve the workflow source-of-truth model, so that agents do not treat issue labels, PR bodies, or comments as competing workflow state.

## Acceptance Criteria

Scenario: Prompt guidance names the canonical state file

Given an agent prompt includes workflow state instructions
When the prompt refers to current workflow state
Then it identifies `changes/<change-id>/state.md` as canonical
And it treats GitHub labels, PR draft state, PR reviews, and comments as operational signals only

Scenario: Prompt guidance preserves human gates

Given the workflow uses human PO and Architect gates
When prompt guidance describes handoffs
Then it describes Architect technical approval as a PR review
And it describes PO product approval according to the configured product review mode
And it does not replace those gates with agent-only approval

Scenario: Prompt guidance tells agents when to ask for clarification

Given an agent lacks enough context to perform its role safely
When the agent prompt describes the expected behavior
Then it instructs the agent to ask for clarification rather than guess
And it points to `needs-product-input` when product clarification blocks progress

## Notes

- This change should not introduce new workflow states.
- Prompt guidance should reinforce the existing state transitions in `docs/workflow-state.md`.
