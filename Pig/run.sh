#!/bin/bash

## En local ->
## pig -x local -

## en dataproc...


## create the cluster
## 1 noeud
gcloud dataproc clusters create cluster-a35a --enable-component-gateway --region europe-west1 --zone europe-west1-c 
--master-machine-type n1-standard-4 --master-boot-disk-size 500 --single-node --worker-machine-type n1-standard-4 
--worker-boot-disk-size 500 --image-version 2.0-debian10 --project pagerank-365611
## 2 noeuds
gcloud dataproc clusters create cluster-a35a --enable-component-gateway --region europe-west1 --zone europe-west1-c 
--master-machine-type n1-standard-4 --master-boot-disk-size 500 --num-workers 2 --worker-machine-type n1-standard-4 
--worker-boot-disk-size 500 --image-version 2.0-debian10 --project pagerank-365611
## 4 noeuds
gcloud dataproc clusters create cluster-a35a --enable-component-gateway --region europe-west1 --zone europe-west1-c 
--master-machine-type n1-standard-4 --master-boot-disk-size 500 --num-workers 4 --worker-machine-type n1-standard-4 
--worker-boot-disk-size 500 --image-version 2.0-debian10 --project pagerank-365611
## 5 noeuds
gcloud dataproc clusters create cluster-a35a --enable-component-gateway --region europe-west1 --zone europe-west1-c 
--master-machine-type n1-standard-4 --master-boot-disk-size 500 --num-workers 5 --worker-machine-type n1-standard-4 
--worker-boot-disk-size 500 --image-version 2.0-debian10 --project pagerank-365611


## Copy pig code
gsutil cp dataproc.py gs://haivin/

## Clean out directory
gsutil rm -rf gs://haivin/out

## run
## (suppose that out directory is empty !!)
gcloud dataproc jobs submit pig --region europe-west1 --cluster cluster-a35a -f gs://haivin/dataproc.py

## access results
gsutil cat gs://haivin/out/pagerank_data_10/part-r-00000

## delete cluster...
gcloud dataproc clusters delete cluster-a35a --region europe-west1



