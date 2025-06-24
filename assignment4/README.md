# Network Troubleshooter CLI Tool

## Overview

This project contains a Bash script (`net_diagnosis.sh`) that performs basic network diagnostics. It helps troubleshoot network issues by checking connectivity, resolving DNS, and testing specific ports. The results are logged for future reference.

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

1. **Save the script as `net_diagnosis.sh` in your desired directory.**

   - For example, you can place it in `assignment4` or any other folder you prefer.

2. **Make the script executable:**

   ```bash
   chmod +x /path/to/your/net_diagnosis.sh
   ```

   Replace `/path/to/your/` with the actual path where you saved the script.

3. **Ensure you have `nc` (Netcat) installed:**

   - On Ubuntu/Debian:
     ```bash
     sudo apt update
     sudo apt install netcat-openbsd
     ```
   - On CentOS/RHEL:
     ```bash
     sudo yum install nc
     ```

4. **Run the script with `sudo` to ensure it has the necessary permissions:**

   ```bash
   sudo /path/to/your/net_diagnosis.sh
   ```

   - The script will:
     - Ping your default gateway and google.com.
     - Show your current IP address and default route.
     - Resolve DNS for example.com.
     - Prompt you to enter an IP address to test port 22 (SSH) connectivity.
     - Log all results to `/var/log/netcheck.log`.

5. **To simulate emailing results to an admin, use the `--email` flag:**

   ```bash
   sudo /path/to/your/net_diagnosis.sh --email
   ```

   - This will save the log results to `~/mail.txt` in addition to `/var/log/netcheck.log`.

6. **View the logs:**

   - To view the main log file:
     ```bash
     sudo cat /var/log/netcheck.log
     ```
   - To view the simulated email:
     ```bash
     cat ~/mail.txt
     ```

7. **Troubleshooting:**
   - If you get a "command not found" error for `nc`, make sure Netcat is installed.
   - If you get permission errors writing to `/var/log/netcheck.log`, ensure you are running the script with `sudo`.
