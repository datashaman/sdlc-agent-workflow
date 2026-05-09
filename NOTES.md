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
   - The PR body links the issue and carries optional operational notes.
   - Agents discover changed artifacts from GitHub's changed-files view.
   - Routine state transitions should update `state.md`, not the PR body.
   - Use `.github/pull_request_template.md` to keep PR bodies consistent.

8. GitHub operation intent needs guardrails.
   - Creating new issues should be explicit.
   - When the workflow needs a comment on an existing issue or PR, do not create a new resource.

9. Review identity should be explicit.
   - Architect PR reviews should start with `Architecture review:`.
   - PO PR reviews should start with `Product review:`.

10. Product review may need a PR comment fallback.
   - GitHub does not allow the PR author to approve their own PR.
   - When the PO Agent opens the PR on behalf of the PO, a `Product review:` PR comment can record PO acceptance and trigger automation.
   - If a comment is used as the product gate, `state.md` should link to that comment and explain why it was used instead of a PR approval review.

11. Remote agents need remote artifacts.
   - Local-only `changes/<change-id>/` files are not enough once another agent may work remotely.
   - The PO Agent should push the branch and open a PR before asking another agent or automation to consume the change artifacts.
   - The issue should link to the PR, or receive a comment with the PR link, so remote agents can discover the artifacts from the issue.

12. Product review mode should be configurable.
   - Use `peer-po-review` when another PO is available to approve through a PR review.
   - Use `self-comment-acceptance` when working alone or when GitHub blocks self-approval.
   - Both modes keep the same durable transition, `draft` to `architecture-review`; only the linked acceptance evidence differs.

## Follow-Up Automation Ideas

- Validate `state.md` exists for each active change.
- Validate change IDs use `issue-<number>-<short-slug>`.
- Validate state names and allowed transitions.
- Validate ordered spec filenames.
- Validate `tasks.md` uses Markdown checkboxes.
- Validate workflow PRs touch exactly one `changes/issue-*` folder.
- Validate only `implementing` and `needs-product-input` are used as workflow labels.
- Validate workflow label colors and descriptions.
- Validate workflow PRs change exactly one `changes/issue-*` folder.
- Warn if PR body appears to carry canonical state or duplicate artifact contents.
