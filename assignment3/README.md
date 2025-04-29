# User Management Script

## Overview

This project contains a Bash script (`user_management.sh`) that automates user and group management on a Linux system. It reads a CSV file containing usernames and groups, creates users and groups if they don't exist, sets random passwords, and performs additional tasks like logging and creating welcome messages.

## Features

- Reads a CSV file with `username,group` format.
- Adds users and groups if they don't already exist.
- Sets a random password for each user.
- Logs all created users with timestamps in `/var/log/user_management.log`.
- Sets a password expiration date 30 days from the creation date.
- **Bonus:** Creates a `welcome.txt` file in each user's home directory with a welcome message and their temporary password.

## Requirements

- Linux operating system
- Bash shell
- `sudo` privileges (required for user and group management)

## Usage

1. Save the script as `user_management.sh` in the `assignment3` directory.
2. Make the script executable:
   ```bash
   chmod +x /user_management.sh
   ```
   To run user-management.sh script provide the path to the users.csv file as an argument. run as sudo
