#!/bin/bash

. data_output.sh

reg="^[1-6]$"
if [ $# -ne 4 ]
then
 echo "There should be 4 parameters."
else
    if ! [[ $1 =~ $reg && $2 =~ $reg && $3 =~ $reg && $4 =~ $reg ]]
    then 
        echo "The parameters must contain numbers from 1 to 6."
    else
        if [ $1 -eq $2 ] || [ $3 -eq $4 ]
        then 
            echo "The font and background colors of the same column must not match. Please try again."
        else
            output $1-1 $2-1 $3-1 $4-1
        fi
    fi
fi