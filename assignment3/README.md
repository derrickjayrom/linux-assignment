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

1. **Save the script as `user_management.sh` in the desired directory**

2. **Prepare your `users.csv` file.**

   - The file should be in the format:
     ```
     username,group
     john,developers
     jane,admins
     ```
   - Place `users.csv` in the same directory as the script or note its full path.

3. **Make the script executable:**

   ```bash
   chmod +x ./usermanagement.md
   ```

4. **Run the script with `sudo` and provide the path to your `users.csv` file as an argument:**

   ```bash
   sudo /home/derrick/linux-assignment/assignment3/user_management.sh /home/derrick/linux-assignment/assignment3/users.csv
   ```

   - Replace the path to `users.csv` if your file is located elsewhere.

5. **What happens when you run the script:**

   - The script will read each line of the CSV file.
   - For each user:
     - It will create the group if it does not exist.
     - It will create the user if they do not exist, set a random password, and set a password expiration date 30 days from today.
     - It will log the creation in `/var/log/user_management.log`.
     - It will create a `welcome.txt` file in the user’s home directory with their temporary password.

6. **Check the logs and welcome files:**

   - View the log of created users:
     ```bash
     sudo cat /var/log/user_management.log
     ```
   - Check the `welcome.txt` file in each user’s home directory:
     ```bash
     sudo cat /home/username/welcome.txt
     ```
     Replace `username` with the actual username.

7. **Error handling:**

   - If a user or group already exists, the script will skip creation and notify you in the terminal.

8. **Clean up**
   - If you want to remove test users after running the script, use:
     ```bash
     sudo userdel -r username
     sudo groupdel groupname
     ```
