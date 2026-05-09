# Architecture: Generate Workflow Agent Prompts

Issue: #5
PR: #6

## Summary

Add durable, repo-backed prompt guidance for the workflow agent roles documented in `docs/agent-roles.md`.

The implementation should add prompt guidance under `docs/` and link it from the existing workflow documentation. The prompts are documentation artifacts, not executable automation, and should reinforce the current repo-first workflow rather than creating a second state model.

## Constraints

- Prompt guidance must preserve the existing repo-first workflow.
- Prompt guidance must not introduce new workflow states.
- Prompt guidance must preserve PO Agent and Architect Agent artifact ownership boundaries.
- `changes/<change-id>/state.md` remains the canonical workflow state.
- GitHub labels, PR draft state, PR reviews, and comments remain operational signals only.
- Human Architect and PO gates must remain PR-review based.
- Prompt guidance must cover PO Agent (`PA`), Architect Agent (`AA`), and Implementation Agent (`IA`).

## Decisions

- Store prompt guidance in `docs/agent-prompts.md`.
- Use one shared prompt structure for every represented agent role:
  - identity and operating posture
  - context to inspect before acting
  - artifacts the agent may edit
  - artifacts the agent must not edit directly
  - allowed state transitions
  - clarification behavior
  - expected handoff output
- Link the prompt guidance from `README.md` and `docs/agent-roles.md`.
- Keep the prompts copy-paste friendly and operational, with no automation-specific assumptions.
- Treat prompt guidance as an extension of the existing role docs, not a replacement for `docs/agent-roles.md`.

## Risks

- Prompt text could accidentally grant agents authority outside their documented role boundaries.
- Prompt text could imply GitHub comments, PR bodies, labels, or draft state are canonical workflow state.
- A single prompt document could become long enough that users skip relevant sections.
- Implementation could duplicate too much of the role documentation, creating drift between docs.

Mitigations:

- Keep each role prompt anchored to `docs/agent-roles.md` and the artifact ownership rules in `changes/README.md`.
- Explicitly name `changes/<change-id>/state.md` as canonical in every prompt.
- Keep shared guidance concise and role sections scannable.
- Link to source workflow docs instead of copying every rule verbatim.

## Verification

- Run `./scripts/validate-workflow.sh`.
- Check prompt guidance against:
  - `README.md`
  - `docs/agent-roles.md`
  - `docs/workflow-state.md`
  - `changes/README.md`
- Confirm every role in `docs/agent-roles.md` has prompt guidance.
- Confirm no new workflow states or labels are introduced.
