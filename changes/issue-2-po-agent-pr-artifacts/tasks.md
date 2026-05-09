# Implementation Tasks: PO Agent PR Proposal and User Story Spec Flow

Issue: #2

## Tasks

- [x] Document the reusable change artifact structure.
  - [x] Add `changes/README.md`.
  - [x] Define `changes/<change-id>/proposal.md`.
  - [x] Define ordered `changes/<change-id>/specs/NN-*.md` files.
  - [x] Define separate AA-owned architecture outputs such as `architecture.md` and `tasks.md`.

- [x] Update the activity log.
  - [x] Add PO Agent proposal creation after issue/PR creation.
  - [x] Add PO Agent spec/user-story creation from the proposal.
  - [x] Require PO acceptance of committed product artifacts before architecture review.
  - [x] Preserve the AA clarification path through `needs-product-input`.

- [x] Update the state machine.
  - [x] Keep `draft` for issue/PR creation and product artifact preparation.
  - [x] Move to `ready-for-architecture-review` only after committed proposal/spec artifacts exist and PO accepts them.
  - [x] Keep `needs-product-input` as the path back to PO-owned artifact updates.
  - [x] Preserve AA/Architect work through architecture artifacts and PR review approval.

- [x] Update agent role documentation.
  - [x] Make PO Agent responsible for creating and maintaining proposal/spec artifacts.
  - [x] Make Architect Agent responsible for reviewing accepted product artifacts and recording architecture outputs separately.
  - [x] State that AA does not directly edit PO-owned proposal/spec artifacts after architecture review begins.

- [x] Update README source-of-truth wording.
  - [x] Describe the issue as trigger and initial source material.
  - [x] Describe committed change artifacts as canonical after PO preparation.
  - [x] Describe the PR body as an index/status summary.

- [x] Check consistency against issue #2 acceptance criteria.
  - [x] Verify each issue checklist item is covered by the updated docs.
  - [x] Verify ordered specs remain reflected in the PR artifact index.
