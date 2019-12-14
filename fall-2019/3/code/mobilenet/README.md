## 1. Clone the repository
## 2. Install tensorflow API: 
To use the Tensorflow object detection API, follow the instructions in [this link](https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/installation.md)
Instead of tensorflow/models/research, use the folder models/research in this directory
## 3. Prepare the data 
1. Go to the data_prepare folder and create 3 folders: images, annotations and test_images

2. Put your  training images in the "images" folder and training annotations  in the "annotations" folder ( the images and annotations need to have the same names) and the annotations should bge in the VOC format. The "test_images" folder should contain the test images
3. add two empty folders "train_dataset" and "val_dataset"
4. Run the script  	"create_tfrecord_no_test.sh" . This will create the train and validation sets

```python 
./create_tfrecord_no_test.sh                       
```


## 4. Get the model
1. Get the model you want train from [Tensorflow Model zoo](https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/detection_model_zoo.md)
In this case we chose "ssd_mobilenet_v1_quantized_coco" and "ssd_mobilenet_v2_quantized_coco"
2. Create a folder named "CP" inside mobilenetv1 and mobilenetv2 and download each model the appropriate CP folder
3. Extract the files in CP folder for each model (if you extracted them elsewhere move them to CP folder)
4. Copy the file "pipeline.config" to the parent directory (mobilnetv1 or mobilenetv2)
5. Change the pipeline.config file accordingly by specifying the right paths

```python 
  train_input_reader {
  label_map_path: "path to pascal_label_map.pbtxt"
  tf_record_input_reader {
    input_path: "path totrain.tfrecord"
  }
}
eval_config {
  num_examples: 8000
  metrics_set: "coco_detection_metrics"
  use_moving_averages: false
}
eval_input_reader {
  label_map_path: "path to pascal_label_map.pbtxt"
  shuffle: false
  num_readers: 1
  tf_record_input_reader {
    input_path: "path to val.tfrecord"
  }
  ```
 ## 5. Training 
 1. Run the script "run_training.sh
 ```python 
./run_training.sh                       
```
Training will take long. Think of doing it within a tmux session

## 6. Export model
 1. Once the training is done, run the script "run_training.sh
 ```python 
./export_model.sh                      
```
## 7. Inference
### 7.1. On images

```python 
python time_benchmark.py                  
```
Make sure to set up these variables correctly: 
 *MODEL_NAME
 *PATH_TO_FROZEN_GRAPH
 *PATH_TO_LABELS
 *image_paths
