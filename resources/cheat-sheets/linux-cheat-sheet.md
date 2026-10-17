# Linux Commands Cheat Sheet

Quick reference for essential Linux commands for infrastructure engineers.

---

## 📁 File & Directory Operations

### Navigation
```bash
# Print working directory
pwd

# List files
ls
ls -l  # Long format
ls -la  # Include hidden files
ls -lh  # Human-readable sizes
ls -ltr  # Sort by time, reverse

# Change directory
cd /path/to/directory
cd ..  # Parent directory
cd ~  # Home directory
cd -  # Previous directory

# Create directory
mkdir mydir
mkdir -p path/to/nested/dir  # Create parent directories

# Remove directory
rmdir mydir  # Only empty directories
rm -r mydir  # Recursive delete
rm -rf mydir  # Force recursive delete
```

### File Operations
```bash
# Create empty file
touch file.txt

# Copy files
cp source dest
cp -r source_dir dest_dir  # Recursive copy
cp -p file1 file2  # Preserve attributes

# Move/rename files
mv source dest
mv oldname newname

# Remove files
rm file.txt
rm -f file.txt  # Force delete
rm -i file.txt  # Interactive (confirm)

# Create symbolic link
ln -s /path/to/file linkname

# Find files
find . -name "*.txt"
find /path -type f -name "pattern"
find . -mtime -7  # Modified in last 7 days
find . -size +100M  # Files larger than 100MB
```

---

## 📖 Viewing Files

```bash
# View entire file
cat file.txt

# View with line numbers
cat -n file.txt

# Concatenate files
cat file1.txt file2.txt > combined.txt

# View file page by page
less file.txt
more file.txt

# View first N lines
head file.txt
head -n 20 file.txt

# View last N lines
tail file.txt
tail -n 20 file.txt

# Follow file (real-time updates)
tail -f /var/log/syslog

# View file with syntax highlighting (if installed)
bat file.txt
```

---

## 🔍 Searching & Filtering

### grep
```bash
# Search in file
grep "pattern" file.txt

# Case-insensitive search
grep -i "pattern" file.txt

# Recursive search in directory
grep -r "pattern" /path/to/dir

# Show line numbers
grep -n "pattern" file.txt

# Show count of matches
grep -c "pattern" file.txt

# Invert match (lines NOT matching)
grep -v "pattern" file.txt

# Extended regex
grep -E "pattern1|pattern2" file.txt

# Search multiple files
grep "pattern" *.txt

# Context lines
grep -A 3 "pattern" file.txt  # 3 lines after
grep -B 3 "pattern" file.txt  # 3 lines before
grep -C 3 "pattern" file.txt  # 3 lines before and after
```

### find
```bash
# Find by name
find /path -name "filename"

# Find by type
find /path -type f  # Files
find /path -type d  # Directories

# Find and execute
find /path -name "*.log" -exec rm {} \;

# Find recently modified
find /path -mtime -1  # Last 24 hours

# Find by size
find /path -size +100M
find /path -size -1M

# Find by permissions
find /path -perm 644
```

---

## ✏️ Text Processing

### sed
```bash
# Replace text (first occurrence)
sed 's/old/new/' file.txt

# Replace all occurrences
sed 's/old/new/g' file.txt

# Replace in-place
sed -i 's/old/new/g' file.txt

# Delete lines
sed '/pattern/d' file.txt

# Print specific lines
sed -n '5,10p' file.txt  # Lines 5-10
```

### awk
```bash
# Print specific column
awk '{print $1}' file.txt

# Print with delimiter
awk -F':' '{print $1, $3}' /etc/passwd

# Sum column
awk '{sum+=$1} END {print sum}' file.txt

# Print lines matching pattern
awk '/pattern/ {print}' file.txt
```

### cut
```bash
# Cut by character position
cut -c1-10 file.txt

# Cut by delimiter
cut -d',' -f1,3 file.csv

# Cut by field
cut -f1 file.txt
```

### sort & uniq
```bash
# Sort file
sort file.txt

# Sort numerically
sort -n file.txt

# Reverse sort
sort -r file.txt

# Sort by column
sort -k2 file.txt

# Remove duplicates
sort file.txt | uniq

# Count duplicates
sort file.txt | uniq -c

# Show only duplicates
sort file.txt | uniq -d
```

---

## 👤 User & Permission Management

### Users
```bash
# Current user
whoami

# Switch user
su - username

# Run as superuser
sudo command

# Add user
sudo useradd username
sudo adduser username  # Interactive

# Delete user
sudo userdel username
sudo deluser username

# Change password
passwd
sudo passwd username

# View user info
id
id username
```

### Permissions
```bash
# Change file permissions
chmod 755 file.txt
chmod u+x file.txt  # Add execute for user
chmod g-w file.txt  # Remove write for group
chmod o+r file.txt  # Add read for others

# Change ownership
chown user file.txt
chown user:group file.txt
chown -R user:group directory/

# Change group
chgrp group file.txt

# View permissions
ls -l file.txt
```

**Permission Numbers:**
- 4 = read (r)
- 2 = write (w)
- 1 = execute (x)
- 755 = rwxr-xr-x (owner: rwx, group: r-x, others: r-x)
- 644 = rw-r--r-- (owner: rw, group: r, others: r)

---

## 🔄 Process Management

### Viewing Processes
```bash
# List processes
ps
ps aux  # All processes, detailed
ps -ef  # Full format

# Process tree
pstree

# Real-time process viewer
top
htop  # Better alternative (if installed)

# Process by name
ps aux | grep process_name

# Show process by PID
ps -p 1234
```

