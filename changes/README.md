# Change Artifacts

Each in-progress workflow change keeps durable artifacts under `changes/<change-id>/`.

The change ID should be stable and readable. Prefer an issue-number prefix plus a short slug, such as `issue-2-po-agent-pr-artifacts`.

## Required Files

Every change folder must include:

- `state.md`: canonical workflow state and state-change record.
- `proposal.md`: PO-owned product intent derived from the issue and PO clarifications.
- `specs/NN-*.md`: PO-owned ordered specs or user stories.
- `architecture.md`: Architect Agent-owned technical approach and constraints.
- `tasks.md`: Architect Agent-owned implementation checklist.

Start from the templates in `changes/templates/` when creating a new change.

## State

`state.md` is the source of truth for workflow state. It should include:

- current state
- last state change date
- actor who moved the state
- short reason or decision record
- links to the relevant issue, PR, review, or artifact

GitHub labels are not the source of truth. Use only:

- `implementing` when implementation work is actively underway
- `needs-product-input` when PO or PO Agent input is blocking progress

The issue should link to the PR, and the PR body should link to the issue and change folder. Keep those links stable; do not use the PR body as the canonical state record.

## Product Artifacts

The PO Agent owns `proposal.md` and `specs/`.

Each spec file must use a deterministic reading order. Prefer numeric filename prefixes such as `01-repo-backed-proposal.md`, `02-user-story.md`, and `03-acceptance-scenarios.md`.

Each spec or user story should include:

- `Title`: an explicit behavior or capability title.
- `Narrative`: `As a`, `I want`, and `so that` clauses.
- `Acceptance Criteria`: scenarios using `Given`, `When`, and `Then` clauses.

After architecture review begins, the Architect Agent consumes PO-owned product artifacts but does not directly edit them. If product intent needs to change, move to `needs-product-input` so the PO Agent can update the proposal or specs.

## Architecture And Tasks

The Architect Agent owns `architecture.md` and `tasks.md`.

`tasks.md` must use Markdown checkboxes so implementation progress can be tracked in the repo:

```markdown
- [ ] Implement the smallest useful behavior slice.
- [ ] Update tests or verification notes.
```

Architecture and task artifacts should reference the accepted product artifacts rather than duplicating them.
