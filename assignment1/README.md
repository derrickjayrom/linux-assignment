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
2. Make the script executable:
   ```bash
   chmod +x sysinfo.sh
   ```
