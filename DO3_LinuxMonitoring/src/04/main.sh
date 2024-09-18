#!/bin/bash

. data_output.sh

flag=0
reg="^[1-6]$"

if [ $# -gt 0 ]
    then
        echo "The script runs without parameters."
        flag=2
elif [[ -z ${dc[0]} || -z ${dc[1]} || -z ${dc[2]} || -z ${dc[3]} ]]
    then
        default_values
        flag=1
elif ! [[ ${dc[0]} =~ $reg && ${dc[1]} =~ $reg && ${dc[2]} =~ $reg && ${dc[3]} =~ $reg ]]
    then 
        echo "The parameters must contain numbers from 1 to 6."
        flag=2
elif [ ${dc[0]} -eq ${dc[1]} ] || [ ${dc[2]} -eq ${dc[3]} ]
    then 
        echo "The font and background colors of the same column must not match. Please try again."
        flag=2
fi

if [ $flag -ne 2 ]
then
    output ${dc[0]}-1 ${dc[1]}-1 ${dc[2]}-1 ${dc[3]}-1
    output_column
fi