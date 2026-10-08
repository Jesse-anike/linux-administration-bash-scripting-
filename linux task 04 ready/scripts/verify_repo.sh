#!/usr/bin/env bash
set -u
ROOT="${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
failed=0
for p in README.md .gitignore docs/README.md docs/task-overview.md workflow/README.md workflow/workflow.md commands/README.md commands/commands.sh scripts/README.md evidence/README.md submission/README.md submission/command-history.txt submission/final-output.txt; do
  if [[ -f "$ROOT/$p" ]]; then printf '[OK] %s\n' "$p"; else printf '[MISSING] %s\n' "$p"; failed=1; fi
done
for p in evidence/screenshots evidence/terminal-output; do
  if [[ -d "$ROOT/$p" ]]; then printf '[OK] %s/\n' "$p"; else printf '[MISSING] %s/\n' "$p"; failed=1; fi
done
if [[ "$failed" -eq 0 ]]; then echo "Repository structure checks passed."; else echo "Repository structure check found missing items."; fi
exit "$failed"
