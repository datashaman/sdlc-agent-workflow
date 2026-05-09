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

This change updates the workflow documentation so PO Agent proposal/spec creation is an explicit step between issue creation and architecture review.

The implementation should describe:

- where proposal artifacts live in the repo
- where specs or user stories live in the repo
- how those artifacts are created from the issue body
- how architecture review uses those artifacts as the primary product context

## Out Of Scope

- automating proposal or spec generation
- changing the GitHub issue template
- replacing the issue as the trigger for new work

## Product Decision

The repository is the source of workflow state for product artifacts. PR descriptions and comments may summarize state, but proposal and spec artifacts should be committed files.
