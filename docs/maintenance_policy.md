# Ambulance Dispatch System — Maintenance Policy

## Purpose
This document defines the development discipline and maintenance framework for the Ambulance Dispatch System project.

It ensures controlled development, proper documentation, reliable backups, and consistent project continuity.

---

# Core Principles

1. Development must remain within the approved version scope.
2. Every milestone must be documented.
3. Every milestone must be backed up.
4. Every milestone should be committed to Git.
5. New ideas must be captured without disturbing current scope.

---

# Mandatory Development Rules

1. Do not start a new major feature before updating the project command board.

2. Every milestone closure must include:
   - Project status update
   - Milestone log entry
   - NAS backup
   - Git commit and push

3. Any new feature request must be categorized as one of:
   - **V1 Current**
   - **V1 Later**
   - **V2+**

4. Deferred features must remain documented in the roadmap until approved.

5. Risky code changes should always be preceded by a backup snapshot.

---

# Status Documentation Rules

The following files define the project state:

| File | Purpose |
|-----|------|
| project_command_board_status.md | Live project status |
| version_roadmap.md | Version scope definition |
| milestone_log.md | Chronological milestone history |

These files must remain synchronized with the development progress.

---

# Backup Policy

Backup types:

### Daily Backup
Automatic backup of project directory to NAS.

### Milestone Backup
Manual backup executed during milestone closure.

Backup location:

/NAS_BACKUPS/ambulance_dispatch/code_snapshots

Backup should exclude:

- build artifacts
- temporary development files
- generated system folders

---

# Git Policy

1. Commit messages should describe the milestone or development change.

2. Push should occur after milestone closure.

3. Avoid long periods of uncommitted local development.

---

# Scope Control

Version-1 must remain intentionally narrow.

Only approved features may enter active coding.

New ideas must be documented before implementation.

Deferred ideas remain preserved for later versions.

---

# Milestone Completion Discipline

A milestone is considered **complete** only when:

- Code is functioning
- Status board is updated
- Milestone log is updated
- Backup is created
- Git commit is recorded
