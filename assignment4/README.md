# Network Troubleshooter CLI Tool

## Overview

This project contains a Bash script (`netcheck.sh`) that performs basic network diagnostics. It helps troubleshoot network issues by checking connectivity, resolving DNS, and testing specific ports. The results are logged for future reference.

## Features

- **Ping Tests**:
  - Pings the default gateway.
  - Pings `google.com` to test external connectivity.
- **Network Information**:
  - Displays the current IP address.
  - Shows the default route.
- **DNS Resolution**:
  - Resolves the DNS for `example.com`.
- **Port Testing**:
  - Tests port 22 (SSH) connectivity to a user-specified IP address using `nc` (Netcat).
- **Logging**:
  - Logs all results to `/var/log/netcheck.log`.
- **Bonus**:
  - Simulates emailing results to an admin by saving them to `~/mail.txt` when the `--email` flag is used.

## Requirements

- Linux operating system
- Bash shell
- `sudo` privileges (required for network diagnostics and logging)
- `nc` (Netcat) installed for port testing

## Usage

1. Save the script as `netcheck.sh` in the `assignment4` directory.
2. Make the script executable:
   ```bash
   chmod +x /home/derrick/linux-assignment/assignment4/netcheck.sh
   ```
