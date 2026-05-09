# State Machine

## Statuses

- `draft`
- `architecture-review`
- `needs-product-input`
- `implementing`
- `product-review`
- `accepted`

## Transitions

```text
draft -> architecture-review
architecture-review -> needs-product-input
needs-product-input -> draft
architecture-review -> implementing
implementing -> product-review
product-review -> needs-product-input
needs-product-input -> implementing
product-review -> accepted
```

## Event Triggers

- PO submits product intent: `draft`
- Issue and PR are created: `draft`
- PO Agent creates committed proposal and ordered spec artifacts: `draft`
- PO accepts the committed proposal and specs for architecture review: `architecture-review`
- Architect Agent posts clarification questions: `needs-product-input`
- PO Agent updates committed proposal/spec artifacts after clarification: `draft`
- Architecture review finds product ambiguity or missing acceptance criteria: `needs-product-input`
- Architect approves direction and implementation tasks are ready: `implementing`
- Architect approves implementation: `product-review`
- PO rejects delivered behavior: `needs-product-input`
- PO approves delivered behavior: `accepted`
- Work is merged or closed: native GitHub merged/closed state

## State Requirements

- `draft`: issue creation, PR or branch creation, product clarification, and PO-owned proposal/spec preparation may happen here.
- `architecture-review`: requires committed `changes/<change-id>/proposal.md`, ordered `changes/<change-id>/specs/NN-*.md` artifacts, and PO acceptance of those artifacts.
- `needs-product-input`: returns control to the PO Agent or PO when product intent, acceptance criteria, or delivered behavior needs clarification or change.
- `implementing`: Architect has approved the technical direction, implementation tasks exist, and Implementation Agent works on the PR. Technical review, requested changes, and approval happen through native GitHub PR review state and comments while the workflow remains in this state.
- `product-review`: PO Agent and PO review delivered behavior against acceptance criteria after technical approval.
- `accepted`: PO has accepted the delivered behavior. After this state, the PR should be merged and the issue should be closed using native GitHub state rather than a final status label.

## Repo State And GitHub Labels

The canonical workflow state lives in `changes/<change-id>/state.md`.

GitHub labels are optional queue and attention aids. They should not be used as the durable state log.

- Treat absence of a workflow label on an open change issue as `draft`.
- Do not create or apply a `draft` workflow label.
- Use GitHub's native draft PR state for draft PRs. Do not apply a `draft` label to PRs.
- Use GitHub's native PR review state for technical review, approval, and requested implementation changes. Do not create workflow labels for `technical-review` or `technical-changes-requested`.
- Use committed architecture artifacts and PR review approval for architecture planning and approval. Do not create workflow labels for `architecture-planning`, `architecture-approved`, or `ready-for-implementation`.
- Use GitHub's native merged PR state and closed issue state for completed work.
- Do not use a `merged-closed` workflow label.
- Keep the PR body as an index and status summary. Avoid commenting or relabeling for routine state transitions when updating `state.md` is sufficient.
