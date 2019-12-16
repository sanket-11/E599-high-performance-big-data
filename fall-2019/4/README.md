# Crash Detection using YOLO and Siamese Network
### [Manjeet Pandey](https://github.com/ManjeetKP), [Sanket Patole](https://github.com/sanket-11), [Shivam Thakur](https://github.com/shivam529)
This is a code repository for our project based on Crash Detection in the Indy500 racing event.
## Indy500
Indy500 is one of the premier car racing event in the nation involving numerous participants and the nature of the track with unexpected twists and turns, there is always a possibility of crash. Nearly 60 competitors have perished at Indy, with plenty more spectators and crew also falling at the track.
## Crash Detection for Indy500
We propose an end-to-end deep learning crash detection pipeline using traditional concepts of object detection and latent space embeddings to accurately detect a crash in a live feed. Our project is based on a two layer model, where we first detect the crash in a given frame using YOLO and to further improve the results, we pass the predicted output from YOLO to a Siamese Network which uses a one-shot technique to classify between a normal car and crashed car.
## Dataset
For the dataset, we were provided with around 2000 labelled images of IndyCar races. To add to this, we scraped Youtube videos of IndyCar crashes and labelled around 1000 crash images in YOLO format using the [labelImg](https://github.com/tzutalin/labelImg) tool.
## Architecture
#### YOLO
![Yolo](https://miro.medium.com/max/640/0*WUpMWzNu_ymDyHPp.png)
 - In Yolo a single convolutional network simultaneously predicts multiple bounding boxes and class probabilities for those boxes.
 - It trains on full images and directly optimizes detection performance.
 - Yolo divides the input image into a number of grids cells. Each cell predicts bounding boxes and confidence scores for those boxes.
 - The confidence scores reflect how confident the model is that the box contains an object and also how accurate it thinks the box is that it predicts.
 ##### YOLO Stage 1 Output :
![yolostage1](https://raw.githubusercontent.com/ManjeetKP/E599-high-performance-big-data/master/fall-2019/4/code/output_data/stage11.png)
 ##### YOLO Stage 2 Output :
![yolostage2](https://lh3.googleusercontent.com/ttjCuclSdtiGuNqPQAhgDJ4s1WT17cMPAfNiqnuUKMy1iAGN0qYH-lB8p1zZAwe7qlaqfUQPg7h9F9f_AbBN08qJ_m85zUbOSFMAarsbaBCGiWNSs3M2UZqdKEHWUrzbShTbdAdR_sKuvu9EK5jH9zdQ9ir7EsQQZThd-exoknMLq0x5MJVnn38rNurRKrSu_ISGSM_H_7kRPzpWYGFAltMeTyoqmdsqVrG-GtUvNa0nQ287TRi_2ntlmakbU2njnk5NBlhBeaSAiVWaxqrDemcCpr-t_gch__De2SSum1UQZiUpKjYQ2btSzeYFw9RywOknzxOMH11Ktw1APNPbmnGLXkSBA0Ml6oRglDuq7b1l9qz222U0pNnYKEmXe9if8bblZKf9OQdMguQO81gMBx9rFC5RvH7tWuq9T94FlcyKLsh14_HpE3ACS2v9EF0IKYoAYDeui3hxpKa6luXNAMMmF43a2ZXSvATfvaQrd0VtyzHQv05vI-BOChrwLrO9Wi5DW8aMbrnn48AgOpnvyMHK3X0lQuVHk00wdCM8hoAhY9E4AUzOBcPPWoLqExxSDWPNB0Oe45pN5SrqZdx5hLmJVdswt0rOdUjPSDoYliQL64jCeBYhvm1c406ipy2dbNLaK69qa6Q1jNRXUy9eEcio7tQKBQmu3FgJrIbI0CHGTMji=w1152-h648-no)
##### YOLO Stage 3 Output :
![yolostage3](https://raw.githubusercontent.com/ManjeetKP/E599-high-performance-big-data/master/fall-2019/4/code/output_data/stage22.png)
#### Siamese Network
 - A Siamese networks consists of two identical neural networks, each taking one of the two input images.
 - The output of this network is sent to a contrastive loss function which calculates a similarity score between the two images.
 - We use this to our advantage where we cluster the embeddings of crashed cars and normal cars.
 - The K-Means clustering performs well on the embeddings and clearly forms separate clusters for the two classes, which is further used for classification.
 - Individual images can be used to classify using the YOLO and Siamese in conjugation, however we are still working to integrate siamese with YOLO to do classification on live streams
 
![Siamese Netowork](https://sites.google.com/site/quartetnetlearning/_/rsrc/1467097642046/home/siamese.jpg?height=255)

##### Siamese Network Output(Single Margin):
![singlemargin](https://lh3.googleusercontent.com/Pgh3NOqv19pPJpt16RCus7tmFATWAx4vLFiVFw_9dkUlGbmQbpRXWApbZVrBHs90RJ_dsawuG9g1LFrUPjoucWK1qhUG-Tp1qlEIb-Lg55ucLJh45jAJRErOf-4p2ztmHq7GO3Lonv7IQLm20aOvZA1_q9zS1pj8-E8B1bP_neDcQkNWaqdSggTtmpprMn7FiXJUbld-pKYcyLnpnDrWUHjx4Pr2WOW5lhepb6Nwb0Z_U5vU-FG5Fb_FeWyCO3Qz2E1HDwizBHjpilq4BwI4pl6JQzk_5SKaWUhU0zbnDU4B-0zgiFwLdFKMxtuDD9aZRAX4h9VVPjyLjQdsEdXPJj8wk8g9_uJrSNCOk8EqtNLZU-7q78kpfAxcfsQPxG1cbpNIFya08eYdf7XS734tgfGvBCe4J5WUgxzY75d_8oVR1VxzrVYvSvArY7BLr_3NUY_QT595AJfO9IKW9jnXYS_8MUaMuwDH8Uq-bZeZLRmFGvhXjP8w_scBOHY4nBXBLX8QBH0XH7hUGtVfHBJf4l-axVU8IPOwVYCMOQPSGc0d5FlPFkGFs2qAZ45ApTb6tg9tkzs4SHNq_yylZNTBBkjQco-xcSSTyHvPH7LEiMh5xGZsUuv83a18S6U1oHBZjPEUenadWIfkApamfggLMOMy6NAcZ-VNvdgZVBbvziUf34bg=w660-h336-no)
##### Siamese Network Output(Double Margin):
![doublemargin](https://lh3.googleusercontent.com/Mat2y7pSZtfgNbGWpUl93Lq25cq9WB1OgURefVll5y3RCu526CmCzqhh13dYJxSGsxvT063C5C0jMfhfyzm7jV-frXeVQzhFcxvxvGxB7oCxG97qCotxYGVQqcTe5I5mUQReS2tgmvAH6MI6zHx0cj7yZ-Vcg2GM-T7NdSxijAHHNzQwB5a1ej_gxfDyJd84rmV7UCvuZpV_-KA_U9ViHt4J9-PX7uDCbS4DC4KZZfDti--VMSCUsVaYZo5uQ2YQQTelc3ChZZCEH1mj_IJbN9Jps1Drh4OK2kSDVkSwP2r_p0zW1THUueXEEzbvMp87D890R5rZC6TnnkhxM92v8GKxXDtQkrxPX-sv8_QJEqXpqs-ePn1-avaO6vxmVxleOtNAkk7E-4CQz2StTAabrnhPufXrzC2faItl7T3kb5N02fZEBtzncfej3yrwAIYePTRM8LsAXNKOd5tmEqVYmFZ86L6DWhMSbREzyXpx_rmAyZ6QD2TjziDnpaCL4INiFSRXb5PD7EFB0SsHu8bVGtp35BOSfU0DuDqNXQw8Y3Xq4coWzzYknPs_r5C-4blbip2by-YrnXXUK3JDvCzwn8dMxvBkvpcadptB8oMVbLuRZKsUU6mCWPIjPQjAGTlNH4MEY8xq7SSJ1EL89afINtRb-597j46YMgItauTH5OaI632v=w836-h539-no)
## Conclusion:
 -	YOLO performs well in detecting cars in general, irrespective of its condition.
 -	When trained to differentiate and predict Crash and normal car, it gets confused and sometimes detects a crashed car as a normal car.
 -	Also, since the idea behind YOLO to detect a crash is to detect smoke, off-road or a car with broken parts, sometimes a normal car in the vicinity of smoke or broken parts is detected as crash.
 -	Adding a Siamese network in the pipe-line along with YOLO boosts the accuracy a lot.
 -	Performing clustering using K-Means on the embeddings of the two classes (crash and car) clearly visualizes two separate clusters, which supports our boost in the accuracy with Siamese network.
 -	However, apart from the above results, there is still room for improvement.
 -	Amongst our experiments, we realized that the ideal architecture to predict crash should involve recurrence, such as a RNN.
 -	With recurrence we can use data from multiple frames of the live stream and then make meticulous predictions, since a recurrent network will use data along a time-line to increase the accuracy of the prediction. Such as multiple frames of a crash one-after the other.

## References

[1]	Miller, A. (2015, March 12). The 8 Deadliest Race Tracks In The World.  https://www.thrillist.com/cars/the-8-deadliest-tracks-on-earth-most-dangerous-races.

[2]	Schroff, Florian, et al. “FaceNet: A Unified Embedding for Face Recognition and Clustering.” 2015 IEEE Conference on Computer Vision and Pattern Recognition (CVPR), 2015, doi:10.1109/cvpr.2015.7298682.

[3] 	Redmon, Joseph, et al. “You Only Look Once: Unified, Real-Time Object Detection.” 2016 IEEE Conference on Computer Vision and Pattern Recognition (CVPR), 2016, doi:10.1109/cvpr.2016.91.

[4]	Hadsell, R., Chopra, S., & Lecun, Y. (n.d.). Dimensionality Reduction by Learning an Invariant Mapping. 2006 IEEE Computer Society Conference on Computer Vision and Pattern Recognition - Volume 2 (CVPR06). 

[5]	Hao, J., Dong, J., Wang, W., & Tan, T. (2018). DeepFirearm: Learning Discriminative Feature Representation for Fine-grained Firearm Retrieval. 2018 24th International Conference on Pattern Recognition (ICPR). 
