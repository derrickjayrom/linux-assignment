#!/bin/bash

# filepath: /home/derrick/linux-assignment/net_diagnosis.sh

# lof file for network diagnosis
LOG_FILE="/var/log/net_diagnosis.log"
mkdir -p "$(dirname "$LOG_FILE")"
touch "$LOG_FILE"

# Function to log and print messages
log() {
    echo "$1" | tee -a "$LOG_FILE"
} 

# check if the script is run with superuser privileges
if [ "$EUID" -ne 0 ]; then
    log "Please run as root or use sudo."
    exit 1
fi

# Perform network diagnosis
log "Network Troubleshooter - $(date)"
log "----------------------------------------"

# Ping default gateway
DEFAULT_GATEWAY=$(ip route | grep default | awk '{print $3}')   
if [ -n "$DEFAULT_GATEWAY" ]; then
    log "Pinging default gateway: $DEFAULT_GATEWAY"
    ping -c 4 "$DEFAULT_GATEWAY" >> "$LOG_FILE" 2>&1 && log "Default gateway is reachable." ||
     log "Default gateway is not reachable."
else
    log "No default gateway found."
fi

# Ping google.com
log "Pinging google.com"
ping -c 4 google.com >> "$LOG_FILE" 2>&1 && log "google.com is reachable." ||
 log "google.com is not reachable."

 # Show current IP address and default route
log "Current IP address and default route:"
ip addr show | grep "inet" | awk '{print $2}' | tee -a "$LOG_FILE"
ip route | grep default | tee -a "$LOG_FILE"

# DNS resolution for example.com
log "DNS resolution for example.com"
nslookup example.com >> "$LOG_FILE" 2>&1 && log "DNS resolution for example.com is successful." ||
 log "DNS resolution for example.com failed."

# Test port 22 (SSH) to a given hostname or IP address
read -p "Enter the hostname or IP address to test SSH (port 22): " HOST
log "Testing port 22 (SSH) to $TEST_IP..."
nc -zv "$HOST" 22 >> "$LOG_FILE" 2>&1 && log "Port 22 is open." ||
 log "Port 22 is closed or unreachable on $TEST_IP."

 # Simulate emailing results
 if [["$1" == "--email" ]]; then
    EMAIL_FILE="&HOME/mail.txt"
    cp "$LOG_FILE" "$EMAIL_FILE"
    log "Results saved to $EMAIL_FILE (simulated email)."
fi

log "-----------------------------------------"
log "Network diagnosis completed."
log "Log file: $LOG_FILE"
# End of script
# chmod +x net_diagnosis.sh
# ./net_diagnosis.sh --email
#
# This script performs network diagnosis by checking the default gateway, pinging google.com,
# checking the current IP address and default route, performing DNS resolution for example.com,
# testing SSH connectivity to a specified host, and simulating emailing the results.
# It also logs all actions and results to a log file located at /var/log/net_diagnosis.log.
# The script requires superuser privileges to run and can be executed with the command:   