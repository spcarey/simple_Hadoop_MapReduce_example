#!/bin/bash

# This is for version DataProc 1.4

 #wget https://www.gutenberg.org/files/2600/2600-0.txt
#clone git hub repo
#git clone https://github.com/spcarey/simple_Hadoop_MapReduce_example.git

#install curl
sudo apt install curl

#downlaod text to Google Bucket
curl https://www.gutenberg.org/files/2600/2600-0.txt | gsutil cp - gs://dataproc-34eba011-40cc-4cb9-b84c-941f772557bb-us-east1/2600-0.txt

#set python to python3
#sudo ln -fs /usr/bin/python3 /usr/bin/python
#install spaCy
conda install -c conda-forge spacy
python -m spacy download en_core_web_sm --user


#Create Hadoop Diretories

hadoop fs -mkdir /warpeace
hadoop fs -mkdir /warpeace/input
#hadoop fs -copyFromLocal 2600-0.txt /warpeace/input
hadoop fs -ls /warpeace/input


