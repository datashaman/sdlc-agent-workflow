# Workflows

This directory is reserved for future GitHub Actions that enforce or automate the workflow state machine.

Possible checks:

- require an architecture approval before product review
- require product approval before merge
- validate known workflow labels
- prevent invalid state transitions
- prevent labels that duplicate native GitHub state, such as applying `draft` to a draft PR or using a final `merged-closed` label
