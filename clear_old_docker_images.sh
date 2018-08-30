#!/bin/bash

docker images  | grep "$1" | tr -s ' ' | while read line;
do
        month=$( echo "$line" | cut -d ' ' -f 4 )
        tag=$( echo "$line" | cut -d ' ' -f 2 )
        if [ $month  -gt 11 ] && [ "$tag" != "latest" ]
        then
                echo -e "deleteing $( echo ${line} | cut -d ' ' -f 1 )\t$( echo ${line} | cut -d ' ' -f 2 ) \t\t\t ${month} month(s) old"
                docker rmi $( echo "$line" | cut -d ' ' -f 3 )
        fi
done
