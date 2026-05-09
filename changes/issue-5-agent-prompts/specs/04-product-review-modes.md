# Spec 04: Product Review Modes

## Title

Configure product review mode for team and solo workflows

## Narrative

As a Product Owner, I want the workflow prompts to support both peer PO review and solo PO acceptance, so that the same workflow can be used whether another PO is available or I am working alone.

## Acceptance Criteria

Scenario: Team workflow uses peer PO review

Given a change is configured for `peer-po-review`
When the PO Agent prepares product artifacts for review
Then the PR is made ready for product review
And another PO records product acceptance through a GitHub PR review
And `state.md` links to that review before moving to `architecture-review`

Scenario: Solo workflow uses comment acceptance

Given a change is configured for `self-comment-acceptance`
When the PO Agent prepares product artifacts for review
Then the PR is made ready for product review
And the PO records product acceptance with a `Product review:` PR comment
And `state.md` links to that comment before moving to `architecture-review`

Scenario: Both modes preserve the same workflow transition

Given either product review mode is used
When product artifacts are accepted
Then the durable workflow transition remains `draft` to `architecture-review`
And only the evidence linked from `state.md` differs between the modes

## Notes

- `peer-po-review` is preferred when another PO is available.
- `self-comment-acceptance` is acceptable when the PR author cannot approve their own PR or no independent PO reviewer is available.
- The configured mode should be visible to agents before they decide how to request or record product review.
