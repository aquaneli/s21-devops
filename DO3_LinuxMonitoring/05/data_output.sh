#!/bin/bash

function output() {
    start=$(date +%s.%N)
    total_folders=$(sudo find $1 -mindepth 1 -type d | wc -l)
    top_folders=$(sudo du -h $1 | sort -hr | grep -v $1$  | head -n 5 | cat -n | awk '{printf("%d - %s/, %s\n", $1, $3, $2)}' )
    total_files=$(sudo find $1 -type f | wc -l)
    configuration_files=$(sudo find $1 -type f -name "*.conf" | wc -l )
    text_files=$(sudo find $1 -type f -name "*.txt" | wc -l )
    executable_files=$(sudo find $1 -type f -executable | wc -l )
    log_files=$(sudo find $1 -type f -name "*.log" | wc -l )
    archive_files=$(sudo find $1 -type f -name "*.gz" -o -name "*.zip" -o -name "*.rar" -o -name "*.tar" -o -name "*.bz2"| wc -l)
    symbolic_links=$(sudo find $1 -type l | wc -l)
    top_files=$(sudo find $1 -type f -exec du -h {} ';' | sort -hr | head -n 10 | cat -n | awk '{filename=$3 ; printf ("%d - %s, %s, %s\n", $1, $3, $2, $gsub(/.*\./, "", $filename)) }')
    top_executable=$(sudo find $1 -type f -executable -exec du -h {} ';' | sort -hr | head -n 10 | cat -n | awk '{ "md5sum $3" | getline md; close("md5sum"); split(md, res, " "); printf "%d - %s, %s, %s\n", $1, $3, $2, res[1]}')
    finish=$(date +%s.%N)
    result=$(echo "$finish - $start" | bc)

    echo "Total number of folders (including all nested ones) = $total_folders"
    echo -e "TOP 5 folders of maximum size arranged in descending order (path and size):\n$top_folders"
    echo "Total number of files = $total_files"
    echo "Number of:"
    echo "Configuration files (with the .conf extension) = $configuration_files"
    echo "Text files = $text_files"
    echo "Executable files = $executable_files"
    echo "Log files (with the extension .log) = $log_files"
    echo "Archive files = $archive_files"
    echo "Symbolic links = $symbolic_links"
    echo -e "TOP 10 files of maximum size arranged in descending order (path, size and type):\n$top_files"
    echo -e "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):\n$top_executable"
    echo "Script execution time (in seconds) = $(printf "%.1f" $result)"
}
