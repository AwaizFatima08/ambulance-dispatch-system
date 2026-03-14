#!/usr/bin/env bash

set -e

PROJECT_DIR="$HOME/projects/ambulance_dispatch"
SCRIPTS_DIR="$PROJECT_DIR/scripts"
MILESTONE_LOG="$PROJECT_DIR/docs/milestone_log.md"
COMMIT_MESSAGE="${1:-Milestone closeout - $(date '+%Y-%m-%d %H:%M:%S')}"

cd "$PROJECT_DIR"

if [ ! -f "$MILESTONE_LOG" ]; then
    echo "ERROR: Milestone log not found: $MILESTONE_LOG"
    exit 1
fi

bash "$SCRIPTS_DIR/update_project_status.sh"
bash "$SCRIPTS_DIR/daily_backup.sh"

BACKUP_DIR="/NAS_BACKUPS/ambulance_dispatch/code_snapshots"
LAST_BACKUP=$(ls -t "$BACKUP_DIR" | head -n 1)

cat >> "$MILESTONE_LOG" <<EOF

---

## Milestone Closure Record

### Date
$(date '+%Y-%m-%d %H:%M:%S')

### Version
V1

### Summary
Milestone closeout executed through maintenance framework.

### Files Updated
- docs/project_command_board_status.md
- docs/milestone_log.md

### Functional Outcome
- Status board refreshed
- Backup generated
- Milestone continuity preserved

### Test Status
- Maintenance scripts executed successfully

### Git Commit
Pending current closeout commit

### Backup Created
$LAST_BACKUP

### Notes for Next Session
Resume from documented command board status.
EOF

bash "$SCRIPTS_DIR/git_update.sh" "$COMMIT_MESSAGE"

echo ""
echo "Milestone closeout completed successfully."
echo ""
