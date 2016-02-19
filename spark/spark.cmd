#!/bin/bash
################################################################################
#  Designed to run on SDSC's Comet resource.
#  Mahidhar Tatineni, Andrea Zonca, San Diego Supercomputer Center Aug 2015
################################################################################
#SBATCH --job-name="spark-demo"
#SBATCH --output="spark-demo.%j.%N.out"
#SBATCH --partition=compute
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=24
#SBATCH --export=ALL
#SBATCH -t 04:00:00

module load python scipy

### Environment setup for Hadoop and Spark
module load spark/1.5.2
export PATH=/opt/hadoop/2.6.0/sbin:$PATH
export HADOOP_CONF_DIR=$HOME/mycluster.conf
export WORKDIR=`pwd`

myhadoop-configure.sh

### Start HDFS.  Starting YARN isn't necessary since Spark will be running in
### standalone mode on our cluster.
start-dfs.sh

### Load in the necessary Spark environment variables
source $HADOOP_CONF_DIR/spark/spark-env.sh

### Start the Spark masters and workers.  Do NOT use the start-all.sh provided 
### by Spark, as they do not correctly honor $SPARK_CONF_DIR
myspark start

python save_slurm_env.py

sleep 4h

# ### Shut down Spark and HDFS
# myspark stop
# stop-dfs.sh
# 
# ### Clean up
# myhadoop-cleanup.sh
