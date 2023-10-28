
#!/bin/bash

# Set the threshold values for the CPU usage, memory usage, and disk space usage.
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_SPACE_THRESHOLD=90

# Get the current CPU usage.
CPU_USAGE=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2}')

# Get the current memory usage.
MEMORY_USAGE=$(free -m | grep "Mem:" | awk '{print $3}')

# Get the current disk space usage.
DISK_SPACE_USAGE=$(df -h | grep "/" | awk '{print $5}')

# Check if the CPU usage is above the threshold.
if [[ $CPU_USAGE -ge $CPU_THRESHOLD ]]; then
    echo "CPU usage is above the threshold: $CPU_USAGE%"
    # Send an alert
fi

# Check if the memory usage is above the threshold.
if [[ $MEMORY_USAGE -ge $MEMORY_THRESHOLD ]]; then
    echo "Memory usage is above the threshold: $MEMORY_USAGE MB"
    # Send an alert
fi

# Check if the disk space usage is above the threshold.
if [[ $DISK_SPACE_USAGE -ge $DISK_SPACE_THRESHOLD ]]; then
    echo "Disk space usage is above the threshold: $DISK_SPACE_USAGE%"
    # Send an alert
fi


#bash monitor_system_performance.sh to run or ./monitor_system_performance.sh to run

#EOF To schedule the script to run every 30 minutes using cron, you can add the following line to your crontab file:

*/30 * * * * /path/to/monitor_system_performance.sh

#This will tell cron to run the script at the 0th, 30th, 60th, and 90th minute of every hour.
#To edit your crontab file, you can use the following command:

crontab -e

