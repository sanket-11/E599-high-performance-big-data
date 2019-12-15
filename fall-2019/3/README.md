# Real-time object detection on Mobile networks
## Mariem Loukil
In this prject we are trying to perform real-time object detection on Deep Learning networks that can be deployed on Mobile and Edge devices. 
We trained three different networks on our specific dataset (IndyCar images data). The networks are : 
* SSD-Mobilenetv1
* SSD-Mobilenetv2 
* Tiny Yolov3

The SSD-Mobilenet networks were implemented using [Tensorflow model Zoo ]
(https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/detection_model_zoo.md) and the Tiny Yolov3 was implemented in Tensorflow with the data in the VOC format.

In the folder, code/output_data, there are example of the cars detection using the models we implemented.

For the results, we found that the Tiny-yolov3 model outperforms the other two models in both terms of detection mAP and performance. 

The Table below shows the mAP results for the 3 models: 

| ------------- | SSD-Mobilenetv1  | SSD-Mobilenetv2 | Tiny-yolov3|
| ------------- | ------------- |------------- |------------- |
| mAP | 72.44% | 64.27%|78.04% |
