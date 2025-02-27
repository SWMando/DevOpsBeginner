# DevOpsBeginner
My sort of portfolio

1. Bash script 'server-stats.sh'.
Script which shows to the admin:
- CPU usage in percent
- Memory usage in percent
- Disk usage in GB
- Top 5 process by CPU Usage
- Top 5 process by Memory Usage
In order to get dynamic output, use `watch -n1 "bash server-stats.sh"`. This uses `watch` command and `-n1` option which sets the update interval to 1s. In other words, script will be running every second and the output will be updated.
