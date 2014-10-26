The experiments have been carried out with a group of 30 volunteers within an
age bracket of 19-48 years. Each person performed six activities (WALKING,
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer
and gyroscope, we captured 3-axial linear acceleration and 3-axial angular
velocity at a constant rate of 50Hz. The experiments have been video-recorded to
label the data manually. The obtained dataset has been randomly partitioned into
two sets, where 70% of the volunteers was selected for generating the training
data and 30% the test data.

The features selected for this database come from the accelerometer and
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals
(prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they
were filtered using a median filter and a 3rd order low pass Butterworth filter
with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration
signal was then separated into body and gravity acceleration signals
(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter
with a corner frequency of 0.3 Hz.

The features.txt file contains a descriptive name of each of the columns in the
datasets. The features file is read into to a data frame and the second column is extracted
to create a vector of features. The activity_labels.txt file contains a description for each
activity code. As in the features file, the activity file is read into a data frame.

The train and test dataset are identically. The each dataset is read into a data frame, using
the feature vector for the column names. We are only interested data regarding mean and standard
deviation. Any column name not containing either mean or std was eliminated from the dataset.
For each data set, there is a separate file containing activity and subject for each observation 
in the dataset. Each of these files are read into a data frame. The activity data frame is merge
with the activity labels data frame to provide a meaningful description of the activity. The 
column bind (cbind) is used to add the subject and activity to dataset. To combine both datasets
into a single dataset, the row bind (rbind) function is used.

To create the tidy data set of means for each subject and activity, the group_by and 
summarise_each functions from the dplyr package are used. First, grouping by the subject
and activity is passed to the summarize_each function using means.
