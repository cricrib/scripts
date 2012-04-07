#!/bin/bash
max=0
while read LINE
do
  if [ $(echo $LINE| cut -d ':' -f3) -gt $max ]
    then
      max=$(echo $LINE| cut -d ':' -f3)
  fi 
done < /etc/passwd
echo "max UID: " $max

