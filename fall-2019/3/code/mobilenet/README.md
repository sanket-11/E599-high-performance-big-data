## 1. Clone the repository
## 2. Install tensorflow API: 
To use the Tensorflow object detection API, follow the instructions in [this link](hhttps://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/installation.md)
Instead of tensorflow/models/research, use the folder models/research in this directory
## 3. Prepare the data 
1. Go to the data_prepare folder 
2. Put your images in the "images" folder and annotations  in the annotations folder ( the images and annotations need to have the same names) and the abnnotations should bge in the VOC format
3. add two empty folders "train_dataset" and "val_dataset"
4. Run the script  	"create_tfrecord_no_test.sh" . This will create the train and validation sets

``

./create_tfrecord_no_test.sh


``


