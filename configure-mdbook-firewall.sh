#!/bin/bash

# Script to configure UFW firewall rules for mdBook server
# This creates a secure configuration for port 3000 that is only accessible from LAN

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
   echo "This script must be run as root" 
   exit 1
fi

echo "Configuring secure firewall rules for mdBook server..."

# Delete any existing rules for port 3000 (except forwarding rules)
for RULE_NUM in $(ufw status numbered | grep "3000.*IN" | awk '{print $1}' | tr -d '[]'); do
    echo "y" | ufw delete $RULE_NUM
done

# Add specific allow rule for LAN
ufw allow from 192.168.1.0/24 to any port 3000 proto tcp

# Explicitly deny access to port 3000 from anywhere else (IPv4)
ufw deny from 0.0.0.0/0 to any port 3000 proto tcp

# Explicitly deny access to port 3000 from IPv6
ufw deny from ::/0 to any port 3000 proto tcp

# Verify the rules were added correctly
echo "Firewall rules configured. Current status for port 3000:"
ufw status | grep 3000

echo "Firewall rules for mdBook server configured successfully!"
echo "Port 3000 is now ONLY accessible from 192.168.1.0/24 (your LAN)"
echo "All other access to port 3000 is blocked"

