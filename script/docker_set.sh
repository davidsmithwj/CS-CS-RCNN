# !/bin/bash

# git
git config --global user.email "wanlei.cn@outlook.com"
git config --global user.name "wanleimk"

##################### train env ##################### 
# pip install cupy-cuda113 -i https://pypi.tuna.tsinghua.edu.cn/simple
# pip install scipy -i https://pypi.tuna.tsinghua.edu.cn/simple
# pip install timm -i https://pypi.tuna.tsinghua.edu.cn/simple
# python -m pip install -e detectron2 -i https://pypi.tuna.tsinghua.edu.cn/simple


##################### datasets ##################### 

# 定义要检查的文件夹路径
dataset="/hy-tmp/crowdhuman.tar.gz"
dataset_dir="/datasets/crowdhuman"
target_dir="/hy-tmp/"
# 判断文件夹是否存在
if [ -e "$dataset" ]; then
    echo "crowdhuman exist"
    cd /hy-tmp
    tar -zvxf crowdhuman.tar.gz ./
    cd -
    if [ -d "$dataset_dir" ]; then
        ln -s /hy-tmp/crowdhuman/annotations ./datasets/crowdhuman/annotations
        ln -s /hy-tmp/crowdhuman/crowdhuman_train/Images ./datasets/crowdhuman/CrowdHuman_train
        ln -s /hy-tmp/crowdhuman/crowdhuman_val/Images ./datasets/crowdhuman/CrowdHuman_val
    else
        mkdir datasets/crowdhuman -p
        ln -s /hy-tmp/crowdhuman/annotations ./datasets/crowdhuman/annotations
        ln -s /hy-tmp/crowdhuman/crowdhuman_train/Images ./datasets/crowdhuman/CrowdHuman_train
        ln -s /hy-tmp/crowdhuman/crowdhuman_val/Images ./datasets/crowdhuman/CrowdHuman_val
    fi
else
    echo "crowdhuman is not exist, start download....."
    oss login
    oss cp oss://datasets/crowdhuman.tar.gz /hy-tmp/
fi