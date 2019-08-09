Getting and Cleaning Data: Course Project
=========================================

Introduction
------------
This repository contains the code for cleaning and tidying the data for my Datascience course "Getting and Cleaning Data".

About the raw data
------------------

The course provided us with a dataset consisting of traing and test sets of 30 people perfomring 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a Samsung smartphone.
The data is collected from the accelerometer and gyroscopic sensors of the phone.
Tye dataset contains a 561-feature vector with time and frequency domain variables. 

The files contained in the data set are - 

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

About the script and the tidy dataset
-------------------------------------
In this project a script is created which creates an independent tidy data set with the average of each variable for each activity and each subject.

The pre-conditioning of the script is as follows -
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.

This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.

References
-------------------
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
	

