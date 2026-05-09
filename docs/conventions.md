# Conventions

## Change IDs

Use this format for change folders:

```text
changes/issue-<number>-<short-slug>/
```

Rules:

- start with the GitHub issue number
- use lowercase words separated by hyphens
- keep the slug short but recognizable
- do not rename the folder after reviews have linked to it unless the PR updates all references

Example:

```text
changes/issue-12-agent-review-validation/
```

## PR Review Bodies

GitHub PR review state records approval or requested changes. The review body identifies which human gate the review represents.

Use these prefixes:

- `Architecture review:` for Architect technical approval or requested changes.
- `Product review:` for PO product approval or requested changes.

Examples:

```text
Architecture review: Approved. The implementation follows the accepted approach.
```

```text
Product review: Changes requested. The delivered behavior does not satisfy scenario 2.
```

## PR Bodies

Use `.github/pull_request_template.md`. Keep the PR body as an index to the issue and repo artifacts, not a duplicate state log or product spec.
