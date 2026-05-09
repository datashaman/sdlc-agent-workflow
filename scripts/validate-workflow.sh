#!/usr/bin/env sh
set -eu

failures=0
changed_files=

if [ "$#" -gt 0 ]; then
  if [ "$#" -ne 2 ] || [ "$1" != "--changed-files" ]; then
    printf 'usage: %s [--changed-files <path>]\n' "$0" >&2
    exit 2
  fi

  changed_files=$2
fi

fail() {
  failures=$((failures + 1))
  printf 'error: %s\n' "$1" >&2
}

is_completed_change() {
  grep -q 'Completed through native GitHub state' "$1/state.md"
}

validate_change_id() {
  change_dir=$1
  change_id=${change_dir#changes/}

  case "$change_id" in
    issue-[0-9]*-[a-z0-9]*)
      if printf '%s\n' "$change_id" | grep -Eq '^issue-[0-9]+-[a-z0-9]+(-[a-z0-9]+)*$'; then
        return
      fi
      ;;
  esac

  fail "$change_dir must use changes/issue-<number>-<short-slug>"
}

validate_required_files() {
  change_dir=$1

  for file in state.md proposal.md architecture.md tasks.md; do
    if [ ! -f "$change_dir/$file" ]; then
      fail "$change_dir is missing $file"
    fi
  done

  if [ ! -d "$change_dir/specs" ]; then
    fail "$change_dir is missing specs/"
  fi
}

validate_state() {
  change_dir=$1
  state_file="$change_dir/state.md"

  if [ ! -f "$state_file" ]; then
    return
  fi

  if is_completed_change "$change_dir"; then
    return
  fi

  if ! grep -Eq '`(draft|architecture-review|needs-product-input|implementing)`' "$state_file"; then
    fail "$state_file must contain one active state: draft, architecture-review, needs-product-input, or implementing"
  fi

  if grep -Eq '`(product-review|accepted)`' "$state_file"; then
    fail "$state_file uses a removed workflow state"
  fi
}

validate_specs() {
  change_dir=$1
  specs_dir="$change_dir/specs"

  if [ ! -d "$specs_dir" ]; then
    return
  fi

  spec_count=$(find "$specs_dir" -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')
  if [ "$spec_count" -eq 0 ]; then
    fail "$specs_dir must contain at least one spec file"
    return
  fi

  bad_specs=$(find "$specs_dir" -maxdepth 1 -type f -name '*.md' ! -name '[0-9][0-9]-*.md' -print)
  if [ -n "$bad_specs" ]; then
    for spec in $bad_specs; do
      fail "$spec must use NN-*.md ordering"
    done
  fi
}

validate_tasks() {
  change_dir=$1
  tasks_file="$change_dir/tasks.md"

  if [ ! -f "$tasks_file" ]; then
    return
  fi

  if ! grep -Eq '^- \[[ xX]\] ' "$tasks_file"; then
    fail "$tasks_file must contain Markdown task checkboxes"
  fi
}

validate_changed_files() {
  changed_file_list=$1

  if [ ! -f "$changed_file_list" ]; then
    fail "$changed_file_list does not exist"
    return
  fi

  change_dirs=$(sed -n 's#^\(changes/issue-[^/]*\)/.*#\1#p' "$changed_file_list" | sort -u)
  other_change_paths=$(grep -E '^changes/' "$changed_file_list" | grep -Ev '^changes/(issue-[^/]+|templates)(/|$)' || true)

  if [ -n "$other_change_paths" ]; then
    for path in $other_change_paths; do
      [ -n "$path" ] && fail "$path is under changes/ but not changes/issue-<number>-<short-slug>/"
    done
  fi

  if [ -z "$change_dirs" ]; then
    return
  fi

  change_count=$(printf '%s\n' "$change_dirs" | wc -l | tr -d ' ')
  if [ "$change_count" -ne 1 ]; then
    fail "workflow PRs must touch exactly one changes/issue-* folder; found $change_count"
    printf '%s\n' "$change_dirs" >&2
    return
  fi

  validate_change_id "$change_dirs"
}

found=0

for change_dir in changes/*; do
  [ -d "$change_dir" ] || continue
  [ "$change_dir" = "changes/templates" ] && continue
  found=1

  validate_change_id "$change_dir"
  validate_required_files "$change_dir"
  validate_state "$change_dir"

  if [ -f "$change_dir/state.md" ] && is_completed_change "$change_dir"; then
    continue
  fi

  validate_specs "$change_dir"
  validate_tasks "$change_dir"
done

if [ -n "$changed_files" ]; then
  validate_changed_files "$changed_files"
fi

if [ "$found" -eq 0 ]; then
  printf 'No change folders found.\n'
fi

if [ "$failures" -gt 0 ]; then
  printf 'Workflow validation failed with %s issue(s).\n' "$failures" >&2
  exit 1
fi

printf 'Workflow validation passed.\n'
