#!/bin/bash
process_num=`ls -atl |grep "test.*.log" | wc -l`
sum=`grep Predicted test*.log | awk '{sum+=$4} END {printf ("%d\n",sum)}'`
num=`grep Predicted test*.log | awk '{print $4}' | wc -l`
avg=$(echo "scale=2;1.0*$sum/$num"|bc)
echo "process num: $process_num"
echo "all time: $sum ms"
echo "process image num: $num"
echo "avg predicted time: $avg ms"
echo "process $(echo "scale=2;1000/$avg*$process_num"|bc) images per second"