# Automation Backlog

These are candidate checks for future GitHub Actions or local validation scripts that enforce the repo-first workflow.

Possible checks:

- require `changes/<change-id>/state.md` for active change PRs
- validate known state names and allowed transitions
- require ordered `changes/<change-id>/specs/NN-*.md` files
- require Markdown checkboxes in `changes/<change-id>/tasks.md`
- require PR bodies to link the issue, change folder, state file, and task file
- require Architect PR approval before product review
- require PO PR approval before merge
- warn if `state.md` uses removed terminal/review-only states such as `product-review` or `accepted`
- allow only `implementing` and `needs-product-input` as workflow labels
- validate workflow label colors and descriptions
- warn when labels duplicate native PR draft/ready, PR review, merged PR, or closed issue state
- warn when PR body text appears to carry canonical workflow state instead of linking to repo artifacts

Automation should validate active changes first. Historical completed changes may predate the current workflow and should not block new work unless explicitly migrated.
