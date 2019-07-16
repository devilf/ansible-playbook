#!/bin/bash

pro=`ps auxf | grep "filebeat" | grep -v grep | wc -l`

count=1
while [ $count -le 10 ]
do
if [ "$pro" -ne 0 ];then
    ps auxf | grep "filebeat" | grep -v grep | awk '{print $2}' | xargs kill -9
    if [ `ps auxf | grep "filebeat" | grep -v grep| wc -l` -eq 0 ];then
            echo "filebeat is killed"
            break
    else
            echo "kill filebeat fail"
            let "count++"
    fi
else
    echo "filebeat is not exists."
    break
fi
done
