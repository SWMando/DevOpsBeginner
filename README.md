# DevOpsBeginner

My sort of portfolio. 
All project ideas are from here: 'https://roadmap.sh/devops/projects'

### 1. Bash script 'server-stats.sh'.

Script which shows to the admin:
- CPU usage in percent
- Memory usage in percent
- Disk usage in GB
- Top 5 process by CPU Usage
- Top 5 process by Memory Usage

In order to get dynamic output, use `watch -n1 "bash server-stats.sh"`. This uses `watch` command and `-n1` option which sets the update interval to 1s. In other words, script will be running every second and the output will be updated.

### 2. Bash script 'log-archive.sh'.

Script which allows admin to:
- Archive selected log file
- Saves all archived `tar.gz` files in its own directory `/var/log/logs_archived`

Because the directory is in `/var/log/logs_archived` you might need elevated priviliges to run the script.

### 3. Bash script 'log-analyzer.sh'.

Script which shows the statistics based on the logs of the Nginx server. Here are the stats that are being shown:
1. Top 5 IP addresses with the most requests
2. Top 5 most requested paths
3. Top 5 response status codes
4. Top 5 user agents
