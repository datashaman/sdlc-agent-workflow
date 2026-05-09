# Implementation Tasks: Generate Workflow Agent Prompts

Issue: #5
PR: #6

## Tasks

- [ ] Add `docs/agent-prompts.md` with prompt guidance for PO Agent (`PA`), Architect Agent (`AA`), and Implementation Agent (`IA`).
- [ ] For each prompt, include identity, responsibilities, inputs to inspect, editable artifacts, non-editable artifacts, allowed state transitions, clarification rules, and handoff output.
- [ ] Ensure every prompt preserves `changes/<change-id>/state.md` as canonical workflow state and treats GitHub state as operational signals.
- [ ] Ensure prompt guidance preserves PO Agent ownership of `proposal.md` and `specs/`, and Architect Agent ownership of `architecture.md` and `tasks.md`.
- [ ] Document when agents should ask for clarification or move to `needs-product-input` instead of guessing.
- [ ] Link the prompt guidance from existing workflow docs.
- [ ] Add validation notes confirming consistency with `README.md`, `docs/agent-roles.md`, `docs/workflow-state.md`, and `changes/README.md`.
- [ ] Run `./scripts/validate-workflow.sh`.
