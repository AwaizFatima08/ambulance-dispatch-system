#!/usr/bin/env bash

set -e

PROJECT_DIR="$HOME/projects/ambulance_dispatch"
COMMIT_MESSAGE="${1:-Project maintenance update - $(date '+%Y-%m-%d %H:%M:%S')}"

cd "$PROJECT_DIR"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "ERROR: This is not a git repository."
    exit 1
fi

echo ""
echo "---- Git Status Before Commit ----"
git status
echo "----------------------------------"
echo ""

git add .

if git diff --cached --quiet; then
    echo "No staged changes to commit."
    exit 0
fi

git commit -m "$COMMIT_MESSAGE"
git push

echo ""
echo "Git update completed successfully."
echo ""
