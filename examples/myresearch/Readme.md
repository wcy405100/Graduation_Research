# Step to run myresearch
1. run updated_extract_frames.sh to extract each frame of the videos in video_data to frames folder.
2. [optional for training the flow model] use matlab to generate the flow image of the original frames
run run_create_flow_images_LRCN.m
3. run the Create_txt.class file to generate the (flow_)eagle.txt and (flow_)falcon.txt files according to the folder name.
4. run tr_tst.py to generate the training and testing txt file. Note if you want to generate for the flow_image folder, please add 'flow' as second argunment after tr_tst.py 
5. Download the pretrained CNN model from [here](https://people.eecs.berkeley.edu/~lisa_anne/caffe_imagenet_hyb2_wr_rc_solver_sqrt_iter_310000) 
without changing the name and put it under myresearch folder.
6. bash ./run_singleFrame_RGB.sh for starting the training of CNN model
7. bash ./run_lstm_RGB.sh for training the LRCN model

