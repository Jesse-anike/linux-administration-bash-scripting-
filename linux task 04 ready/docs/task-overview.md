# Task Overview — Linux Practical Test Package

Source: `Linux Task 04.pdf`.

The PDF contains ten activities:

1. **Navigation & File Management:** create `linux_lab`, subdirectories `docs` and `scripts`, create three files, write to/copy/move/delete the specified files, and show the tree.
2. **File Viewing & Editing:** add a name and descriptions of Kernel, FHS, and Shell to `readme.txt`; practise `head`, `tail`, `wc`, and `grep`.
3. **Permissions & Ownership:** create `secure.txt`, apply the requested initial permission set and `777`, optionally create `student2`, change ownership, verify.
4. **Archiving & Compression:** create `backup_test` with three text files, make `backup.tar`, gzip it, extract to `restore_test`, verify restored files.
5. **Process Management:** run `sleep 300` in background, view jobs, foreground it, terminate using its PID, verify, and view `top`.
6. **Networking Basics:** inspect IP, test `google.com`, inspect listening ports and hostname, add `127.0.0.1 testsite.local` to `/etc/hosts`, verify by ping.
7. **Searching & Finding:** find `readme.txt`, search `.txt` files in `docs` for `Linux`, find files modified in the last 24 hours, count `.txt` files in the home directory.
8. **Package Management (Debian/Ubuntu-based):** update APT, install/verify/remove `tree`, and redirect installed-package listing to `packages.txt`.
9. **Scripting Basics:** create executable `hello.sh` that prints the greeting, date/time, and working directory; run it.
10. **System Monitoring & Logs:** inspect disk, memory, logs, uptime, logged-in users, and CPU information.

Paths for the later activities are not fully specified in the source. This workflow runs the practical from a separate working directory (`~/linux-practical-lab-work`) and preserves the source's explicit paths such as `linux_lab`, `backup_test`, and `restore_test`. If your instructor specified a different location, use it consistently.