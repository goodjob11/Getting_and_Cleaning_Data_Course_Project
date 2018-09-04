Getting and Cleaning Data Course Project 

Codebook
------------------
Human Activity Recognition Using Smartphones Dataset
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

Dataset can be found here: 
------------------------
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For each record it is provided:
------------------
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
-------------------
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
-------------------
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

R script called run_analysis.R was created by the following instructions. 
-------------------------
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_data Variables
-------------------------
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


| [1] "subject" | ID of subject   | 
| --- | --- |
| [2] "activity" | ID of activity  |      
| [3] "TimeDomainBodyAccelerometer-mean-X"    |    mean of TimeDomainBodyAccelerometer - X  |           
| [4] "TimeDomainBodyAccelerometer-mean-Y"     |   mean of TimeDomainBodyAccelerometer - Y |              
| [5] "TimeDomainBodyAccelerometer-mean-Z"      |    mean of TimeDomainBodyAccelerometer - Z  |      
| [6] "TimeDomainBodyAccelerometer-StandardDeviation-X"   | BodyAccelerometer-StandardDeviation-X |    
| [7] "TimeDomainBodyAccelerometer-StandardDeviation-Y"    | BodyAccelerometer-StandardDeviation-Y |   
| [8] "TimeDomainBodyAccelerometer-StandardDeviation-Z"     | BodyAccelerometer-StandardDeviation-Z |  
| [9] "TimeDomainGravityAccelerometer-mean-X"        |   GravityAccelerometer-mean-X      | 
|[10] "TimeDomainGravityAccelerometer-mean-Y"        |  GravityAccelerometer-mean-Y         |
|[11] "TimeDomainGravityAccelerometer-mean-Z"        |  GravityAccelerometer-mean-Z         |
|[12] "TimeDomainGravityAccelerometer-StandardDeviation-X"  | GravityAccelerometer-StandardDeviation-X  |
|[13] "TimeDomainGravityAccelerometer-StandardDeviation-Y"  |  GravityAccelerometer-StandardDeviation-Y  |
|[14] "TimeDomainGravityAccelerometer-StandardDeviation-Z"  | GravityAccelerometer-StandardDeviation-Z   |
|[15] "TimeDomainBodyAccelerometerJerk-mean-X"        |    BodyAccelerometerJerk-mean-X      |
|[16] "TimeDomainBodyAccelerometerJerk-mean-Y"        |    BodyAccelerometerJerk-mean-Y      |
|[17] "TimeDomainBodyAccelerometerJerk-mean-Z"        |     BodyAccelerometerJerk-mean-Z     |
|  ... |   ... |
|[67] "FrequencyDomainBodyBodyGyroscopeJerkMagnitude-mean"      | BodyGyroscopeJerkMagnitude-mean  |
|[68] "FrequencyDomainBodyBodyGyroscopeJerkMagnitude-std"     |BodyGyroscopeJerkMagnitude-standardDeviation|

Calculation summary
----------
| NROW(merged_data) | [1] 10299 |
| --- | --- |
| dim(mean_sd)  | [1] 10299    68 |
|dim(tidy_data) | [1] 180  68 |

head(tidy_data[ , 1:4], 3)
--------------------------
|subject | activity | TimeDomainBodyAccelerometer-mean-X | TimeDomainBodyAccelerometer-mean-Y |
| --- | --- | --- | --- |
|1       |  LAYING   |                       0.2215982 |                       -0.04051395 |
|2       |  LAYING   |                      0.2813734   |                     -0.01815874 |
|3       |  LAYING    |                      0.2755169    |                    -0.01895568  |


