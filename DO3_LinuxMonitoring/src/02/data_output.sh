#!/bin/bash

function output() {
    echo "HOSTNAME = $(hostname)"
    echo "TIMEZONE = $(cat /etc/timezone) $(date -u +%Z) $(date +%Z)"
    echo "USER = $(whoami)"
    echo "OS = $(cat /etc/issue | awk '{printf("%s %s %s",$1,$2,$3)}')"
    echo "DATE = $(date | awk '{print $3,$2,$6,$4}')"
    echo "UPTIME = $(uptime -p)"
    echo "UPTIME_SEC = $(awk '{print $1}' /proc/uptime)"
    echo "IP = $(hostname -I)"
    echo "MASK = $(ifconfig | grep $(hostname -I) | awk '{print $4}')"
    echo "GATEWAY = $(ip route | grep default | awk '{print $3}')"
    echo "RAM_TOTAL = $(free -m | grep Mem | awk '{printf("%.3f GB", $2/1024)}')"
    echo "RAM_USED = $(free -m | grep Mem | awk '{printf("%.3f GB", $3/1024)}')"
    echo "RAM_FREE = $(free -m | grep Mem | awk '{printf("%.3f GB", $4/1024)}')"
    echo "SPACE_ROOT = $(df /root/ | awk 'NR == 2 {printf("%.2f MB", $2/1024)}')"
    echo "SPACE_ROOT = $(df /root/ | awk 'NR == 2 {printf("%.2f MB", $3/1024)}')"
    echo "SPACE_ROOT = $(df /root/ | awk 'NR == 2 {printf("%.2f MB", $4/1024)}')"
}