# Implementation Tasks: PO Agent PR Proposal and User Story Spec Flow

Issue: #2

## Tasks

- [ ] Document the reusable change artifact structure.
  - [ ] Add `changes/README.md`.
  - [ ] Define `changes/<change-id>/proposal.md`.
  - [ ] Define ordered `changes/<change-id>/specs/NN-*.md` files.
  - [ ] Define separate AA-owned architecture outputs such as `architecture.md` and `tasks.md`.

- [ ] Update the activity log.
  - [ ] Add PO Agent proposal creation after issue/PR creation.
  - [ ] Add PO Agent spec/user-story creation from the proposal.
  - [ ] Require PO acceptance of committed product artifacts before architecture review.
  - [ ] Preserve the AA clarification path through `needs-product-clarification`.

- [ ] Update the state machine.
  - [ ] Keep `draft` for issue/PR creation and product artifact preparation.
  - [ ] Move to `ready-for-architecture-review` only after committed proposal/spec artifacts exist and PO accepts them.
  - [ ] Keep `needs-product-clarification` as the path back to PO-owned artifact updates.
  - [ ] Preserve `architecture-planning` and `architecture-approved` for AA/Architect work.

- [ ] Update agent role documentation.
  - [ ] Make PO Agent responsible for creating and maintaining proposal/spec artifacts.
  - [ ] Make Architect Agent responsible for reviewing accepted product artifacts and recording architecture outputs separately.
  - [ ] State that AA does not directly edit PO-owned proposal/spec artifacts after architecture review begins.

- [ ] Update README source-of-truth wording.
  - [ ] Describe the issue as trigger and initial source material.
  - [ ] Describe committed change artifacts as canonical after PO preparation.
  - [ ] Describe the PR body as an index/status summary.

- [ ] Check consistency against issue #2 acceptance criteria.
  - [ ] Verify each issue checklist item is covered by the updated docs.
  - [ ] Verify ordered specs remain reflected in the PR artifact index.
