# Proposal: PO Agent PR Proposal and User Story Spec Flow

Issue: #2

## Product Intent

The SDLC agent workflow should make the Product Owner issue the trigger for a change, while using committed repository files as the durable state that formalizes product intent for downstream review and implementation.

After the PO Agent creates the issue, the PO Agent should open or update the PR and add product artifacts to the repository on that PR:

- a proposal that restates and sharpens the issue body into explicit product intent
- specs or user stories derived from that proposal
- scenario-based acceptance criteria where possible

Architecture review should begin only after those repo-backed artifacts exist on the PR. The Architect Agent and Architect should review the committed proposal and specs, using the original issue as source context rather than the only product artifact.

## Scope

This PR should ultimately implement issue #2. It currently contains the PO Agent proposal/spec draft for the change. After product clarification and architecture approval, implementation commits should update the workflow documentation in the same PR.

The implementation should describe:

- where proposal artifacts live in the repo
- where specs or user stories live in the repo
- how those artifacts are created from the issue body
- how architecture review uses those artifacts as the primary product context
- how issue text, issue comments, PR descriptions, and committed artifacts relate when they diverge

## Out Of Scope

- automating proposal or spec generation
- changing the GitHub issue template
- replacing the issue as the trigger for new work

## Product Decision

The repository is the source of workflow state for product artifacts. PR descriptions and comments may summarize state, but proposal and spec artifacts should be committed files.

For a change in progress, the source of truth is stage-specific:

- the issue is the trigger and initial source material
- issue comments capture clarification requests and PO responses
- committed files under `changes/<change-id>/` are the canonical product artifacts once created
- the PR description is an index and status summary, not the canonical product artifact

If issue text or comments diverge from committed proposal/spec files, the committed files win for architecture review and implementation. Comments can request or record a product decision, but the PO Agent must update the committed artifacts before that decision becomes workflow state.

The issue template is intentionally out of scope for this change. This change defines the repo-backed proposal/spec flow first; a later change can align the issue template once the artifact workflow is accepted.

## Readiness

This proposal and its specs are accepted as ready for architecture review. The workflow state is `ready-for-architecture-review`.
