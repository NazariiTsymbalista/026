#!/bin/bash

#Use the following file: http://yoko.ukrtux.com/versions.txt. Write a bash script 'count_lines.sh' to find which line of this file 
#is repeated the biggest number of times. Print this line and the number of its occurrences. Example of result: 30 terraform-14.29.71

curl -O http://yoko.ukrtux.com:8899/versions.txt 2> /dev/null
sort versions.txt | uniq -c | sort -nr | head -1



