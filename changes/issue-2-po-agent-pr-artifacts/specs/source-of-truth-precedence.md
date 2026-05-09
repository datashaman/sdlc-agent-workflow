# Spec: Source Of Truth Precedence

Issue: #2

## Title

Committed change artifacts define product state after proposal creation

## Narrative

- **As a:** PO Agent coordinating a change through issue and PR artifacts
- **I want:** the workflow to define which artifact is authoritative at each stage
- **so that:** agents and human reviewers know which source wins when issue text, comments, PR descriptions, and committed files diverge

## Acceptance Criteria

- **Given:** a PO issue has been created
  **When:** no committed proposal exists yet
  **Then:** the issue body is the initial product source material

- **Given:** issue comments contain clarification requests or PO answers
  **When:** those clarifications change product intent
  **Then:** the PO Agent updates the committed proposal or spec files before the change is treated as workflow state

- **Given:** committed proposal and spec files exist under `changes/<change-id>/`
  **When:** architecture review or implementation planning begins
  **Then:** those committed files are the canonical product artifacts

- **Given:** the PR description summarizes product state
  **When:** it differs from committed proposal or spec files
  **Then:** the committed proposal or spec files take precedence

- **Given:** the issue body differs from committed proposal or spec files
  **When:** downstream agents need product context
  **Then:** the issue remains the trigger and source history, but the committed proposal or spec files take precedence
