#!/bin/bash

cpu=$(sudo top -b -n1 | awk '/^%Cpu/ {print $2 + $4"%"}')
mem=$(sudo free | awk '/Mem:/ {print ($3/$2) * 100 "%"}')
disk_usage=$(df -Th --exclude-type=tmpfs --exclude-type=devtmpfs | grep dm-0 | awk 'FNR != 2 {print $4}')
top_5_cpu=$(sudo ps -eo pid,pcpu,comm --sort=-%cpu | grep -Ev "ps|grep" | head -n6)
top_5_mem=$(ps -eo pid,%mem,comm --sort=-%mem | grep -Ev "ps|grep" | head -n6)

# Output all results
echo "Total CPU Usage: $cpu"
echo "Memory Usage: $mem"
echo "Disk Usage: $disk_usage"
echo "Top 5 Processes by CPU Usage:"
echo "$top_5_cpu"
echo "Top 5 Processes by Memory Usage:"
echo "$top_5_mem"
