#!/bin/bash

# Check if the IP address is provided as a parameter
if [ -z "$1" ]; then
    echo "Error: No IP address provided."
    echo "Usage: $0 <IP_Address>"
    exit 1
fi
ip=$1

# Initialize variables
count=0
maxCount=2

# Ping the IP address until it is reachable or max attempts are reached
while [ $count -lt $maxCount ]; do
    if ping -c 1 $ip &> /dev/null; then
        echo "$ip is reachable."
        break
    else
        echo "$ip is unreachable. Retrying..."
        sleep 1  # Waits for 1 second before retrying
        count=$((count + 1))  # Increment the count
    fi
done

if [ $count -ge $maxCount ]; then
    exit 1
fi

echo "Script completed."
