=======================================================================
Human Activity Recognition Using Smartphones Summary Dataset
Version 1.0
=======================================================================
Author: S. Vacik
=======================================================================

The summary dataset was created using the Human Activity Recognition (HAR) Using Smartphones Dataset as offered by the University of California in Irvine (UCI) for the purpose of demonstrating skills in getting and cleaning data. 

=======================================================================
Background of the HAR Dataset

The full HAR dataset was created through experimentation by Jorge L. Reyes-Ortiz, David Anguita, Alessandro Ghio, and Luca Oneto -- a collaboration between Smartlab (Non Linear Complex Systems Laboratory)
DITEN (Universit‡ degli Studi di Genova), and Via Opera Pia 11A, I-16145, Genoa, Italy. 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The HAR dataset provided for each record:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

See the following files from the HAR dataset for more information: README.txt, features_info.txt, and features.txt. 

Source URL:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

======================================================================
HAR Dataset Summarization Methodology

The HAR Summary Dataset was produced to provide easily accessible averages of the mean and standard deviation (std) measurements in three dimensional (3D) space for  each activity and each subject.  

An R script (run_analysis.R) loaded the following files from the HAR dataset:
- "subject_test.txt": subject designations (numerical) in the test set. 
- "X_test.txt": test dataset.
- "y_test.txt": activity labels per row of measurements in "X_test.txt".
- "subject_train.txt": subject designations (numerical) in the training set.
- "X_train.txt": training dataset.
- "y_train.txt": activity labels per row of measurements in "X_train.txt".
- "activity_labels.txt": Links the class labels with their activity name.

merged the subject numbers, the activities, and the original training and test datasets into a single dataset and extracted the following variables from the merged dataset.
- subject numbers
- activity labels
- tBodyAcc-mean()-X
- tBodyAcc-mean()-Y
- tBodyAcc-mean()-Z
- tBodyAcc-std()-X
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z

The activity labels replaced the activity numeric designations. The dataset was condensed by averaging each measurement per subject and per activity. The condensed dataset column names were assigned the variable names listed above. 

The condensed dataset was compiled and exported to the "HARdataset.txt" output file. The condensed dataset contains the following variables.

- "SubjectID": utilizes the original subject designations. Each row identifies the subject who performed the activity for each measurement. Its range is from 1 to 30.
- "Activity": Each subject performed six activities, including WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING (down).
- "tBodyAcc-mean()-X": The mean of body acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. The same description applies to the variables below for the means of movement in the Y and Z axes and the standard deviations of the movement in the X, Y, Z axes.
- "tBodyAcc-mean()-Y" 
- "tBodyAcc-mean()-Z"
- "tBodyAcc-std()-X"
- "tBodyAcc-std()-Y"
- "tBodyAcc-std()-Z"

