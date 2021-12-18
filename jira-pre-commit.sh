#!/usr/bin/env bash

# set this to your active development branch
develop_branch="develop"
current_branch="$(git rev-parse --abbrev-ref HEAD)"
# regex to validate in commit msg
commit_regex='([A-Z]+-[0-9])'
error_msg="Aborting commit. Your commit message is missing either a JIRA Issue, i.e. JIRA-1234, or the jira key is not IN ALL CAPS."

commitTitle="$(cat $1 | head -n1)"

# ignore merge requests
if echo "$commitTitle" | grep -qE "^Merge branch \'"; then
  echo "Commit hook: ignoring branch merge"
  exit 0
fi

[ "$current_branch" == "$develop_branch" ] && exit 0

if ! grep -qE "$commit_regex" "$1"; then
    echo "$error_msg" >&2
    exit 1
fi
