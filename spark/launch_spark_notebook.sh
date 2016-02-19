#!/bin/bash
echo "************************************************************************************"
echo "After IPython notebook stars up, connect with your laptop browser to `hostname`:8888"
echo "************************************************************************************"

PYSPARK_DRIVER_PYTHON=ipython PYSPARK_DRIVER_PYTHON_OPTS="notebook --no-browser --ip=*" pyspark
