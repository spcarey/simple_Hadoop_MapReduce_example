#!/bin/bash


hadoop fs -rm -r /enron/output

hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
    -files mapper.py,reducer.py \
    -mapper mapper.py \
    -reducer reducer.py \
    -input gs://enron-msds610-carey/enron_mail_20150507.tar.gz \
    -output /enron/output

 

hadoop fs -getmerge /enron/output/ /home/sean_carey/result


sort -gr -k 2 /home/sean_carey/result | head 
