#!/bin/bash
#SBATCH --job-name=speedrun
#SBATCH --nodes=1
#SBATCH --gpus=4
#SBATCH --time=23:59:00

export PYTHONUNBUFFERED=1  # Unbuffer Python output
export WANDB_API_KEY=48436e46ea90de96edea92a6eea1c37e60083e4b

hostname  # Print compute node hostname
nvidia-smi --list-gpus
pwd

echo ""
echo "====== Running task ${SLURM_JOB_ID} ======"

echo ""
WANDB_RUN=speedrun bash runs/speedrun.sh
echo ""

echo "====== Task ${SLURM_JOB_ID} done ======"


