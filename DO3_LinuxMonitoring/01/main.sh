#!/bin/bash

reg="^[+-]?[0-9]+([.][0-9]+)?$"

if [ -n $1 ] && [ $# -eq 1 ] && ! [[ $1 =~ $reg ]]
then
    echo $1
else
    echo "Incorrect input."
fi