# Activity Log

1. PO describes the problem, desired outcome, and acceptance criteria to the PO Agent. `[PO]`

2. PO Agent creates the issue. `[PA]`

3. PO Agent opens a draft PR or working branch and links it to the issue. `[PA]`

4. PO Agent prepares repo-backed product artifacts on the PR. `[PA]`

   1. PO Agent creates or updates `changes/<change-id>/proposal.md` from the issue body and PO clarifications. `[PA]`
   2. PO Agent creates or updates ordered `changes/<change-id>/specs/NN-*.md` specs or user stories from the proposal. `[PA]`
   3. PO Agent ensures specs include Title, Narrative with As a / I want / so that, and Acceptance Criteria with Given / When / Then scenarios. `[PA]`
   4. PO accepts the committed proposal and specs as ready for architecture review. `[PO]`

5. Product clarification loop, until scope is clear enough for architecture review:

   1. Architect Agent reviews the accepted committed product artifacts for scope, feasibility, constraints, and architectural impact, using the issue as source history. `[AA]`
   2. If the work is unclear or infeasible, Architect Agent posts questions or constraints on the issue. `[AA]`
   3. PO Agent reads the issue comments and asks the PO for clarification, if PO Agent cannot clarify intent. `[PA]`
   4. PO or PO Agent clarifies requirements, tradeoffs, or acceptance criteria. `[PO|PA]`
   5. PO Agent updates the committed proposal and spec artifacts with the clarified product direction before architecture review resumes. `[PA]`

6. Architecture planning loop, until the Architect approves the technical direction:

   1. Architect Agent reviews the accepted committed product artifacts and recommends a technical approach to the Architect. `[AA]`
   2. Architect approves, rejects, or adjusts the architecture direction. `[Arch]`
   3. If the Architect rejects or adjusts the direction, Architect Agent revises the technical approach. `[AA]`
   4. If the Architect Agent finds product ambiguity, infeasibility, or missing acceptance criteria, the workflow moves to `needs-product-clarification`. `[AA]`

7. Architect Agent records the approved technical approach in a separate architecture artifact on the PR. `[AA]`

8. Architect Agent breaks the work into implementation tasks. `[AA]`

9. Implementation and review loop, until both GitHub PR technical review and product review pass:

   1. Implementation Agent implements the tasks. `[IA]`
   2. Implementation Agent updates progress in the PR. `[IA]`
   3. Architect Agent reviews the implementation for quality, architecture fit, and alignment with the technical approach. `[AA]`
   4. Architect approves or rejects the implementation from a technical/architectural perspective. `[Arch]`
   5. If Architect rejects the implementation, Architect Agent records required technical changes through GitHub PR review comments or requested-changes review state. `[AA]`
   6. If technical changes are required, Implementation Agent fixes the implementation and the GitHub PR review cycle restarts. `[IA]`
   7. PO Agent checks the delivered behavior against the acceptance criteria during product review. `[PA]`
   8. PO Agent summarizes the outcome for the PO. `[PA]`
   9. PO reviews the delivered behavior. `[PO]`
   10. If PO rejects the delivered behavior, PO Agent records requested behavior changes in the issue or PR. `[PA]`
   11. If behavior changes are required, Implementation Agent fixes the implementation and the implementation loop restarts. `[IA]`

10. If the delivered behavior is accepted, PO approves the outcome. `[PO]`

11. PO Agent records the approval in the issue or PR. `[PA]`

12. Architect Agent merges the PR and closes the issue using native GitHub merged/closed state. `[AA]`
