#!/bin/bash
i=1
for file in `ls`
do
  result=`ls -t|grep -i "^$file$"`
  count=$(echo $result|wc -w)
  if [ $count -gt 1 ]
  then
    mostrecent=$(echo $result |awk '{print $1}')
    echo "$count occurences of file $file. The most recent is: $mostrecent"
  fi
done
