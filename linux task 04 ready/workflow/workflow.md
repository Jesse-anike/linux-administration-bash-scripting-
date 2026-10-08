# Linux Practical Test Package — Step-by-Step Workflow

## Preparation
Use your own lab VM or an authorized Linux environment. To keep practical artifacts separate from this GitHub repository, create a working directory:
```bash
mkdir -p ~/linux-practical-lab-work
cd ~/linux-practical-lab-work
pwd
```
Unless the source names an absolute path, run the activity commands from this workspace. Confirm existing files before overwriting/deleting them.

## Activity 1 — Navigation & File Management
Create the directory layout and files:
```bash
mkdir -p linux_lab/docs linux_lab/scripts
touch linux_lab/readme.txt linux_lab/notes.txt linux_lab/script.sh
echo "Welcome to Linux Practice" > linux_lab/readme.txt
cp linux_lab/readme.txt linux_lab/docs/
mv linux_lab/notes.txt linux_lab/docs/
rm linux_lab/script.sh
```
- `mkdir -p` creates nested directories.
- `touch` creates empty files if they do not exist.
- `cp` leaves the original `readme.txt` in place and creates a copy inside `docs`.
- `mv` moves `notes.txt` into `docs`.
- `rm` deletes `script.sh`; verify its exact path before running this command.
Verify:
```bash
tree linux_lab
```
If `tree` is not installed yet, use:
```bash
ls -R linux_lab
```
**Expected state:** `linux_lab` contains `readme.txt`, `docs/` with `readme.txt` and `notes.txt`, and `scripts/`; the original `script.sh` and original `notes.txt` should be absent.

## Activity 2 — File Viewing & Editing
Open the file:
```bash
nano linux_lab/readme.txt
```
Keep the original welcome line, then add your own name and brief explanations of:
- **Kernel:** the core of an operating system that manages hardware resources and provides services to programs.
- **FHS (Filesystem Hierarchy Standard):** conventions for organizing directories and files on Linux systems.
- **Shell:** a command interpreter/interface through which users run commands and programs.
Save in Nano with `Ctrl+O`, Enter, then `Ctrl+X`.

Inspect it:
```bash
head -n 3 linux_lab/readme.txt
tail -n 2 linux_lab/readme.txt
wc -w linux_lab/readme.txt
grep -n "Linux" linux_lab/readme.txt
```
Record the actual word count and results. `grep` is case-sensitive in this form.

## Activity 3 — Permissions & Ownership
Create `secure.txt` in the practical workspace:
```bash
touch secure.txt
chmod 640 secure.txt
ls -l secure.txt
```
Mode `640` means owner read/write, group read-only, and others no access.
The assignment then explicitly asks you to change it to `777`:
```bash
chmod 777 secure.txt
ls -l secure.txt
```
Mode `777` grants read/write/execute to everyone. This is intentionally insecure; use only for the isolated practice file and do not use it for credentials or real data.
Create `student2` only if permitted and if it does not already exist:
```bash
getent passwd student2
sudo adduser student2
```
If the first command returns an existing account, do not recreate it. If account creation is not allowed, document that limitation. If the account exists/creation succeeds, change owner:
```bash
sudo chown student2 secure.txt
ls -l secure.txt
```
Verify owner and permission fields. Changing ownership requires authorized privileges.

## Activity 4 — Archiving & Compression
Create a directory with three text files:
```bash
mkdir -p backup_test
printf "First sample file\n" > backup_test/file1.txt
printf "Second sample file\n" > backup_test/file2.txt
printf "Third sample file\n" > backup_test/file3.txt
```
Create and compress the archive:
```bash
tar -cvf backup.tar backup_test
gzip backup.tar
```
`gzip` normally replaces `backup.tar` with `backup.tar.gz`.
Extract into the requested directory:
```bash
mkdir -p restore_test
tar -xzvf backup.tar.gz -C restore_test
```
Verify:
```bash
find restore_test -type f -print
diff -r backup_test restore_test/backup_test
```
No output from `diff -r` typically means the compared file trees match. Record the actual result.

