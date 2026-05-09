# Workflows

This directory is reserved for future GitHub Actions that enforce the repo-first workflow.

Possible checks:

- require `changes/<change-id>/state.md` for active change PRs
- validate known state names and allowed transitions
- require ordered `changes/<change-id>/specs/NN-*.md` files
- require Markdown checkboxes in `changes/<change-id>/tasks.md`
- require Architect PR approval before product review
- require PO PR approval before merge
- allow only `implementing` and `needs-product-input` as workflow labels
- validate workflow label colors and descriptions
- warn when labels duplicate native PR draft/ready, PR review, merged PR, or closed issue state
- warn when PR body text appears to carry canonical workflow state instead of linking to repo artifacts
