#!/bin/bash

# filepath: /home/derrick/linux-assignment/user_management.sh

# Check if the CSV file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <users.csv>"
    exit 1
fi

CSV_FILE=$1

# Check if the file exists
if [ ! -f "$CSV_FILE" ]; then
    echo "Error: File '$CSV_FILE' not found!"
    exit 1
fi

# Log file for created users
LOG_FILE="/var/log/user_management.log"
mkdir -p "$(dirname "$LOG_FILE")"
touch "$LOG_FILE"

# Process each line in the CSV file
while IFS=',' read -r username group; do
    # Skip empty lines or lines starting with a comment
    if [[ -z "$username" || -z "$group" || "$username" == "#"* ]]; then
        continue
    fi

    echo "Processing user: $username, group: $group"

    # Check if the group exists, if not, create it
    if ! getent group "$group" > /dev/null; then
        echo "Creating group: $group"
        groupadd "$group"
    fi

    # Check if the user exists, if not, create it
    if ! id "$username" > /dev/null 2>&1; then
        echo "Creating user: $username"
        useradd -m -g "$group" -s /bin/bash "$username"

        # Set a random password for the user
        PASSWORD=$(openssl rand -base64 12)
        echo "$username:$PASSWORD" | chpasswd

        # Set password expiration date (30 days from today)
        chage -E $(date -d "+30 days" +%Y-%m-%d) "$username"

        # Log the created user with a timestamp
        echo "$(date): Created user $username with group $group" >> "$LOG_FILE"

        # Bonus: Create a welcome email in the user's home directory
        WELCOME_FILE="/home/$username/welcome.txt"
        echo "Welcome, $username!" > "$WELCOME_FILE"
        echo "Your account has been created successfully." >> "$WELCOME_FILE"
        echo "Your temporary password is: $PASSWORD" >> "$WELCOME_FILE"
        echo "Please change your password upon first login." >> "$WELCOME_FILE"
        chown "$username:$group" "$WELCOME_FILE"
    else
        echo "User $username already exists. Skipping."
    fi

done < "$CSV_FILE"

echo "User management script completed. Log file: $LOG_FILE"