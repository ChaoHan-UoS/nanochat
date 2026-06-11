#!/bin/bash

# ============================================================
# HPC target: "stanage", "griffin" or "isambard"
# ============================================================
HPC="isambard"

PROJ_DIR="$(pwd)"  # project root dir

mkdir -p "${PROJ_DIR}/out"

case "$HPC" in
    stanage)
        SCRIPT="./hpc/stanage.sh"
        ;;
    griffin)
        SCRIPT="./hpc/griffin.sh"
        ;;
    isambard)
        SCRIPT="./hpc/isambard.sh"
        ;;
    *)
        echo "ERROR: Unknown HPC='$HPC'. Set to 'stanage', 'griffin' or 'isambard'."
        exit 1
        ;;
esac

echo "Submitting $SCRIPT to $HPC..."
sbatch --output="${PROJ_DIR}/out/output_%j.txt" \
       --export=PROJ_DIR="$PROJ_DIR" \
       "$SCRIPT"
