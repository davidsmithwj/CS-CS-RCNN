# README

### 1. Download
```bash
git clone git@gitee.com:wanleimk/sparse_rcnn_exp.git
```
### 2. Setup Detectron2
```bash
pip install cupy-cuda113
cd sparse_rcnn_exp
python -m pip install -e detectron2
```
### 3. Prepare Datasets
```bash
# 设置环境变量
export COCODataset = "/mnt/Data/datasets/detection/coco_format_datasets"

ln -s [dataset path] [project datasets path]
```
#### 3.1 CrowdHuman
```bash
mkdir -p datasets/crowdhuman
# 在 project 目录下
ln -s ${COCODataset}/crowdhuman/annotations ./datasets/crowdhuman/annotations
ln -s ${COCODataset}/crowdhuman/crowdHuman_train/Images ./datasets/crowdhuman/CrowdHuman_train
ln -s ${COCODataset}/crowdhuman/crowdHuman_val/Images ./datasets/crowdhuman/CrowdHuman_val
```
#### 3.2 CityPerson
```bash
mkdir -p datasets/cityperson
# 在 project 目录下
ln -s ${COCODataset}/cityperson/annotations ./datasets/cityperson/annotations
ln -s ${COCODataset}/cityperson/cityperson_train ./datasets/cityperson/cityperson_train
ln -s ${COCODataset}/cityperson/cityperson_val ./datasets/cityperson/cityperson_val
```

#### 3.3 COCOPerson
```bash
mkdir -p datasets/cocoperson
# 在 project 目录下
ln -s ${COCODataset}/cocoperson/annotations ./datasets/cocoperson/annotations
ln -s ${COCODataset}/cocoperson/cocoperson_train ./datasets/cocoperson/cocoperson_train
ln -s ${COCODataset}/cocoperson/cocoperson_val ./datasets/cocoperson/cocoperson_val
```
### 4. Train
1. 修改 train.py中的EXP变量
2. 运行脚本

    ```bash
    python train.py --num-gpus 3 --config-file configs/sparsercnn.crowdhuman.res50.500pro.68e.yaml OUTPUT_DIR output/train_test
    ```

### 5. Test

```bash
python train.py --num-gpus 3 --config-file configs/sparsercnn.crowdhuman.res50.500pro.50e.yaml --eval-only MODEL.WEIGHTS output/train_test/model.pth
```

### 6. Eval

```bash
python train.py --num-gpus 3 --config-file ./configs/sparsercnn.crowdhuman.res50.500pro.68e.yaml --eval-only MODEL.WEIGHTS output/evl_test
```


## 7. notice
make two new folders named as detectron2 and weights. the contents of the folder detectron2 can be download [here](https://pan.baidu.com/s/1-atTJHTEleilqhVvSij5AA ) and the weights can be download [here](https://pan.baidu.com/s/1-atTJHTEleilqhVvSij5AA ).
the whole code can be download [here](https://pan.baidu.com/s/1-atTJHTEleilqhVvSij5AA ), the PIN is CSRC.

these codes are both for paper "Corner Sparse R-CNN in Dense Scenes" and "Redundant Contextual Feature Suppression for Pedestrian Detection in
Dense Scenes" (which are under review.)
