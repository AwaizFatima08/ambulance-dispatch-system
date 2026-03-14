#!/usr/bin/env bash

set -e

PROJECT_DIR="$HOME/projects/ambulance_dispatch"
BACKUP_ROOT="/NAS_BACKUPS/ambulance_dispatch/code_snapshots"
TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")
ARCHIVE_NAME="ambulance_dispatch_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="$BACKUP_ROOT/$ARCHIVE_NAME"

mkdir -p "$BACKUP_ROOT"

if [ ! -d "$PROJECT_DIR" ]; then
    echo "ERROR: Project directory not found: $PROJECT_DIR"
    exit 1
fi

tar \
  --exclude="$PROJECT_DIR/build" \
  --exclude="$PROJECT_DIR/.dart_tool" \
  --exclude="$PROJECT_DIR/.gradle" \
  --exclude="$PROJECT_DIR/android/.gradle" \
  --exclude="$PROJECT_DIR/.idea" \
  --exclude="$PROJECT_DIR/.git" \
  -czf "$ARCHIVE_PATH" \
  -C "$(dirname "$PROJECT_DIR")" \
  "$(basename "$PROJECT_DIR")"

echo ""
echo "Backup completed successfully"
echo "Backup file: $ARCHIVE_PATH"
echo ""
