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

1. Save the script as `arch_oldfiles.sh` in the `assignment5` directory.
2. Make the script executable:
   ```bash
   chmod +x ./arch_oldfiles.sh
   sudo ./arch_oldfiles.sh /path/to/target/directory
   ```
