import os

from detectron2.data.datasets.coco import load_coco_json
from detectron2.data.detection_utils import read_image

# 加载数据集链表字典(数据集应该先被注册过）,"smoke_train"是之前注册过的数据集
datasets = 'crowdhuman'
json_file = r"D:\Datasets\COCOCrowdHuman\annotations\val.json"
image_root = r"D:\Datasets\COCOCrowdHuman\CrowdHuman_val\Images"
image_name = '273275,6c70f00028727fb9.jpg'
image_names = os.listdir(image_root)

data_dict = load_coco_json(json_file, image_root, datasets)

from torch.utils.data.sampler import RandomSampler

# 在数据集中随机采样一个图片用作数据的可视化
# sampler = RandomSampler(data_dict, True, 1)
# index = next(iter(sampler))
# 此图所对应的字典
image_dict = data_dict[1282]
# 读取图片
img = read_image(image_dict["file_name"], format='BGR')
# 创建一个Visualizer对象
from detectron2.utils.visualizer import Visualizer

visualizer = Visualizer(img, metadata={'thing_classes': ['person']})
img_visual = visualizer.draw_dataset_dict(image_dict)
# Visualizer会返回一个VisImage类
import cv2
cv2.imwrite(image_name,img_visual.get_image())
cv2.imshow(image_name, img_visual.get_image())
cv2.waitKey(0)