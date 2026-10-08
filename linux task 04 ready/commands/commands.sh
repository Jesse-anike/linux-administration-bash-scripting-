#!/usr/bin/env bash
# Print-only task command reference. No lab commands are executed automatically.
set -eu
cat <<'TASK_COMMANDS'
# Activity 1
mkdir -p linux_lab/docs linux_lab/scripts
touch linux_lab/readme.txt linux_lab/notes.txt linux_lab/script.sh
echo "Welcome to Linux Practice" > linux_lab/readme.txt
cp linux_lab/readme.txt linux_lab/docs/
mv linux_lab/notes.txt linux_lab/docs/
rm linux_lab/script.sh
tree linux_lab
# Alternative if tree is unavailable: ls -R linux_lab

# Activity 2 (open editor and manually add name + Kernel/FHS/Shell descriptions)
nano linux_lab/readme.txt
head -n 3 linux_lab/readme.txt
tail -n 2 linux_lab/readme.txt
wc -w linux_lab/readme.txt
grep -n "Linux" linux_lab/readme.txt

# Activity 3 - isolated test file only
touch secure.txt
chmod 640 secure.txt
ls -l secure.txt
chmod 777 secure.txt
ls -l secure.txt
getent passwd student2
sudo adduser student2
sudo chown student2 secure.txt
ls -l secure.txt

# Activity 4
mkdir -p backup_test
printf "First sample file\n" > backup_test/file1.txt
printf "Second sample file\n" > backup_test/file2.txt
printf "Third sample file\n" > backup_test/file3.txt
tar -cvf backup.tar backup_test
gzip backup.tar
mkdir -p restore_test
tar -xzvf backup.tar.gz -C restore_test
find restore_test -type f -print
diff -r backup_test restore_test/backup_test

# Activity 5 - use the real PID from jobs -l; fg is interactive
sleep 300 &
jobs -l
fg %1
# Press Ctrl+Z, then: kill <PID>
# Verify, replacing <PID> with the actual numeric PID:
ps -p <PID> -o pid,stat,cmd
ps aux | grep sleep
top

# Activity 6
ip a
ping google.com -c 4
ss -tulnp
hostname
grep -n "testsite.local" /etc/hosts
# Only if no suitable entry already exists:
printf '127.0.0.1 testsite.local\n' | sudo tee -a /etc/hosts
getent hosts testsite.local
ping testsite.local -c 4

# Activity 7
find / -name readme.txt 2>/dev/null
grep -nH "Linux" linux_lab/docs/*.txt
find . -type f -mmin -1440 -print
find "$HOME" -type f -name '*.txt' 2>/dev/null | wc -l

# Activity 8 - Debian/Ubuntu-based systems only; review before removing tree
sudo apt update
sudo apt install tree
tree --version
sudo apt remove tree
dpkg-query -W > packages.txt
head packages.txt
wc -l packages.txt

# Activity 9
cat > hello.sh <<'EOF'
#!/usr/bin/env bash
echo "Hello, Linux World!"
date
pwd
EOF
chmod u+x hello.sh
./hello.sh

# Activity 10
df -h
free -h
sudo tail -n 10 /var/log/syslog
# If /var/log/syslog does not exist:
sudo tail -n 10 /var/log/messages
uptime
who
lscpu
TASK_COMMANDS
