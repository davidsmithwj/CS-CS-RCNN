import matplotlib
import matplotlib.pyplot as plt
from detectron2_gradcam import Detectron2GradCAM

from detectron2.utils.visualizer import Visualizer
from detectron2.data import MetadataCatalog
# from detectron2 import model_zoo

from gradcam import GradCAM, GradCamPlusPlus


plt.rcParams["figure.figsize"] = (30,10)

img_path = "img/273271,2cc3e0008c49f3d2.jpg"

config_file = '../configs/sparsercnn.crowdhuman.res50.500pro.68e.yaml'

config_list = [
"MODEL.ROI_HEADS.SCORE_THRESH_TEST", "0.5",
"MODEL.ROI_HEADS.NUM_CLASSES", "1",
"MODEL.WEIGHTS", "../output/sparsercnn_evc_scx1/model_0149999.pth"
]

# layer_name = "backbone.bottom_up.res5.2.conv3"
layer_name = "sc3.SRU"
# layer_name = "evc"
instance = 4 #CAM is generated per object instance, not per class!

def main():
    cam_extractor = Detectron2GradCAM(config_file, config_list, img_path=img_path)
    grad_cam = GradCamPlusPlus
    # grad_cam = GradCAM

    image_dict, cam_orig = cam_extractor.get_cam(target_instance=instance, layer_name=layer_name, grad_cam_instance=grad_cam)

    v = Visualizer(image_dict["image"], MetadataCatalog.get(cam_extractor.cfg.DATASETS.TRAIN[0]), scale=1.0)
    out = v.draw_instance_predictions(image_dict["output"]["instances"][instance].to("cpu"))

    plt.imshow(out.get_image(), interpolation='none')
    plt.imshow(image_dict["cam"], cmap='jet', alpha=0.8)
    plt.title(f"CAM for Instance {instance} (class {image_dict['label']})")
    plt.savefig(f"inst_{instance}_{layer_name}_cam.jpg", dpi=300)
    plt.show()


if __name__ == "__main__":
    main()
