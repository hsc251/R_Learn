## Getting and Cleaning Data Project

Author: Hsin Chih Chen </br>

### Description
This is the programming assignment from Johns Hopkins' Getting and Cleaning Data course, and the purpose for this assignment is to practice merge two different sets of data sets while integrating the order to become a presentable tidy data. </br>

### Source Data
Applied data and description is within [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) </br>

### Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. </br>

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. </br>

### Attribute Information
For each record in the dataset it is provided: </br>
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. </br>
- Triaxial Angular velocity from the gyroscope. </br>
- A 561-feature vector with time and frequency domain variables. </br>
- Its activity label. </br>
- An identifier of the subject who carried out the experiment. </br>

### The following are the 5 steps applied for the application to extract necessary data.
* 1.  Merge both the training and the test datasets as one complete data set. </br>
* 2.  Extracts only the measurements on the mean and standard deviation for each measurement. </br>
* 3.  Uses descriptive activity names to name the activities within the combined data set. </br>
* 4.  Appropriately labels the data set with descriptive variable names. </br>
* 5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. </br>
