#!/bin/bash

ft=(
    "\033[97m" #white
    "\033[31m" #red
    "\033[32m" #green
    "\033[34m" #blue
    "\033[35m" #purple
    "\033[30m" #black
)

bg=(
    "\033[107m" #white
    "\033[41m"  #red
    "\033[42m"  #green
    "\033[44m"  #blue
    "\033[45m"  #purple
    "\033[40m"  #black
)

function output() {
    reset="\033[0m"
    echo -e "${ft[$2]}${bg[$1]}HOSTNAME$reset = ${ft[$4]}${bg[$3]}$(hostname)$reset"
    echo -e "${ft[$2]}${bg[$1]}TIMEZONE$reset = ${ft[$4]}${bg[$3]}$(cat /etc/timezone) $(date -u +%Z) $(date +%Z)$reset"
    echo -e "${ft[$2]}${bg[$1]}USER$reset = ${ft[$4]}${bg[$3]}$(whoami)$reset"
    echo -e "${ft[$2]}${bg[$1]}OS$reset = ${ft[$4]}${bg[$3]}$(cat /etc/issue | awk '{printf("%s %s %s",$1,$2,$3)}')$reset"
    echo -e "${ft[$2]}${bg[$1]}DATE$reset = ${ft[$4]}${bg[$3]}$(date | awk '{print $3,$2,$6,$4}')$reset"
    echo -e "${ft[$2]}${bg[$1]}UPTIME$reset = ${ft[$4]}${bg[$3]}$(uptime -p)$reset"
    echo -e "${ft[$2]}${bg[$1]}UPTIME_SEC$reset = ${ft[$4]}${bg[$3]}$(awk '{print $1}' /proc/uptime)$reset"
    echo -e "${ft[$2]}${bg[$1]}IP$reset = ${ft[$4]}${bg[$3]}$(hostname -I)$reset"
    echo -e "${ft[$2]}${bg[$1]}MASK$reset = ${ft[$4]}${bg[$3]}$(ifconfig | grep $(hostname -I) | awk '{print $4}')$reset"
    echo -e "${ft[$2]}${bg[$1]}GATEWAY$reset = ${ft[$4]}${bg[$3]}$(ip route | grep default | awk '{print $3}')$reset"
    echo -e "${ft[$2]}${bg[$1]}RAM_TOTAL$reset = ${ft[$4]}${bg[$3]}$(free -m | grep Mem | awk '{printf("%.3f GB", $2/1024)}')$reset"
    echo -e "${ft[$2]}${bg[$1]}RAM_USED$reset = ${ft[$4]}${bg[$3]}$(free -m | grep Mem | awk '{printf("%.3f GB", $3/1024)}')$reset"
    echo -e "${ft[$2]}${bg[$1]}RAM_FREE$reset = ${ft[$4]}${bg[$3]}$(free -m | grep Mem | awk '{printf("%.3f GB", $4/1024)}')$reset"
    echo -e "${ft[$2]}${bg[$1]}SPACE_ROOT$reset = ${ft[$4]}${bg[$3]}$(df /root/ | awk 'NR == 2 {printf("%.2f MB", $2/1024)}')$reset"
    echo -e "${ft[$2]}${bg[$1]}SPACE_ROOT$reset = ${ft[$4]}${bg[$3]}$(df /root/ | awk 'NR == 2 {printf("%.2f MB", $3/1024)}')$reset"
    echo -e "${ft[$2]}${bg[$1]}SPACE_ROOT$reset = ${ft[$4]}${bg[$3]}$(df /root/ | awk 'NR == 2 {printf("%.2f MB", $4/1024)}')$reset"
}