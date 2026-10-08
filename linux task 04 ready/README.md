# Linux Practical Test Package

**Source assignment:** `Linux Task 04.pdf`  
**Purpose:** A GitHub-ready, learning-friendly workflow for completing the supplied Linux practical tasks.

A ten-activity Linux practical package focused on foundational administration. It follows the source's coverage of files/navigation, file viewing/editing, permissions/ownership, archiving/compression, processes, networking, searching, Debian/Ubuntu package management, scripting, and system monitoring/logs.

> **Important:** This repository is a guide and evidence template. It does not claim any commands have been run or that the lab has been completed. Use your own actual terminal results.

## How to use this repository

1. Read `workflow/workflow.md` before starting.
2. Use a disposable Linux VM or a machine you are authorized to administer.
3. Follow the activities in their original order and run commands manually.
4. Capture authentic screenshots and terminal output under `evidence/`.
5. Complete the checklist in `submission/README.md`.
6. Review all files and evidence for passwords, tokens, private details, and unrelated system information before publishing the repository to GitHub.

## Included files

```text
linux-practical-test-package/
├── README.md
├── .gitignore
├── docs/
│   ├── README.md
│   └── task-overview.md
├── workflow/
│   ├── README.md
│   └── workflow.md
├── commands/
│   ├── README.md
│   └── commands.sh
├── scripts/
│   ├── README.md
│   └── verify_repo.sh
├── evidence/
│   ├── README.md
│   ├── screenshots/
│   └── terminal-output/
└── submission/
    ├── README.md
    ├── command-history.txt
    └── final-output.txt
```

## Requirements and environment

- A Linux machine/VM with a terminal.
- For activities requiring administrative operations, an authorized account with `sudo`.
- On the Debian/Ubuntu package-management activity, access to `apt` and network connectivity may be required.
- Some networking checks require internet connectivity; results depend on your network and DNS.

## Safety and integrity

- Activities 3, 5, 6, 8, and 10 may require elevated permissions or change real system state.
- `chmod 777 secure.txt` intentionally creates world-readable, writable, and executable permissions as requested by the assignment. Use only on an isolated test file and do not leave real or sensitive files at mode 777.
- Creating `student2`, changing file ownership, installing/removing `tree`, and editing `/etc/hosts` affect the machine. Check for existing accounts, files, package state, and host entries before changing them.
- Process-management activities intentionally terminate the lab's `sleep` process. Identify the exact PID from your own session; never kill a process based on a guessed PID.
- Network scans/pings and system logs should be collected only on systems you are authorized to inspect.

The command reference `commands/commands.sh` is deliberately print-only. It shows the command sequence without executing it automatically, so you can learn each operation, inspect its result, and capture evidence at the correct moment.

## Validation

Run the package structure check from the extracted project:

```bash
bash scripts/verify_repo.sh
```

This checks repository files and folders only. It does not certify that the practical tasks were completed.
