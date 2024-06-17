#!/bin/bash

NUM_GPU=1
CONFIG_FILE=configs/sparsercnn.crowdhuman.res50.500pro.68e.yaml

# OUT_DIR=output/test
TRAIN_DIR=/hy-tmp/sparsercnn_evc_sam_out

PTH_DIR=/hy-tmp/sparsercnn_evc_sam_out.0

EVAL_DIR=output/eval_out

PTH_FILE="model_0*.pth"
PTH_LIST=$(find "$PTH_DIR" -type f -name "*$PTH_FILE")

COCO_FILE=$EVAL_DIR/inference/coco_instances_results.json

if [ $1 == '-t' ]
then
   echo "------------doing train------------"
   echo python train.py --num-gpus $NUM_GPU --config-file $CONFIG_FILE OUTPUT_DIR $TRAIN_DIR
   python train.py --num-gpus $NUM_GPU --config-file $CONFIG_FILE OUTPUT_DIR $TRAIN_DIR # doing eval
elif [ $1 == "-e" ]
then
   echo "------------doing eval------------"
   for num in {1..17};do
      weight=$(echo "$PTH_LIST" | awk NR==$num)
      comand="train.py --num-gpus $NUM_GPU --config-file $CONFIG_FILE --eval-only MODEL.WEIGHTS $weight OUTPUT_DIR $EVAL_DIR"
      if [ -e "$weight" ]; then
         echo "[ID:$num] Start..." | tee -a eval.log
         echo "python $comand" | tee -a eval.log
         python $comand | tee -a eval.log          # doing eval
         echo "[ID:$num] End  ..." | tee -a eval.log
         mv $COCO_FILE coco_instances_results_$num.json
      else
         echo "weight file does not exist." | tee -a eval.log
      fi
   done
elif [ $1 == "-c" ]
then
   find . | grep -E "(__pycache__|\.pyc|\.pyo)$" | xargs rm -rf
else
   echo "------------doing nothing------------"
fi

# demo :
# 	@-python demo.py --config-file ${CONFIG_FILE} --input ./testimg/2.jpg --output ./testimg/output \
# 	--confidence-threshold 0.4 --opts MODEL.WEIGHTS ${OUT_DIR}/${WEIGHT}



