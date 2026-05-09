# Change Artifacts

Each in-progress workflow change must keep durable workflow artifacts under `changes/<change-id>/`.

The change ID should be stable and readable. Prefer an issue-number prefix plus a short slug, such as `issue-2-po-agent-pr-artifacts`.

## Required Product Artifacts

The PO Agent owns these files throughout the change:

- `proposal.md`: the formalized product intent derived from the issue body and later PO clarifications.
- `specs/NN-*.md`: ordered specs or user stories derived from the proposal.

Each spec file must use a deterministic reading order. Prefer numeric filename prefixes such as `01-repo-backed-proposal.md`, `02-user-story.md`, and `03-acceptance-scenarios.md`. If numeric prefixes are not used, the change folder must include an explicit ordered index.

Each spec or user story should include:

- `Title`: an explicit behavior or capability title.
- `Narrative`: `As a`, `I want`, and `so that` clauses.
- `Acceptance Criteria`: scenarios using `Given`, `When`, and `Then` clauses.

## Review And Implementation Artifacts

Architecture and implementation artifacts must be separate from PO-owned product artifacts:

- `architecture.md`: Architect Agent-owned recommendation, constraints, and approved technical approach.
- `tasks.md`: Architect Agent-owned implementation checklist.
- optional review or dogfood notes, when useful for follow-up work.

After PO preparation is accepted, the committed files under `changes/<change-id>/` are the canonical product artifacts for architecture review and implementation. The issue remains the trigger and source history. The PR body is an index and status summary.

After architecture review begins, the Architect Agent consumes PO-owned product artifacts but does not directly edit them. If product intent needs to change, the workflow moves to `needs-product-clarification` so the PO Agent can update the proposal or specs.
