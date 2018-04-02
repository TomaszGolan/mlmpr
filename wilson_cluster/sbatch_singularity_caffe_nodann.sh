#!/bin/bash
DAT=`date +%s`
OUTFILENAME="./NODANN_me1B7_${DAT}.txt"
NGPU=1
#show what we will do...
cat << EOF
sbatch --gres=gpu:${NGPU} -o $OUTFILENAME slurm_singularity_caffe_nodann.sh
EOF

# do the thing, etc.
sbatch --gres=gpu:${NGPU} -p gpu-o $OUTFILENAME slurm_singularity_caffe_nodann.sh 
