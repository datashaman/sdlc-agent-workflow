# Spec: Architecture Review Uses Repo Artifacts

Issue: #2

## Title

Architecture review starts from proposal and specs committed on the PR

## Narrative

- **As a:** Architect Agent reviewing a proposed change
- **I want:** proposal and spec artifacts to be present as committed files before technical review begins
- **so that:** architectural feedback is grounded in formalized product intent rather than an informal issue description alone

## Acceptance Criteria

- **Given:** a PR exists for a PO issue
  **When:** the PO Agent has not committed proposal and spec artifacts to the branch
  **Then:** the workflow should not treat the change as ready for architecture review

- **Given:** proposal and spec artifacts exist as committed files on the PR
  **When:** the PO Agent moves the work to architecture review
  **Then:** the Architect Agent reviews those repo artifacts as the primary product context
