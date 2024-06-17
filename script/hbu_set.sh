# !/bin/bash

# git
# git config --global user.email "wanlei.cn@outlook.com"
# git config --global user.name "wanleimk"

##################### train env ##################### 
# pip install cupy-cuda113 -i https://pypi.tuna.tsinghua.edu.cn/simple
# pip install scipy -i https://pypi.tuna.tsinghua.edu.cn/simple
# pip install timm -i https://pypi.tuna.tsinghua.edu.cn/simple
# python -m pip install -e detectron2 -i https://pypi.tuna.tsinghua.edu.cn/simple

if [ -d "../datasets/crowdhuman" ]; then
    echo "crowdhuman exist..."
    ln -s /mnt/Data/datasets/detection/coco_format_datasets/crowdhuman/annotations ../datasets/crowdhuman/annotations
    ln -s /mnt/Data/datasets/detection/coco_format_datasets/crowdhuman/crowdhuman_train/Images ../datasets/crowdhuman/CrowdHuman_train
    ln -s /mnt/Data/datasets/detection/coco_format_datasets/crowdhuman/crowdhuman_val/Images ../datasets/crowdhuman/CrowdHuman_val
else
    echo "crowdhuman exist..."
    mkdir -p ../datasets/crowdhuman
    ln -s /mnt/Data/datasets/detection/coco_format_datasets/crowdhuman/annotations ../datasets/crowdhuman/annotations
    ln -s /mnt/Data/datasets/detection/coco_format_datasets/crowdhuman/crowdhuman_train/Images ../datasets/crowdhuman/CrowdHuman_train
    ln -s /mnt/Data/datasets/detection/coco_format_datasets/crowdhuman/crowdhuman_val/Images ../datasets/crowdhuman/CrowdHuman_val
fi



