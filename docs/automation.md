# Automation Backlog

These are checks for GitHub Actions or local validation scripts that enforce the repo-first workflow.

Implemented:

- `scripts/validate-workflow.sh` validates local workflow artifacts.
- `.github/workflows/validate-workflow.yml` runs the validator on PRs and pushes to `main`.

Current checks:

- require change folders to use `changes/issue-<number>-<short-slug>/`
- require `state.md`, `proposal.md`, `architecture.md`, `tasks.md`, and `specs/`
- validate active state names
- reject removed states such as `product-review` or `accepted`
- require ordered `specs/NN-*.md` files for active changes
- require Markdown checkboxes in `tasks.md` for active changes

Backlog:

- validate workflow PRs change exactly one `changes/issue-*` folder
- require PR bodies to link the issue
- require Architect PR approval before product review
- require PO PR approval before merge
- allow only `implementing` and `needs-product-input` as workflow labels
- validate workflow label colors and descriptions
- warn when labels duplicate native PR draft/ready, PR review, merged PR, or closed issue state
- warn when PR body text appears to carry canonical workflow state or duplicate artifact contents

Automation should validate active changes first. Historical completed changes may predate the current workflow and should not block new work unless explicitly migrated.
