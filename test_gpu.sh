#!/bin/bash
gpu_num=8
per_gpu_num=4

rm test*.log
for ((i=0; i<gpu_num; i ++))
do
    j=0
    for ((j=0; j<per_gpu_num; j ++))
    do
        echo "test gpu $i , process $j" 
        bash -c "export CUDA_VISIBLE_DEVICES=$i; nohup ./darknet detector batchTest cfg/coco.data cfg/yolov3.cfg yolov3.weights /path/of/images/ -thresh 0.25 > test$i-$j.log 2>&1 &";
    done
done
