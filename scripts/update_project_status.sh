#!/usr/bin/env bash

set -e

PROJECT_DIR="$HOME/projects/ambulance_dispatch"
DOC_FILE="$PROJECT_DIR/docs/project_command_board_status.md"
BACKUP_DIR="/NAS_BACKUPS/ambulance_dispatch/code_snapshots"

cd "$PROJECT_DIR"

NOW=$(date "+%Y-%m-%d %H:%M:%S")

GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

LATEST_COMMIT=$(git log -1 --pretty=format:'%h - %s (%cd)' --date=short)

if [ -n "$(git status --porcelain)" ]; then
    WORKING_TREE="Dirty"
else
    WORKING_TREE="Clean"
fi

if [ -d "$BACKUP_DIR" ]; then
    LAST_BACKUP=$(ls -t $BACKUP_DIR | head -n 1)
else
    LAST_BACKUP="Backup directory not found"
fi

TMP_FILE=$(mktemp)

awk -v now="$NOW" \
    -v branch="$GIT_BRANCH" \
    -v commit="$LATEST_COMMIT" \
    -v tree="$WORKING_TREE" \
    -v backup="$LAST_BACKUP" '
{
if ($0 ~ /^- Last Updated:/) print "- Last Updated: " now;
else if ($0 ~ /^- Git Branch:/) print "- Git Branch: " branch;
else if ($0 ~ /^- Latest Commit:/) print "- Latest Commit: " commit;
else if ($0 ~ /^- Working Tree:/) print "- Working Tree: " tree;
else if ($0 ~ /^- Last Backup:/) print "- Last Backup: " backup;
else print $0;
}
' "$DOC_FILE" > "$TMP_FILE"

mv "$TMP_FILE" "$DOC_FILE"

echo ""
echo "Project status updated successfully"
echo "----------------------------------"
echo "Last Updated : $NOW"
echo "Git Branch   : $GIT_BRANCH"
echo "Latest Commit: $LATEST_COMMIT"
echo "Working Tree : $WORKING_TREE"
echo "Last Backup  : $LAST_BACKUP"
echo ""
