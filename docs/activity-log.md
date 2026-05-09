# Activity Log

1. PO describes the problem, desired outcome, and acceptance criteria to the PO Agent. `[PO]`

2. PO Agent creates the issue. `[PA]`

3. PO Agent opens a draft PR or working branch and links it to the issue. `[PA]`

4. Product clarification loop, until scope is clear enough for technical review:

   1. Architect Agent reviews the issue and PR for scope, feasibility, constraints, and architectural impact. `[AA]`
   2. If the work is unclear or infeasible, Architect Agent posts questions or constraints on the issue. `[AA]`
   3. PO Agent reads the issue comments and asks the PO for clarification, if PO Agent cannot clarify intent. `[PA]`
   4. PO or PO Agent clarifies requirements, tradeoffs, or acceptance criteria. `[PO|PA]`
   5. PO Agent updates the issue and PR with the clarified product direction. `[PA]`

5. Architecture planning loop, until the Architect approves the technical direction:

   1. Architect Agent recommends a technical approach to the Architect. `[AA]`
   2. Architect approves, rejects, or adjusts the architecture direction. `[Arch]`
   3. If the Architect rejects or adjusts the direction, Architect Agent revises the technical approach. `[AA]`

6. Architect Agent records the approved technical approach in the PR. `[AA]`

7. Architect Agent breaks the work into implementation tasks. `[AA]`

8. Implementation and acceptance loop, until both technical and product acceptance pass:

   1. Implementation Agent implements the tasks. `[IA]`
   2. Implementation Agent updates progress in the PR. `[IA]`
   3. Architect Agent reviews the implementation for quality, architecture fit, and alignment with the technical approach. `[AA]`
   4. Architect approves or rejects the implementation from a technical/architectural perspective. `[Arch]`
   5. If Architect rejects the implementation, Architect Agent records required technical changes in the PR. `[AA]`
   6. If technical changes are required, Implementation Agent fixes the implementation and the implementation loop restarts. `[IA]`
   7. PO Agent checks the delivered behavior against the acceptance criteria. `[PA]`
   8. PO Agent summarizes the outcome for the PO. `[PA]`
   9. PO reviews the delivered behavior. `[PO]`
   10. If PO rejects the delivered behavior, PO Agent records requested behavior changes in the issue or PR. `[PA]`
   11. If behavior changes are required, Implementation Agent fixes the implementation and the implementation loop restarts. `[IA]`

9. If the delivered behavior is accepted, PO approves the outcome. `[PO]`

10. PO Agent records the approval in the issue or PR. `[PA]`

11. Architect Agent merges or closes the work. `[AA]`
