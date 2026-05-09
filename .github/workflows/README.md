# Workflows

This directory is reserved for future GitHub Actions that enforce or automate the workflow state machine.

Possible checks:

- require an architecture approval before product review
- require product approval before merge
- validate known workflow labels
- prevent invalid state transitions
- prevent labels that duplicate native GitHub state, such as applying `draft` to a draft PR or using a final `merged-closed` label
- prevent workflow labels that duplicate native PR review state, such as `technical-review` or `technical-changes-requested`
- prevent workflow labels or comments that duplicate native PO product-review approval or requested-changes review state
- prevent workflow labels that duplicate committed architecture artifacts or PR approvals, such as `architecture-planning`, `architecture-approved`, or `ready-for-implementation`
- prevent routine workflow-state labels other than `implementing` and `needs-product-input`
- validate workflow label colors: blue for active implementation, orange for blocked product input
