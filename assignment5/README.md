# Find & Archive Old Files Utility

## Overview

This project contains a Bash script (`arch_oldfiles.sh`) that automates the process of finding and archiving files older than 30 days in a specified directory. It also skips files larger than 1GB and logs them separately.

## Features

- **Search for Old Files**:
  - Finds files older than 30 days in the specified directory.
- **Archive Files**:
  - Moves old files to an `archive` folder within the target directory.
  - Compresses the files using `gzip`.
- **Skip Large Files**:
  - Skips files larger than 1GB and logs them separately.
- **Logging**:
  - Logs archived files to `/var/log/archive_old_files.log`.
  - Logs skipped files (over 1GB) to `/var/log/skipped_files.log`.

## Requirements

- Linux operating system
- Bash shell
- `sudo` privileges (required for file operations and logging)

## Usage

1. **Save the script as `arch_oldfiles.sh` in your desired directory.**

   - For example, place it in `assignment5` or any folder you prefer.

2. **Make the script executable:**

   ```bash
   chmod +x /path/to/your/arch_oldfiles.sh
   ```

   Replace `/path/to/your/` with the actual path where you saved the script.

3. **Choose the target directory you want to scan for old files.**

   - This is the directory where the script will search for files older than 30 days.

4. **Run the script with `sudo` and provide the target directory as an argument:**

   ```bash
   sudo /path/to/your/arch_oldfiles.sh /path/to/target/directory
   ```

   - Example:
     ```bash
     sudo ./arch_oldfiles.sh /home/derrick/Documents
     ```

5. **What the script does:**

   - Finds files older than 30 days in the specified directory (excluding the `archive` folder).
   - Moves and compresses files under 1GB to an `archive` folder inside the target directory.
   - Logs archived files to `/var/log/archive_old_files.log`.
   - Skips files over 1GB and logs them to `/var/log/skipped_files.log`.

6. **View the logs:**

   - To see which files were archived:
     ```bash
     sudo cat /var/log/archive_old_files.log
     ```
   - To see which files were skipped (over 1GB):
     ```bash
     sudo cat /var/log/skipped_files.log
     ```

7. **Troubleshooting:**

   - If you get permission errors, make sure you are running the script with `sudo`.
   - Ensure the target directory exists and you have the necessary permissions to read and move files within it.

8. **(Optional) Automate the script:**
   - You can schedule the script to run regularly using `cron` for ongoing file management.
   - Example to run weekly:
     ```bash
     sudo crontab -e
     ```
     Add a line like:
     ```
     0 2 * * 0 /path/to/your/arch_oldfiles.sh /path/to/target/directory
     ```
     (This runs the script every Sunday at 2:00 AM.)
