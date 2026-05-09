# State Machine

## Statuses

- `draft`
- `ready-for-architecture-review`
- `needs-product-clarification`
- `architecture-planning`
- `architecture-approved`
- `ready-for-implementation`
- `in-implementation`
- `technical-review`
- `technical-changes-requested`
- `product-review`
- `product-changes-requested`
- `accepted`

## Transitions

```text
draft -> ready-for-architecture-review
ready-for-architecture-review -> needs-product-clarification
needs-product-clarification -> draft
ready-for-architecture-review -> architecture-planning
architecture-planning -> needs-product-clarification
architecture-planning -> architecture-approved
architecture-approved -> ready-for-implementation
ready-for-implementation -> in-implementation
in-implementation -> technical-review
technical-review -> technical-changes-requested
technical-changes-requested -> in-implementation
technical-review -> product-review
product-review -> product-changes-requested
product-changes-requested -> in-implementation
product-review -> accepted
```

## Event Triggers

- PO submits product intent: `draft`
- Issue and PR are created: `draft`
- PO Agent creates committed proposal and ordered spec artifacts: `draft`
- PO accepts the committed proposal and specs for architecture review: `ready-for-architecture-review`
- Architect Agent posts clarification questions: `needs-product-clarification`
- PO Agent updates committed proposal/spec artifacts after clarification: `draft`
- Scope is feasible and clear: `architecture-planning`
- Architecture planning finds product ambiguity or missing acceptance criteria: `needs-product-clarification`
- Architect approves direction: `architecture-approved`
- Tasks are ready: `ready-for-implementation`
- Implementation starts: `in-implementation`
- Implementation is ready for review: `technical-review`
- Architect rejects implementation: `technical-changes-requested`
- Architect approves implementation: `product-review`
- PO rejects delivered behavior: `product-changes-requested`
- PO approves delivered behavior: `accepted`
- Work is merged or closed: native GitHub merged/closed state

## State Requirements

- `draft`: issue creation, PR or branch creation, product clarification, and PO-owned proposal/spec preparation may happen here.
- `ready-for-architecture-review`: requires committed `changes/<change-id>/proposal.md`, ordered `changes/<change-id>/specs/NN-*.md` artifacts, and PO acceptance of those artifacts.
- `needs-product-clarification`: returns control to the PO Agent so PO-owned proposal and spec artifacts can be updated before another architecture review attempt.
- `architecture-planning`: Architect Agent reviews accepted product artifacts and records architecture outputs separately from PO-owned proposal/spec files.
- `architecture-approved`: Architect has approved the technical direction and the work can be broken into implementation tasks.
- `product-review`: PO Agent and PO review delivered behavior against acceptance criteria after technical approval.
- `accepted`: PO has accepted the delivered behavior. After this state, the PR should be merged and the issue should be closed using native GitHub state rather than a final status label.

## GitHub State And Labels

Workflow labels should represent active workflow states that GitHub does not already model.

- Treat absence of a workflow label on an open change issue as `draft`.
- Do not create or apply a `draft` workflow label.
- Use GitHub's native draft PR state for draft PRs. Do not apply a `draft` label to PRs.
- Use GitHub's native merged PR state and closed issue state for completed work.
- Do not use a `merged-closed` workflow label.
- Keep the PR body as an index and status summary. When a workflow label changes, update the PR body status in the same step.
