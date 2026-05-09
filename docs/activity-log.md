# Activity Log

This is the expected workflow for a change. The durable record is the change folder under `changes/`; GitHub is used for collaboration and review mechanics.

1. PO describes the problem, desired outcome, and acceptance criteria on an issue. `[PO]`

2. PO Agent creates or updates the repo-backed change artifacts on a draft PR or working branch. `[PA]`

   - `changes/<change-id>/state.md`
   - `changes/<change-id>/proposal.md`
   - ordered `changes/<change-id>/specs/NN-*.md`

3. PO accepts the committed proposal and specs as ready for architecture review. `[PO]`

4. PO Agent updates `state.md` to `architecture-review` and marks the PR ready for review. `[PA]`

5. Architect Agent reviews the committed product artifacts for scope, feasibility, constraints, and architectural impact. `[AA]`

6. If product input is needed, Architect Agent asks on the issue or PR, sets `state.md` to `needs-product-input`, and applies the `needs-product-input` label. `[AA]`

7. PO or PO Agent clarifies product intent, updates PO-owned product artifacts, removes the blocking label, and returns `state.md` to the appropriate review state. `[PO|PA]`

8. Architect Agent records the technical approach in `architecture.md` and implementation tasks in `tasks.md`. `[AA]`

9. Architect approves the technical direction with a PR review. `[Arch]`

10. Architect Agent updates `state.md` to `implementing` and applies the `implementing` label while implementation is active. `[AA]`

11. Implementation Agent completes the tasks on the PR and updates task checkboxes in `tasks.md`. `[IA]`

12. Architect Agent reviews implementation quality, architecture fit, and alignment with the approved approach. `[AA]`

13. Architect approves or requests technical changes through a GitHub PR review. `[Arch]`

14. If technical changes are requested, Implementation Agent addresses them and the PR review cycle repeats while `state.md` remains `implementing`. `[IA]`

15. After technical approval, PO Agent summarizes product review context for the PO if needed. `state.md` remains `implementing` until the PR is approved and merged. `[PA]`

16. PO approves or requests product changes through a GitHub PR review. `[PO]`

17. If product changes are requested, PO Agent updates `state.md` to `needs-product-input` or `implementing`, depending on whether requirements or implementation need to change. `[PA]`

18. After PO approval, PO Agent records the review link in `state.md`. `[PA]`

19. Architect Agent merges the PR and closes the issue using native GitHub state. `[AA]`
