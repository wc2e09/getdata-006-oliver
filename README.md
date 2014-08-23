Instruction of the five main goals

This is a guide for who needs to understand the process of tidy data set. There are five main goals of this instruction as follows:

1.Merges the training and the test set to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
 

What data structure would it be in this repo?

The whole files you should see over this repository is as follows:
The scripting file to deliver the five main goals. Before running this script, you should set your working directory under the same directory as you see the file * README.md.
* run_analysis.R

The instruction file to help you understand what variables will be used and what the definition of these variables is:
* CodeBook.md

The final result dataset, under the directory of "Work", used to achieve the five main goals that with the file name followed by .txt
* activity_labels.txt
* dataset_avg.txt
* dataset_test.txt
* dataset_train.txt
* dataset.txt
* features.txt
* subject_test.txt
* var_num_mean.txt
* var_num_std.txt
* x_test.txt
* x_train.txt
* y_test.txt
* y_train.txt


The raw data set that provided by the final project of this course (Getting and Cleaning Data Course Project) or you may download this files over this url link. 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
UCI HAR Dataset\
	README.txt
	activity_labels.txt
	features.txt
	features_info.txt
	test\
		Inertial Signals\
			body_acc_x_test.txt	
 			body_gyro_x_test.txt	
			total_acc_x_test.txt
			body_acc_y_test.txt	
			body_gyro_y_test.txt	
			total_acc_y_test.txt
			body_acc_z_test.txt	
			body_gyro_z_test.txt	
			total_acc_z_test.txt
		X_test.txt
		subject_test.txt
		y_test.txt
	train\
		Inertial Signals\
			body_acc_x_train.txt	
 			body_gyro_x_train.txt	
			total_acc_x_train.txt
			body_acc_y_train.txt	
			body_gyro_y_train.txt	
			total_acc_y_train.txt
			body_acc_z_train.txt	
			body_gyro_z_train.txt	
			total_acc_z_train.txt
		X_train.txt
		subject_train.txt
		y_train.txt


The instruction guide

You may run the file * run_analysis.R step by step to separately get the result for every main goal as described above. 


Contributor
* Oliver Chang - Wrote the initial version, devote the running script and tiny dataset

