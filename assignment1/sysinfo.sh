#!/bin/bash

# filepath: /home/derrick/linux-assignment/sysdash.sh

# Create log directory if it doesn't exist
LOG_DIR="/var/log/sysdash"
mkdir -p "$LOG_DIR"

# Log file with current date
LOG_FILE="$LOG_DIR/sysdash_$(date +'%Y-%m-%d').log"

# Collect system information
HOSTNAME=$(hostname)
UPTIME=$(uptime -p)
CURRENT_USER=$(whoami)
IP_ADDRESS=$(hostname -I | awk '{print $1}')

# Top 5 processes by CPU and Memory usage
TOP_PROCESSES=$(ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6)

# Disk usage and free space
DISK_USAGE=$(df -h)

# Write output to log file
{
    echo "System Information Dashboard - $(date)"
    echo "---------------------------------------"
    echo "Hostname: $HOSTNAME"
    echo "Uptime: $UPTIME"
    echo "Current User: $CURRENT_USER"
    echo "IP Address: $IP_ADDRESS"
    echo
    echo "Top 5 Processes by CPU and Memory Usage:"
    echo "PID   COMMAND   %CPU   %MEM"
    echo "$TOP_PROCESSES"
    echo
    echo "Disk Usage and Free Space:"
    echo "$DISK_USAGE"
    echo "---------------------------------------"
} | tee "$LOG_FILE"

# Notify user
echo "System information logged to $LOG_FILE"