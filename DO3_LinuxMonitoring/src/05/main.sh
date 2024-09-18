#!/bin/bash

. data_output.sh

if [ $# -ne 1 ]
then 
  echo "the script runs with 1 parameter"
elif [ ${1: -1} != "/" ]
then
  echo "There is no such directory."
elif [ ! -d $1  ]
then
  echo "The parameter must end with a '/' sign and be a directory."
else
  output $1
fi