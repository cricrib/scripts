#!/bin/bash
#  n as the number of files
n=1
#loop to assign each file into the table table[0]=null voluntarily 
for file in `ls -l | grep ^- | awk '{print $9}'`
do
  table[$n]=$file
  ((n++))
done

#Print the most recent file
for i in `seq 1 $n`
do
  if [ ! -z ${table[i]} ] #avoid repetitions
  then
    youngest=${table[i]}
    count=1
    k=`echo "$i+1"|bc` #loop starts at $i+1
    value="${table[i]}"
    for j in `seq $k $n`
    do
      if [ ! -z ${table[j]} ] # will apply diff on tuples only (not '') see line 34
      then
        result=`ls -t ${table[i]} ${table[j]}|grep -i "^$value$"|wc -w `
        difference="$(diff -a ${table[i]} ${table[j]}|sed -n -e 1p)"
        #if [ $result -eq 2 ]
      if [ -n $difference ] && [ $result -eq 2 ]
        then
           inter="$(ls -t $youngest ${table[j]})"
           youngest=$(echo $inter |awk '{print $1}')
           table[j]=''
           ((count++))
        fi
      fi
    done
    if [ $count -gt 1 ]
    then
      echo "$count occurences of file ${table[i]}. The most recent is: $youngest"
    fi
  fi
done

