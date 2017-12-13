#!/bin/bash
OUTFILENAME="./NODANN_me1B7_${DAT}.txt"
NGPU=1
#show what we will do...
cat << EOF
sbatch --gres=gpu:${NGPU} slurm_singularity_caffe_nodann.sh
EOF

# do the thing, etc.
sbatch --gres=gpu:${NGPU} slurm_singularity_caffe_nodann.sh -o $OUTFILENAME
