# Notes: Workflow Dogfood Issues

Issue: #2

These notes capture process issues observed while running this change through the workflow. They are candidates for follow-up GitHub issues after the current change is complete.

## Candidate Follow-Up Issues

1. Clarify where human approvals should happen.
   - We needed to decide whether Architect approval belongs on the issue or the PR.
   - Current preference: PR review approval should be the authoritative Architect approval event.
   - Follow-up: document which decisions belong on the issue, PR comments, PR reviews, and committed artifacts.

2. Reduce overlap between activity log steps 5 and 6.
   - Step 5.1 says AA recommends a technical approach.
   - Step 6 says AA records the approved technical approach in the PR.
   - In practice, the same `architecture.md` artifact can serve both before and after approval.
   - Follow-up: clarify whether step 6 requires a separate update after approval or whether PR approval promotes the existing architecture artifact.

3. Keep workflow labels and PR status text in sync.
   - The issue label moved to `architecture-approved` while the PR body still said `architecture-planning`.
   - Follow-up: define whether labels, PR body status, or committed artifacts are authoritative for workflow state.

4. Document PO-owned vs AA-owned artifact boundaries.
   - We had to clarify that AA should not edit PO-owned proposal/spec content after `architecture-review`.
   - Mechanical changes, such as ordered filename prefixes, need an explicit exception or handoff rule.
   - Follow-up: document artifact ownership and allowed edit types by workflow state.

5. Require deterministic spec ordering from the start.
   - Initial specs were unordered filenames.
   - The architecture review added numeric prefixes after the fact.
   - Follow-up: make ordered spec filenames part of the initial PO Agent artifact contract.

6. Make GitHub operation intent safer.
   - A wrong GitHub tool call accidentally created issue #4 instead of adding a comment to issue #2.
   - Follow-up: define guardrails for issue-creating operations, such as confirming before creating new issues unless the workflow step explicitly calls for it.

7. Define when to create GitHub issues from dogfood notes.
   - We observed process gaps during a live change, but did not have a formal place to collect follow-up improvements.
   - Follow-up: add a workflow step or artifact for dogfood findings and later issue creation.

8. Decide whether PR body updates are required for every state transition.
   - The PR body is supposed to be an index/status summary, but state changes happened through issue labels first.
   - Resolved: workflow docs now make `state.md` the canonical state record and avoid PR body updates for routine transitions.

9. Rename `product-acceptance` to `product-review`.
   - `product-acceptance` sounds like PO acceptance has already happened.
   - In practice, the state means the implementation is waiting for PO product review after technical approval.
   - Resolved: workflow docs now use `product-review` for the PO review stage and reserve `accepted` for actual PO acceptance.

10. Do not duplicate native GitHub states as labels.
   - PRs already have a native draft state, so a `draft` label is redundant for PRs.
   - Issues already have open/closed state, and PRs already have open/closed/merged state.
   - Resolved: workflow docs now say labels should represent active workflow states GitHub does not already model, draft issues use absence of a workflow label, and draft PRs use GitHub's native draft state.

11. Remove `merged-closed` as a workflow label.
   - Issues close and PRs merge through native GitHub state.
   - A `merged-closed` label duplicates native state and creates another state signal that can drift.
   - Resolved: workflow docs now use native GitHub merged/closed state instead of a final `merged-closed` workflow label.

12. Remove technical review labels in favor of native PR review state.
   - GitHub PR reviews already model technical approval, requested changes, and review discussion.
   - `technical-review` and `technical-changes-requested` labels duplicate PR review state and can drift from the actual PR review outcome.
   - Resolved: workflow docs now keep the workflow in `implementing` while technical review cycles through native GitHub PR review state, then move to `product-review` after Architect technical approval.

13. Collapse product-input labels.
   - `needs-product-clarification` and `product-changes-requested` both mean PO/PO Agent input is needed.
   - The difference was phase-specific, but the label did not need to encode that branch.
   - Resolved: workflow docs now use a single `needs-product-input` state, returning to `draft` before architecture review or `implementing` after product review depending on the current phase.

14. Remove architecture handoff labels.
   - `architecture-planning`, `architecture-approved`, and `ready-for-implementation` made the PR timeline noisy.
   - Architecture planning and approval are already captured by committed architecture artifacts and PR review approval.
   - Resolved: workflow docs now move from `architecture-review` to `implementing` once architecture is approved and tasks are ready.

15. Keep workflow state in the repo.
   - Labels and comments made the PR timeline noisy when used as an event log.
   - Committed change artifacts are already the durable source of truth.
   - Resolved: workflow docs now require `changes/<change-id>/state.md` as the canonical workflow state, with GitHub labels treated as optional queue/attention aids.
