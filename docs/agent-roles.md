# Agent Roles

## PO Agent `[PA]`

Responsibilities:

- create the issue from PO-provided intent
- open or maintain the draft PR / working branch
- keep product direction, acceptance criteria, and requested behavior changes reflected in the issue or PR
- monitor issue comments for clarification requests
- ask the PO for clarification when context is insufficient
- check delivered behavior against acceptance criteria
- summarize the outcome for PO review
- record product approval

## Architect Agent `[AA]`

Responsibilities:

- review issue and PR context for scope, feasibility, constraints, and architecture impact
- post clarification questions or constraints on the issue
- recommend a technical approach to the Architect
- revise the technical approach when the Architect adjusts direction
- record approved technical direction in the PR
- break the work into implementation tasks
- review implementation quality and architecture fit
- record technical changes requested by the Architect
- merge or close the work after product approval and required checks pass

## Implementation Agent `[IA]`

Responsibilities:

- implement assigned tasks
- update progress in the PR
- fix technical changes requested by the Architect / Architect Agent
- fix product behavior changes requested after PO review
