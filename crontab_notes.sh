# 📅 Crontab Guide

This guide explains how to use **crontab** to schedule and automate tasks on Unix/Linux systems.

---

## 🔧 What is Crontab?

`crontab` (CRON Table) is a configuration file that tells the **cron daemon** when and how often to run commands or scripts automatically.

---

## 📘 Basic Syntax

Each line in a crontab file represents one scheduled task:

```
* * * * * command_to_execute
- - - - -
| | | | |
| | | | └── Day of the week (0 - 7) [0 or 7 = Sunday]
| | | └──── Month (1 - 12)
| | └────── Day of the month (1 - 31)
| └──────── Hour (0 - 23)
└────────── Minute (0 - 59)
```

Example:
```bash
30 2 * * * /home/user/backup.sh
```
→ Runs `/home/user/backup.sh` every day at **2:30 AM**.

---

## 📋 Common Commands

| Command | Description |
|----------|--------------|
| `crontab -e` | Edit the current user’s crontab file |
| `crontab -l` | List current cron jobs |
| `crontab -r` | Remove all cron jobs for the user |
| `sudo crontab -e -u username` | Edit another user’s cron jobs |

---

## 🧠 Examples

### 1. Run a script every day at midnight
```bash
0 0 * * * /path/to/script.sh
```

### 2. Run every 5 minutes
```bash
*/5 * * * * /path/to/script.sh
```

### 3. Run every Monday at 6 PM
```bash
0 18 * * 1 /path/to/script.sh
```

### 4. Log output to a file
```bash
0 3 * * * /path/to/backup.sh >> /var/log/backup.log 2>&1
```

---

## 🧩 Special Strings

| Keyword | Equivalent To | Description |
|----------|----------------|-------------|
| `@reboot` | – | Run once at system startup |
| `@yearly` | `0 0 1 1 *` | Once a year |
| `@monthly` | `0 0 1 * *` | Once a month |
| `@weekly` | `0 0 * * 0` | Once a week |
| `@daily` | `0 0 * * *` | Once a day |
| `@hourly` | `0 * * * *` | Once an hour |

Example:
```bash
@reboot /path/to/startup_script.sh
```

---

## 🧹 Best Practices

1. Always use **absolute paths** (e.g. `/usr/bin/python3`).
2. Redirect output to logs for debugging.
3. Use `crontab -l` to confirm changes.
4. Test your commands manually before scheduling.
5. Set environment variables at the top if needed:
   ```bash
   PATH=/usr/local/bin:/usr/bin:/bin
   ```

---

## 🧾 Check Cron Logs

Depending on your system:
```bash
cat /var/log/cron
# or
journalctl -u cron
# or
grep CRON /var/log/syslog
```

---

## 🧰 Example: Automate Python Script

```bash
# Edit crontab
crontab -e

# Add line
0 9 * * 1 /usr/bin/python3 /home/user/scripts/report.py >> /home/user/logs/report.log 2>&1
```
→ Runs every **Monday at 9 AM** and logs output.

---

## ✅ Verify

```bash
crontab -l
```

Output:
```
0 9 * * 1 /usr/bin/python3 /home/user/scripts/report.py >> /home/user/logs/report.log 2>&1
```

---

## 🧩 Related Files

| File | Description |
|------|--------------|
| `/etc/crontab` | System-wide cron file |
| `/etc/cron.hourly/` | Scripts run hourly |
| `/etc/cron.daily/` | Scripts run daily |
| `/etc/cron.weekly/` | Scripts run weekly |
| `/etc/cron.monthly/` | Scripts run monthly |

---

### 📚 References
- `man 5 crontab`
- `man cron`
- [Crontab Guru](https://crontab.guru) — online cron expression editor

---
