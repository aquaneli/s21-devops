#!/bin/bash

. data_output.sh

if [ $# != 0 ]
then
 echo "The script works without parameters."
else
output
echo "Do you want to save the data [Y/N]."
read save
if [[ $save = 'Y' ||  $save = 'y' ]]
then 
   output > $(date "+%d_%m_%y_%H_%M_%S").status
fi
fi