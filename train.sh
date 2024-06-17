#!/bin/bash

# -------------------------------------------------------------------------------------------
## crowdhuman : sparsercnn
# python train.py --num-gpus 3 \
#                 --config-file configs/sparsercnn.crowdhuman.res50.500pro.68e.yaml \
#                 OUTPUT_DIR output/results2/crowdhuman/sparsercnn

## crowdhuman : sparsercnn + evc + sc
# python train.py --num-gpus 3 \
#                 --config-file configs/sparsercnn.crowdhuman.res50.500pro.68e.yaml \
#                 OUTPUT_DIR output/results2/crowdhuman/sparsercnn_evc_scx4_attn_sru_cru

# -------------------------------------------------------------------------------------------
## citypersons : sparsercnn
# python train.py --num-gpus 3 \
#                 --config-file configs/sparsercnn.cityperson.res50.500pro.68e.yaml \
#                 OUTPUT_DIR output/results2/citypersons/sparsercnn

# ## citypersons : sparsercnn + evc + sc
# python train_evc_sc.py --num-gpus 3 \
#                 --config-file configs/sparsercnn.cityperson.res50.500pro.68e.yaml \
#                 OUTPUT_DIR output/results2/citypersons/sparsercnn_evc_scx4_attn_sru_cru

# -------------------------------------------------------------------------------------------
# ## cocoperson : sparsercnn
# python train.py --num-gpus 3 \
#                 --config-file configs/sparsercnn.cocoperson.res50.500pro.68e.yaml \
#                 OUTPUT_DIR output/results2/cocoperson/sparsercnn

# ## cocoperson : sparsercnn + evc + sc
# python train_evc_sc.py --num-gpus 3 \
#                 --config-file configs/sparsercnn.cocoperson.res50.500pro.68e.yaml \
#                 OUTPUT_DIR output/results2/cocoperson/sparsercnn_evc_scx4_attn_sru_cru