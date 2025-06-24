# System Information Dashboard Script

## Overview

This project contains a Bash script (`sysinfo.sh`) that generates a system information dashboard. The script collects and logs essential system health information in a readable format.

## Features

- Displays the following system information:
  - Hostname
  - Uptime
  - Current user
  - Top 5 processes by CPU and memory usage
  - Total disk usage and free space per partition
  - System IP address
- Logs the output to a dated file in `/var/log/sysdash/`.

## Requirements

- Linux operating system
- Bash shell
- Sudo privileges (to write logs to `/var/log/sysdash/`)

## Usage

1. Clone the repository or copy the script to your desired location.
   - If using Git:
   ```bash
   git clone <repository-url>
   cd linux-assignment/assignment1
   ```

- Or Manually download/Copy `sysinfo.sh` to your preferred directory.

2. Make the script executable:

```bash
chmod +x system.sh
```

3. Run the script with sudo to ensure it can write logs to `/var/log/sysdash/`:

```bash
sudo ./sysinfo.sh
```

4. View the output:

- The script will display system information in your terminal.
- It will save the output to log file name `sysdash_YYYY-MM-DD.log` in `/var/log/sysdash/`.

5. Check the log files:

- To view the latest log, run:

```bash
sudo cat /var/log/sysdash/sysdash_$(date +'%Y-%m-%d').log
```

- Or browse to `/var/log/sysdash/` using your file manager to open the logs.
