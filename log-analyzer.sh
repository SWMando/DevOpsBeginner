#!/bin/bash

##############################################################################
# This script is intented to show you the statistics of the nginx server. It #
# shows the following:                                                       #
#    1. Top 5 IP addresses with the most requests.                           #
#    2. Top 5 most requested paths.                                          #
#    3. Top 5 response status codes.                                         #
#    4. Top 5 user agents.                                                   #
# If you are trying to read directly from `/var/log`, then you might need    #
# elevated priviliges.                                                       #
##############################################################################

awk '/"GET/ {print $1}' "$1" | sort | uniq -c | sort -nr | head -5 | awk 'BEGIN {print "Top 5 IP addresses with the most requests:"};{print $2 " - " $1 " requests"}'
echo ""
awk '/"GET/ {print $7}' "$1" | sort | uniq -c | sort -nr | head -5 | awk 'BEGIN {print "Top 5 most requested paths:"};{print $2 " - " $1 " requests"}'
echo ""
awk '{print $9}' "$1" | sort | uniq -c | sort -nr | head -5 | awk 'BEGIN {print "Top 5 response status codes:"};{print $2 " - " $1 " requests"}'
echo ""
awk '{ for (i=12; i<=NF-1; i++) printf "%s ", $i; print "" }' "$1" | sort | uniq -c | sort -nr | head -5 | awk 'BEGIN {print "Top 5 user agents:"};{ for (i=2; i<=NF; i++) printf "%s ", $i; print "" "- " $1 " requests" }'