## Activity 5 — Process Management
Start the requested background process:
```bash
sleep 300 &
jobs -l
```
Record the job number and exact PID from your own output. Bring the job to the foreground (replace `%1` if its job number differs):
```bash
fg %1
```
Because `sleep` will occupy the foreground, press `Ctrl+Z` to suspend it, then terminate the exact PID shown by `jobs -l`:
```bash
kill <PID>
```
Replace `<PID>` with the numeric PID—do not type the angle brackets or guess the number. Alternatively, use a second terminal to issue `kill <PID>` while the process is in the foreground. Verify using:
```bash
ps -p <PID> -o pid,stat,cmd
ps aux | grep sleep
```
The `grep` command may display its own process line; distinguish it from the `sleep` process. Finish with:
```bash
top
```
Press `q` to exit `top`.

## Activity 6 — Networking Basics
Inspect local network information:
```bash
ip a
ping google.com -c 4
ss -tulnp
hostname
```
A ping can fail because of network policy, DNS, or connectivity and does not by itself prove the host is misconfigured.
Before editing `/etc/hosts`, check for an existing entry:
```bash
grep -n "testsite.local" /etc/hosts
```
If no appropriate entry exists, add the requested mapping:
```bash
printf '127.0.0.1 testsite.local\n' | sudo tee -a /etc/hosts
```
Avoid creating duplicate entries; if one exists with a different address, review it instead of blindly appending another.
Verify:
```bash
getent hosts testsite.local
ping testsite.local -c 4
```
The mapping should resolve to `127.0.0.1`. Changes to `/etc/hosts` affect the machine's name resolution, so do this only on your lab system.

## Activity 7 — Searching & Finding
Run:
```bash
find / -name readme.txt 2>/dev/null
grep -nH "Linux" linux_lab/docs/*.txt
find . -type f -mmin -1440 -print
find "$HOME" -type f -name '*.txt' 2>/dev/null | wc -l
```
- The first command searches from `/`; it may take time. `2>/dev/null` hides permission-denied messages.
- The second searches `.txt` files in `linux_lab/docs` for the exact case-sensitive word `Linux`.
- The third lists files under the current lab workspace modified in the last 24 hours (`-mmin -1440`).
- The fourth counts `.txt` files beneath your home directory.
Save the actual outputs; empty results may reflect scope or permissions.

## Activity 8 — Package Management (Debian/Ubuntu-based)
Only use these APT commands on a Debian/Ubuntu-based lab system:
```bash
sudo apt update
sudo apt install tree
tree --version
sudo apt remove tree
dpkg-query -W > packages.txt
```
Review the package state before removing `tree`; if it was installed before this lab or another task depends on it, ask your instructor or avoid removing a pre-existing package without authorization. `apt update` refreshes package metadata; `apt install` and `apt remove` alter installed software. The final command records package names/versions visible to `dpkg-query` into `packages.txt` in the current directory. Verify:
```bash
head packages.txt
wc -l packages.txt
```

## Activity 9 — Scripting Basics
Create the script:
```bash
cat > hello.sh <<'EOF'
#!/usr/bin/env bash
echo "Hello, Linux World!"
date
pwd
EOF
```
Make it executable and run it:
```bash
chmod u+x hello.sh
./hello.sh
```
Expected output includes the greeting, current date/time, and working directory. Record the actual date/time and path returned.

## Activity 10 — System Monitoring & Logs
Run:
```bash
df -h
free -h
```
Check the task-specified log location:
```bash
sudo tail -n 10 /var/log/syslog
```
If that file does not exist, try the task's alternative:
```bash
sudo tail -n 10 /var/log/messages
```
Document which log file exists; log locations vary by distribution. Then:
```bash
uptime
who
lscpu
```
Record relevant disk, memory, uptime, user-session, and CPU observations. Do not publish sensitive host details unnecessarily.

## Final verification
Review the directory tree, `secure.txt` permissions/owner, archive and extracted files, `packages.txt`, script output, network results, and saved evidence. Complete `submission/README.md` and replace only the placeholders supported by your real output.