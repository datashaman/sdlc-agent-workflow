# Agent Roles

## PO Agent `[PA]`

Responsibilities:

- create the issue from PO-provided intent
- open or maintain the draft PR / working branch
- create and maintain `changes/<change-id>/proposal.md` from the issue body and PO clarifications
- create and maintain ordered `changes/<change-id>/specs/NN-*.md` specs or user stories
- keep product direction, acceptance criteria, and requested behavior changes reflected in PO-owned proposal/spec artifacts
- monitor issue comments for clarification requests
- ask the PO for clarification when context is insufficient
- move work to architecture review only after the PO accepts the committed proposal and spec artifacts
- check delivered behavior against acceptance criteria
- summarize the outcome for PO review
- record product approval

## Architect Agent `[AA]`

Responsibilities:

- review accepted proposal/spec artifacts for scope, feasibility, constraints, and architecture impact
- post clarification questions or constraints on the issue
- recommend a technical approach to the Architect
- revise the technical approach when the Architect adjusts direction
- record approved technical direction in a separate architecture artifact on the PR
- break the work into implementation tasks
- review implementation quality and architecture fit
- record technical changes requested by the Architect
- merge or close the work after product approval and required checks pass

The Architect Agent must not directly edit PO-owned proposal or spec artifacts after architecture review begins. If product ambiguity, infeasibility, or missing acceptance criteria are found, the workflow moves to `needs-product-clarification` so the PO Agent can update those artifacts.

## Implementation Agent `[IA]`

Responsibilities:

- implement assigned tasks
- update progress in the PR
- fix technical changes requested by the Architect / Architect Agent
- fix product behavior changes requested after PO review