### Managing Processes
```bash
# Run in background
command &

# Bring to foreground
fg

# List background jobs
jobs

# Kill process
kill PID
kill -9 PID  # Force kill

# Kill by name
killall process_name
pkill process_name

# Nice (priority)
nice -n 10 command  # Lower priority
renice -n 5 -p PID  # Change priority
```

---

## 💾 Disk & Storage

### Disk Usage
```bash
# Disk space usage
df -h

# Directory size
du -sh directory/
du -h --max-depth=1 directory/

# Largest directories
du -h | sort -rh | head -10

# Inodes usage
df -i
```

### Mounting
```bash
# List mounted filesystems
mount

# Mount filesystem
sudo mount /dev/sdb1 /mnt/usb

# Unmount
sudo umount /mnt/usb

# List block devices
lsblk
```

---

## 🌐 Network Commands

### Network Info
```bash
# IP address
ip addr
ip a
ifconfig  # Older command

# Network interfaces
ip link

# Routing table
ip route
route -n

# DNS lookup
nslookup google.com
dig google.com

# Test connectivity
ping google.com

# Trace route
traceroute google.com
tracepath google.com
```

### Network Connections
```bash
# Active connections
netstat -tulpn
ss -tulpn  # Modern alternative

# Listening ports
netstat -ln
ss -ln

# Check specific port
netstat -an | grep :80

# Download file
wget https://example.com/file.txt
curl -O https://example.com/file.txt

# HTTP request
curl https://api.example.com
```

---

## 📦 Package Management

### Debian/Ubuntu (apt)
```bash
# Update package list
sudo apt update

# Upgrade packages
sudo apt upgrade
sudo apt dist-upgrade

# Install package
sudo apt install package_name

# Remove package
sudo apt remove package_name
sudo apt purge package_name  # Remove config too

# Search package
apt search package_name

# Show package info
apt show package_name

# Clean cache
sudo apt clean
sudo apt autoclean
```

### RHEL/CentOS (yum/dnf)
```bash
# Update packages
sudo yum update
sudo dnf update  # Newer systems

# Install package
sudo yum install package_name

# Remove package
sudo yum remove package_name

# Search package
yum search package_name

# Show package info
yum info package_name
```

---

## 🔐 SSH & Remote Access

```bash
# Connect to remote host
ssh user@host

# Connect with specific port
ssh -p 2222 user@host

# Connect with key
ssh -i ~/.ssh/key.pem user@host

# Copy files to remote
scp file.txt user@host:/path/
scp -r directory/ user@host:/path/

# Copy from remote
scp user@host:/path/file.txt .

# Sync directories (rsync)
rsync -avz source/ user@host:/dest/

# Generate SSH key
ssh-keygen -t rsa -b 4096

# Copy SSH key to remote
ssh-copy-id user@host
```

---

## 🔍 System Information

```bash
# System info
uname -a  # All info
uname -r  # Kernel version

# OS version
cat /etc/os-release
lsb_release -a

# CPU info
lscpu
cat /proc/cpuinfo

# Memory info
free -h
cat /proc/meminfo

# Disk info
lsblk
fdisk -l

# System uptime
uptime

# Last logged in users
last
who
w

# System logs
journalctl  # systemd systems
tail -f /var/log/syslog
```

---

## 🛠️ Useful One-Liners

```bash
# Find and delete files older than 30 days
find /path -type f -mtime +30 -delete

# Find largest files
find /path -type f -exec ls -lh {} \; | sort -k5 -rh | head -10

# Count files in directory
find /path -type f | wc -l

# Check which ports are listening
sudo netstat -tulpn | grep LISTEN

# Kill all processes by name
pkill -9 process_name

# Monitor log file
tail -f /var/log/syslog | grep ERROR

# Create backup with timestamp
tar -czf backup-$(date +%Y%m%d).tar.gz /path/to/backup

# Find and replace in multiple files
find . -type f -name "*.txt" -exec sed -i 's/old/new/g' {} \;

# Check disk I/O
iostat -x 1

# Monitor network traffic
iftop  # If installed
nethogs  # If installed

# Create directory and cd into it
mkdir mydir && cd mydir

# Find broken symlinks
find /path -type l ! -exec test -e {} \; -print
```

---

## ⚡ Performance Monitoring

```bash
# CPU usage
top
htop
mpstat 1

# Memory usage
free -h
vmstat 1

# Disk I/O
iostat -x 1
iotop  # If installed

# Network I/O
iftop  # If installed
nload  # If installed

# Overall system stats
dstat
```

---

## 💡 Pro Tips

1. **Use Tab completion** - Press Tab to autocomplete paths and commands
2. **Use history** - Press Up arrow or `history` command to view previous commands
3. **Reverse search** - Press `Ctrl+R` to search command history
4. **Aliases** - Add to `~/.bashrc`:
   ```bash
   alias ll='ls -lah'
   alias df='df -h'
   alias free='free -h'
   ```
5. **Use `man` pages** - `man command` for detailed documentation
6. **Use `tldr`** - Install tldr for simplified man pages
7. **Pipe commands** - Combine commands: `ps aux | grep python | grep -v grep`
8. **Redirect output** - `command > file.txt` (overwrite) or `>>` (append)
9. **Background jobs** - Add `&` to run in background
10. **Screen/tmux** - Use for persistent sessions

---

**See also:**
- [Docker Cheat Sheet](./docker-cheat-sheet.md)
- [Kubernetes Cheat Sheet](./kubernetes-cheat-sheet.md)
- [Git Cheat Sheet](./git-cheat-sheet.md)
