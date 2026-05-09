# Agent Roles

## PO Agent `[PA]`

Responsibilities:

- create or maintain the issue from PO-provided intent
- open or maintain the draft PR or working branch
- maintain PO-owned state transitions in `changes/<change-id>/state.md`
- create and maintain `changes/<change-id>/proposal.md`
- create and maintain ordered `changes/<change-id>/specs/NN-*.md`
- keep product direction, acceptance criteria, and requested behavior changes reflected in PO-owned artifacts
- ask the PO for clarification when context is insufficient
- move work to `architecture-review` only after PO accepts the committed product artifacts
- prepare product-review context for the PO
- record PO review outcomes from GitHub PR reviews in `state.md`

## Architect Agent `[AA]`

Responsibilities:

- review accepted product artifacts for scope, feasibility, constraints, and architecture impact
- ask for product clarification when product intent or acceptance criteria are insufficient
- maintain architecture-owned transitions in `state.md`
- create and maintain `changes/<change-id>/architecture.md`
- create and maintain `changes/<change-id>/tasks.md`
- keep implementation task checkboxes suitable for progress tracking
- review implementation quality and architecture fit
- ensure technical approval or requested changes happen through GitHub PR reviews
- merge or close the work after PO approval and required checks pass

The Architect Agent must not directly edit PO-owned proposal or spec artifacts after architecture review begins. If product intent needs to change, move the workflow to `needs-product-input` so the PO Agent can update those artifacts.

## Implementation Agent `[IA]`

Responsibilities:

- implement assigned tasks
- update task checkboxes in `changes/<change-id>/tasks.md`
- address technical changes requested through GitHub PR review
- address product behavior changes requested through GitHub PR review

## Human Gates

- PO acceptance of product artifacts gates architecture review.
- Architect PR review gates implementation and technical approval.
- PO PR review gates product acceptance.
