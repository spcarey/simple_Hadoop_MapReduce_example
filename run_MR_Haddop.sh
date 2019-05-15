#!/bin/bash


hadoop fs -rm -r /warpeace/output

hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
    -files mapper.py,reducer.py \
    -mapper mapper.py \
    -reducer reducer.py \
    -input dataproc-34eba011-40cc-4cb9-b84c-941f772557bb-us-east1 \
    -output /warpeace/output

 

hadoop fs -getmerge /warpeace/output/ /home/sean_carey/result


sort -gr -k 2 /home/sean_carey/result | head 
