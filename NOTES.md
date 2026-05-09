# Workflow Dogfood Notes

These are the current process lessons from dogfooding the workflow.

## Settled Decisions

1. Workflow state lives in the repo.
   - `changes/<change-id>/state.md` is the canonical state record.
   - Labels, PR body text, comments, and timeline events are operational signals only.

2. GitHub native state should not be duplicated.
   - PR draft/ready state signals review readiness.
   - PR reviews capture Architect technical approval, PO product approval, and requested changes.
   - Merged PRs and closed issues capture completion.

3. Labels should stay sparse.
   - Keep `implementing` as a blue visual indicator that implementation is actively happening.
   - Keep `needs-product-input` as an orange blocking indicator.
   - Do not add labels for draft, architecture review, product review, accepted, merged, closed, or review-requested states.
   - Do not keep separate `product-review` or `accepted` repo states; PR reviews and native merge/close state already cover them.

4. Artifact ownership matters.
   - PO Agent owns `proposal.md` and `specs/`.
   - Architect Agent owns `architecture.md` and `tasks.md`.
   - After architecture review starts, Architect Agent should not directly edit PO-owned product artifacts.

5. Specs must be ordered from the start.
   - Use deterministic `specs/NN-*.md` filenames.
   - If numeric filenames are not used, provide an explicit ordered index.

6. Tasks must track implementation state in the repo.
   - Use Markdown checkboxes in `tasks.md`.
   - Implementation Agent updates checkboxes as work completes.

7. PR body updates should be rare.
   - The PR body is an index to issue and repo artifacts.
   - Routine state transitions should update `state.md`, not the PR body.
   - Use `.github/pull_request_template.md` to keep PR bodies consistent.

8. GitHub operation intent needs guardrails.
   - Creating new issues should be explicit.
   - When the workflow needs a comment on an existing issue or PR, do not create a new resource.

## Follow-Up Automation Ideas

- Validate `state.md` exists for each active change.
- Validate state names and allowed transitions.
- Validate ordered spec filenames.
- Validate `tasks.md` uses Markdown checkboxes.
- Validate only `implementing` and `needs-product-input` are used as workflow labels.
- Validate workflow label colors and descriptions.
- Warn if PR body appears to carry canonical state instead of linking to repo artifacts.
