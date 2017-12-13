#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --nodelist=gpu2
#SBATCH --job-name=nodann_caffe
echo "started "`date`" "`date +%s`""

nvidia-smi -L

NGPU=1

# pick up singularity v2.2
export PATH=/usr/local/singularity/bin:$PATH
# which singularity image
SNGLRTY="/data/aghosh12/pycaffe.simg"
CAFFE="/opt/caffe/build/tools/caffe"
NETWORKDIR=/data/aghosh12/nodann

# show what we will do...
cat << EOF
singularity exec $SNGLRTY $CAFFE train \
  -solver $NETWORKDIR/NODANN.solver -snapshot /data/minerva/NODANN_me1B/_iter_666000.solverstate
EOF
# do the thing...
singularity exec $SNGLRTY $CAFFE train \
  -solver $NETWORKDIR/NODANN.solver -snapshot /data/minerva/NODANN_me1B/_iter_666000.solverstate

nvidia-smi

echo "finished "`date`" "`date +%s`""
exit 0
