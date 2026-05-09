# Workflow State

The workflow has one durable state record per change:

```text
changes/<change-id>/state.md
```

GitHub labels, PR titles, PR bodies, issue comments, and timeline events are not the source of truth for workflow state. They are operational signals only.

## States

`state.md` may use these states:

- `draft`: product intent and repo-backed product artifacts are still being prepared.
- `architecture-review`: committed product artifacts are ready for Architect review.
- `needs-product-input`: progress is blocked on PO or PO Agent clarification or product change.
- `implementing`: implementation work or technical review is active.
- `product-review`: technically approved work is ready for PO product review.
- `accepted`: PO has accepted the delivered behavior.

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
accepted -> native GitHub merge and issue close
```

## GitHub Signals

Use GitHub for collaboration mechanics, not as a second workflow state machine.

- Use the PR draft state while the change is not ready for human review.
- Mark the PR ready for review when Architect or PO review is needed.
- Use PR reviews for Architect technical approval or requested changes.
- Use PR reviews for PO product approval or requested changes.
- Use native merged PR state and closed issue state for completed work.
- Keep the PR body as an index to the issue and repo artifacts.

## Labels

Only use labels for visible queue signals that are useful at a glance.

- `implementing` `#1d76db`: implementation work is actively underway.
- `needs-product-input` `#d93f0b`: progress is blocked on PO or PO Agent input.

Do not add labels for states already represented by `state.md`, PR draft/ready state, PR reviews, merged PRs, or closed issues.

## State Record

`state.md` should include:

- current state
- last state change date
- actor who moved the state
- short reason or decision record
- links to relevant issue, PR, review, or committed artifact

Routine transitions should update `state.md`. Avoid timeline noise from comments, label churn, or PR body edits when a state-file update is sufficient.
