# Architecture: Repo-Backed PO Agent Proposal and Spec Flow

Issue: #2

## Recommendation

Implement the workflow change as a documentation and process-state update in the same PR.

The accepted product artifacts under `changes/issue-2-po-agent-pr-artifacts/` are sufficient for architecture planning. The implementation should update the reusable workflow documentation so future changes follow the same issue-to-proposal-to-architecture-review path.

## Architectural Constraints

- The issue remains the trigger and initial product source material.
- After the PO Agent creates committed files under `changes/<change-id>/`, those files are the canonical product artifacts.
- The PR description is an index and status summary, not the product source of truth.
- The PO Agent owns proposal and product spec/user-story artifacts.
- The Architect Agent must not directly edit PO-owned proposal or spec artifacts after the work is `ready-for-architecture-review`.
- If architecture review finds product ambiguity, infeasibility, or missing acceptance criteria, the workflow moves to `needs-product-clarification`.
- Architecture outputs must be recorded separately from PO-owned product artifacts.

## Implementation Approach

1. Add reusable artifact-structure documentation under `changes/`.
2. Update `docs/activity-log.md` so PO Agent proposal and spec creation occurs after issue/PR creation and before architecture review.
3. Update `docs/state-machine.md` so `ready-for-architecture-review` requires accepted committed product artifacts, not only issue/PR creation.
4. Update `docs/agent-roles.md` to define PO Agent ownership of proposal/spec artifacts and Architect Agent ownership of architecture outputs.
5. Update `README.md` to describe stage-specific source of truth:
   - issue body before proposal creation
   - committed change artifacts after PO preparation
   - PR body as index/status only

## Acceptance Check

The implementation is architecturally complete when the workflow docs consistently describe the same artifact ownership, state transitions, and source-of-truth precedence as the accepted proposal/spec artifacts.
