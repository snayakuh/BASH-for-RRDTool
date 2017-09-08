#!/bin/bash
counter=1
while true
do
 sh SNMPscript.sh
 y=$(( $counter  % 6 ))
 if [ $y  == 0 ]
 then
 echo "................................................................calling graph............................................................."
 sh Call_Graph.sh
 fi
 counter=`expr $counter + 1`
 echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SLEEPING FOR 10 SEC !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" 
 sleep 10
done
