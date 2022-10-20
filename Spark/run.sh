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


## Copy spark code
gsutil cp pagerank_spark.py gs://haivin/

## Clean out directory
gsutil rm -rf gs://haivin/out

## run
## (suppose that out directory is empty !!)
gcloud dataproc jobs submit pyspark --region europe-west1 --cluster cluster-a35a  gs://haivin/pagerank_spark.py -- gs://public_lddm_data/page_links_en.nt.bz2 3 

## delete cluster...
gcloud dataproc clusters delete cluster-a35a --region europe-west1



