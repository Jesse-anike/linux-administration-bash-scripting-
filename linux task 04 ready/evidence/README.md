# Evidence collection guide

Capture authentic screenshots and terminal output from your own run. The source assignment is a task document, not a supplied completed lab transcript; no fake screenshots or simulated output are included.

## Suggested screenshot sequence

- `01-linux-lab-tree.png` — after Activity 1's `tree`/`ls -R`.
- `02-readme-edit-and-search.png` — after editing and checking the `head`, `tail`, `wc`, and `grep` results.
- `03-secure-permissions-and-owner.png` — show the actual before/after mode and owner for `secure.txt`.
- `04-archive-restore-check.png` — show extraction listing and the `diff` result.
- `05-sleep-process-lifecycle.png` — show the exact job/PID and termination verification.
- `06-network-and-hosts-entry.png` — show network commands and `testsite.local` resolution.
- `07-find-and-grep-results.png` — show the search command and output.
- `08-package-management.png` — show `tree --version` and package-list capture without exposing unrelated private system details.
- `09-hello-script-run.png` — show `hello.sh` and its real output.
- `10-system-monitoring.png` — show disk, memory, log, uptime, users, and CPU checks.

## Terminal-output folder

Save relevant real command output in `evidence/terminal-output/` using names that describe what was captured. Keep outputs readable and redact passwords, tokens, private keys, and sensitive host information before publishing.

## Evidence quality

- Show the command and its result together where possible.
- Capture after commands finish.
- Do not fabricate successful results or hide errors that affect the outcome.
- Explain when a command is unavailable or a result differs due to the Linux distribution.
- Do not include secrets or unrelated personal information.
