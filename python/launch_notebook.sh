#!/bin/bash
echo "************************************************************************************"
echo "After IPython notebook starts up, connect with your laptop browser to `hostname`:8888"
echo "************************************************************************************"

module load python scipy
ipython notebook --no-browser --ip=*
