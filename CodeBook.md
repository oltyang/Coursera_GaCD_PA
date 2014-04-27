Coursera_GaCD_PA
================

Coursera - Getting and Cleaning Data - Peer Assesment

## Datasource

The datasource required by the script can be downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

or from the original project site:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Steps performed by the script

The steps performed by the script are the following:
1. Checking the existence of the input data: the script verifies the existence of all the required input data files. If a file cannot be found in the "UCI HAR Dataset" subfolder (the original directory structure of the datasource required) the process stops with an error message listing all the missing files.

2. Constructing descriptive column names: the original feature names are used (UCI HAR Dataset/features.txt), but somehow transformed: "()-" substrings replaced to "_"; "()" substrings removed; "-" chars replaced by "_" chars; "BodyBody" substring replaced to "Body" and all the column names converted to uppercase

3. Selecting only the relevant columns: the columns containing mean and standard deviation are selected

4. Reading data tables with descriptive column names and with only the relevant columns: test and train data tables are loaded from the input files with the relevant columns selected at the previous step

5. Reading subject and activity datasets from the input files

6. Labeling the data set with descriptive activity names: The activity names are loaded from the corresponding text file (UCI HAR Dataset/activity_labels.txt) and the activity datasets loaded in the previous step are encoded with these names.

7. Merging and appending tables: the corresponding data, subject and activity datasets are merged and then appended. The script differentiates the test and the train dataset in the "SUBSET" column with "TEST"/"TRAIN" values after the appending.

8. Removing unnecessary variables: all the temporary variables are released from the memory except the final dataset

9. Writing the output: the final dataset is saved to "all_clean_data.txt" file. The size of the file is ~ 8.4MB and the dimension of it is 10299 x 69. The columns are: 8 [number of measures with 3 axial signals] x 3 [3 axial signals] x 2 [mean and std] + 9 [number of measures without axial signals] x 2 [mean and std] + subject + activity + subset. The rows are the sums of the test (2947) and train (7352) datasets.

10. Creating independent, tidy dataset with averages: this step requires the reshape2 package. If this package is missing then the process stops with an error message. In the first substep the "SUBSET" variable is removed from the final dataset created in the previous steps, then a molten data frame is created using the "SUBJECT" and "ACTIVITY" columns as IDS. In the final part of this step a dataframe is casted back with the calculation of the averages of each variable for each activity and each subject.

11. Removing unnecessary variables: all the temporary variables are released from the memory except the final dataset created in the 7th step, and the tidy dataset created in the previous step.

12. Writing the output: the final dataset is saved to "averages_by_activity_subject.txt" file. The size of the file is ~ 225kB and the dimension of it is 180 x 68. The columns are: activity + subject + 8 [number of measures with 3 axial signals] x 3 [3 axial signals] x 2 [mean and std] + 9 [number of measures without axial signals] x 2 [mean and std]. The number of the rows equals the Cartesian product of the available activities and subjects.

## Assumptions
- The input data with the original directory structure can be found in the working folder
- The script requires the reshape2 package

## Structure of the output files
### "all_clean_data.txt"
- SUBSET: TEST/TRAIN (the observation comes from the test or the train dataset)
- SUBJECT: ID of the subject - Its range is from 1 to 30
- TBODYACC_MEAN_X: The mean of tBodyAcc measure in the X direction [original variable name: 'tBodyAcc-mean()-X']
- TBODYACC_MEAN_Y: The mean of tBodyAcc measure in the Y direction [original variable name: 'tBodyAcc-mean()-Y']
- TBODYACC_MEAN_Z: The mean of tBodyAcc measure in the Z direction [original variable name: 'tBodyAcc-mean()-Z']
- TBODYACC_STD_X: The standard deviation of tBodyAcc measure in the X direction [original variable name: 'tBodyAcc-std()-X']
- TBODYACC_STD_Y: The standard deviation of tBodyAcc measure in the Y direction [original variable name: 'tBodyAcc-std()-Y']
- TBODYACC_STD_Z: The standard deviation of tBodyAcc measure in the Z direction [original variable name: 'tBodyAcc-std()-Z']
- TGRAVITYACC_MEAN_X: The mean of tGravityAcc measure in the X direction [original variable name: 'tGravityAcc-mean()-X']
- TGRAVITYACC_MEAN_Y: The mean of tGravityAcc measure in the Y direction [original variable name: 'tGravityAcc-mean()-Y']
- TGRAVITYACC_MEAN_Z: The mean of tGravityAcc measure in the Z direction [original variable name: 'tGravityAcc-mean()-Z']
- TGRAVITYACC_STD_X: The standard deviation of tGravityAcc measure in the X direction [original variable name: 'tGravityAcc-std()-X']
- TGRAVITYACC_STD_Y: The standard deviation of tGravityAcc measure in the Y direction [original variable name: 'tGravityAcc-std()-Y']
- TGRAVITYACC_STD_Z: The standard deviation of tGravityAcc measure in the Z direction [original variable name: 'tGravityAcc-std()-Z']
- TBODYACCJERK_MEAN_X: The mean of tBodyAccJerk measure in the X direction [original variable name: 'tBodyAccJerk-mean()-X']
- TBODYACCJERK_MEAN_Y: The mean of tBodyAccJerk measure in the Y direction [original variable name: 'tBodyAccJerk-mean()-Y']
- TBODYACCJERK_MEAN_Z: The mean of tBodyAccJerk measure in the Z direction [original variable name: 'tBodyAccJerk-mean()-Z']
- TBODYACCJERK_STD_X: The standard deviation of tBodyAccJerk measure in the X direction [original variable name: 'tBodyAccJerk-std()-X']
- TBODYACCJERK_STD_Y: The standard deviation of tBodyAccJerk measure in the Y direction [original variable name: 'tBodyAccJerk-std()-Y']
- TBODYACCJERK_STD_Z: The standard deviation of tBodyAccJerk measure in the Z direction [original variable name: 'tBodyAccJerk-std()-Z']
- TBODYGYRO_MEAN_X: The mean of tBodyGyro measure in the X direction [original variable name: 'tBodyGyro-mean()-X']
- TBODYGYRO_MEAN_Y: The mean of tBodyGyro measure in the Y direction [original variable name: 'tBodyGyro-mean()-Y']
- TBODYGYRO_MEAN_Z: The mean of tBodyGyro measure in the Z direction [original variable name: 'tBodyGyro-mean()-Z']
- TBODYGYRO_STD_X: The standard deviation of tBodyGyro measure in the X direction [original variable name: 'tBodyGyro-std()-X']
- TBODYGYRO_STD_Y: The standard deviation of tBodyGyro measure in the Y direction [original variable name: 'tBodyGyro-std()-Y']
- TBODYGYRO_STD_Z: The standard deviation of tBodyGyro measure in the Z direction [original variable name: 'tBodyGyro-std()-Z']
- TBODYGYROJERK_MEAN_X: The mean of tBodyGyroJerk measure in the X direction [original variable name: 'tBodyGyroJerk-mean()-X']
- TBODYGYROJERK_MEAN_Y: The mean of tBodyGyroJerk measure in the Y direction [original variable name: 'tBodyGyroJerk-mean()-Y']
- TBODYGYROJERK_MEAN_Z: The mean of tBodyGyroJerk measure in the Z direction [original variable name: 'tBodyGyroJerk-mean()-Z']
- TBODYGYROJERK_STD_X: The standard deviation of tBodyGyroJerk measure in the X direction [original variable name: 'tBodyGyroJerk-std()-X']
- TBODYGYROJERK_STD_Y: The standard deviation of tBodyGyroJerk measure in the Y direction [original variable name: 'tBodyGyroJerk-std()-Y']
- TBODYGYROJERK_STD_Z: The standard deviation of tBodyGyroJerk measure in the Z direction [original variable name: 'tBodyGyroJerk-std()-Z']
- TBODYACCMAG_MEAN: The mean of tBodyAccMag measure [original variable name: 'tBodyAccMag-mean()']
- TBODYACCMAG_STD: The standard deviation of tBodyAccMag measure [original variable name: 'tBodyAccMag-std()']
- TGRAVITYACCMAG_MEAN: The mean of tGravityAccMag measure [original variable name: 'tGravityAccMag-mean()']
- TGRAVITYACCMAG_STD: The standard deviation of tGravityAccMag measure [original variable name: 'tGravityAccMag-std()']
- TBODYACCJERKMAG_MEAN: The mean of tBodyAccJerkMag measure [original variable name: 'tBodyAccJerkMag-mean()']
- TBODYACCJERKMAG_STD: The standard deviation of tBodyAccJerkMag measure [original variable name: 'tBodyAccJerkMag-std()']
- TBODYGYROMAG_MEAN: The mean of tBodyGyroMag measure [original variable name: 'tBodyGyroMag-mean()']
- TBODYGYROMAG_STD: The standard deviation of tBodyGyroMag measure [original variable name: 'tBodyGyroMag-std()']
- TBODYGYROJERKMAG_MEAN: The mean of tBodyGyroJerkMag measure [original variable name: 'tBodyGyroJerkMag-mean()']
- TBODYGYROJERKMAG_STD: The standard deviation of tBodyGyroJerkMag measure [original variable name: 'tBodyGyroJerkMag-std()']
- FBODYACC_MEAN_X: The mean of fBodyAcc measure in the X direction [original variable name: 'fBodyAcc-mean()-X']
- FBODYACC_MEAN_Y: The mean of fBodyAcc measure in the Y direction [original variable name: 'fBodyAcc-mean()-Y']
- FBODYACC_MEAN_Z: The mean of fBodyAcc measure in the Z direction [original variable name: 'fBodyAcc-mean()-Z']
- FBODYACC_STD_X: The standard deviation of fBodyAcc measure in the X direction [original variable name: 'fBodyAcc-std()-X']
- FBODYACC_STD_Y: The standard deviation of fBodyAcc measure in the Y direction [original variable name: 'fBodyAcc-std()-Y']
- FBODYACC_STD_Z: The standard deviation of fBodyAcc measure in the Z direction [original variable name: 'fBodyAcc-std()-Z']
- FBODYACCJERK_MEAN_X: The mean of fBodyAccJerk measure in the X direction [original variable name: 'fBodyAccJerk-mean()-X']
- FBODYACCJERK_MEAN_Y: The mean of fBodyAccJerk measure in the Y direction [original variable name: 'fBodyAccJerk-mean()-Y']
- FBODYACCJERK_MEAN_Z: The mean of fBodyAccJerk measure in the Z direction [original variable name: 'fBodyAccJerk-mean()-Z']
- FBODYACCJERK_STD_X: The standard deviation of fBodyAccJerk measure in the X direction [original variable name: 'fBodyAccJerk-std()-X']
- FBODYACCJERK_STD_Y: The standard deviation of fBodyAccJerk measure in the Y direction [original variable name: 'fBodyAccJerk-std()-Y']
- FBODYACCJERK_STD_Z: The standard deviation of fBodyAccJerk measure in the Z direction [original variable name: 'fBodyAccJerk-std()-Z']
- FBODYGYRO_MEAN_X: The mean of fBodyGyro measure in the X direction [original variable name: 'fBodyGyro-mean()-X']
- FBODYGYRO_MEAN_Y: The mean of fBodyGyro measure in the Y direction [original variable name: 'fBodyGyro-mean()-Y']
- FBODYGYRO_MEAN_Z: The mean of fBodyGyro measure in the Z direction [original variable name: 'fBodyGyro-mean()-Z']
- FBODYGYRO_STD_X: The standard deviation of fBodyGyro measure in the X direction [original variable name: 'fBodyGyro-std()-X']
- FBODYGYRO_STD_Y: The standard deviation of fBodyGyro measure in the Y direction [original variable name: 'fBodyGyro-std()-Y']
- FBODYGYRO_STD_Z: The standard deviation of fBodyGyro measure in the Z direction [original variable name: 'fBodyGyro-std()-Z']
- FBODYACCMAG_MEAN: The mean of fBodyAccMag measure [original variable name: 'fBodyAccMag-mean()']
- FBODYACCMAG_STD: The standard deviation of fBodyAccMag measure [original variable name: 'fBodyAccMag-std()']
- FBODYACCJERKMAG_MEAN: The mean of fBodyAccJerkMag measure [original variable name: 'fBodyBodyAccJerkMag-mean()']
- FBODYACCJERKMAG_STD: The standard deviation of fBodyAccJerkMag measure [original variable name: 'fBodyBodyAccJerkMag-std()']
- FBODYGYROMAG_MEAN: The mean of fBodyGyroMag measure [original variable name: 'fBodyBodyGyroMag-mean()']
- FBODYGYROMAG_STD: The standard deviation of fBodyGyroMag measure [original variable name: 'fBodyBodyGyroMag-std()']
- FBODYGYROJERKMAG_MEAN: The mean of fBodyGyroJerkMag measure [original variable name: 'fBodyBodyGyroJerkMag-mean()']
- FBODYGYROJERKMAG_STD: The standard deviation of fBodyGyroJerkMag measure [original variable name: 'fBodyBodyGyroJerkMag-std()']
- ACTIVITY: The label of the activity (values: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

### "averages_by_activity_subject.txt"
- ACTIVITY: The label of the activity (values: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
- SUBJECT: ID of the subject - Its range is from 1 to 30
- TBODYACC_MEAN_X: The average of the mean of tBodyAcc measure in the X direction by activitiy and subject [original variable name: 'tBodyAcc-mean()-X']
- TBODYACC_MEAN_Y: The average of the mean of tBodyAcc measure in the Y direction by activitiy and subject [original variable name: 'tBodyAcc-mean()-Y']
- TBODYACC_MEAN_Z: The average of the mean of tBodyAcc measure in the Z direction by activitiy and subject [original variable name: 'tBodyAcc-mean()-Z']
- TBODYACC_STD_X: The average of the standard deviation of tBodyAcc measure in the X direction by activitiy and subject [original variable name: 'tBodyAcc-std()-X']
- TBODYACC_STD_Y: The average of the standard deviation of tBodyAcc measure in the Y direction by activitiy and subject [original variable name: 'tBodyAcc-std()-Y']
- TBODYACC_STD_Z: The average of the standard deviation of tBodyAcc measure in the Z direction by activitiy and subject [original variable name: 'tBodyAcc-std()-Z']
- TGRAVITYACC_MEAN_X: The average of the mean of tGravityAcc measure in the X direction by activitiy and subject [original variable name: 'tGravityAcc-mean()-X']
- TGRAVITYACC_MEAN_Y: The average of the mean of tGravityAcc measure in the Y direction by activitiy and subject [original variable name: 'tGravityAcc-mean()-Y']
- TGRAVITYACC_MEAN_Z: The average of the mean of tGravityAcc measure in the Z direction by activitiy and subject [original variable name: 'tGravityAcc-mean()-Z']
- TGRAVITYACC_STD_X: The average of the standard deviation of tGravityAcc measure in the X direction by activitiy and subject [original variable name: 'tGravityAcc-std()-X']
- TGRAVITYACC_STD_Y: The average of the standard deviation of tGravityAcc measure in the Y direction by activitiy and subject [original variable name: 'tGravityAcc-std()-Y']
- TGRAVITYACC_STD_Z: The average of the standard deviation of tGravityAcc measure in the Z direction by activitiy and subject [original variable name: 'tGravityAcc-std()-Z']
- TBODYACCJERK_MEAN_X: The average of the mean of tBodyAccJerk measure in the X direction by activitiy and subject [original variable name: 'tBodyAccJerk-mean()-X']
- TBODYACCJERK_MEAN_Y: The average of the mean of tBodyAccJerk measure in the Y direction by activitiy and subject [original variable name: 'tBodyAccJerk-mean()-Y']
- TBODYACCJERK_MEAN_Z: The average of the mean of tBodyAccJerk measure in the Z direction by activitiy and subject [original variable name: 'tBodyAccJerk-mean()-Z']
- TBODYACCJERK_STD_X: The average of the standard deviation of tBodyAccJerk measure in the X direction by activitiy and subject [original variable name: 'tBodyAccJerk-std()-X']
- TBODYACCJERK_STD_Y: The average of the standard deviation of tBodyAccJerk measure in the Y direction by activitiy and subject [original variable name: 'tBodyAccJerk-std()-Y']
- TBODYACCJERK_STD_Z: The average of the standard deviation of tBodyAccJerk measure in the Z direction by activitiy and subject [original variable name: 'tBodyAccJerk-std()-Z']
- TBODYGYRO_MEAN_X: The average of the mean of tBodyGyro measure in the X direction by activitiy and subject [original variable name: 'tBodyGyro-mean()-X']
- TBODYGYRO_MEAN_Y: The average of the mean of tBodyGyro measure in the Y direction by activitiy and subject [original variable name: 'tBodyGyro-mean()-Y']
- TBODYGYRO_MEAN_Z: The average of the mean of tBodyGyro measure in the Z direction by activitiy and subject [original variable name: 'tBodyGyro-mean()-Z']
- TBODYGYRO_STD_X: The average of the standard deviation of tBodyGyro measure in the X direction by activitiy and subject [original variable name: 'tBodyGyro-std()-X']
- TBODYGYRO_STD_Y: The average of the standard deviation of tBodyGyro measure in the Y direction by activitiy and subject [original variable name: 'tBodyGyro-std()-Y']
- TBODYGYRO_STD_Z: The average of the standard deviation of tBodyGyro measure in the Z direction by activitiy and subject [original variable name: 'tBodyGyro-std()-Z']
- TBODYGYROJERK_MEAN_X: The average of the mean of tBodyGyroJerk measure in the X direction by activitiy and subject [original variable name: 'tBodyGyroJerk-mean()-X']
- TBODYGYROJERK_MEAN_Y: The average of the mean of tBodyGyroJerk measure in the Y direction by activitiy and subject [original variable name: 'tBodyGyroJerk-mean()-Y']
- TBODYGYROJERK_MEAN_Z: The average of the mean of tBodyGyroJerk measure in the Z direction by activitiy and subject [original variable name: 'tBodyGyroJerk-mean()-Z']
- TBODYGYROJERK_STD_X: The average of the standard deviation of tBodyGyroJerk measure in the X direction by activitiy and subject [original variable name: 'tBodyGyroJerk-std()-X']
- TBODYGYROJERK_STD_Y: The average of the standard deviation of tBodyGyroJerk measure in the Y direction by activitiy and subject [original variable name: 'tBodyGyroJerk-std()-Y']
- TBODYGYROJERK_STD_Z: The average of the standard deviation of tBodyGyroJerk measure in the Z direction by activitiy and subject [original variable name: 'tBodyGyroJerk-std()-Z']
- TBODYACCMAG_MEAN: The average of the mean of tBodyAccMag measure by activitiy and subject [original variable name: 'tBodyAccMag-mean()']
- TBODYACCMAG_STD: The average of the standard deviation of tBodyAccMag measure by activitiy and subject [original variable name: 'tBodyAccMag-std()']
- TGRAVITYACCMAG_MEAN: The average of the mean of tGravityAccMag measure by activitiy and subject [original variable name: 'tGravityAccMag-mean()']
- TGRAVITYACCMAG_STD: The average of the standard deviation of tGravityAccMag measure by activitiy and subject [original variable name: 'tGravityAccMag-std()']
- TBODYACCJERKMAG_MEAN: The average of the mean of tBodyAccJerkMag measure by activitiy and subject [original variable name: 'tBodyAccJerkMag-mean()']
- TBODYACCJERKMAG_STD: The average of the standard deviation of tBodyAccJerkMag measure by activitiy and subject [original variable name: 'tBodyAccJerkMag-std()']
- TBODYGYROMAG_MEAN: The average of the mean of tBodyGyroMag measure by activitiy and subject [original variable name: 'tBodyGyroMag-mean()']
- TBODYGYROMAG_STD: The average of the standard deviation of tBodyGyroMag measure by activitiy and subject [original variable name: 'tBodyGyroMag-std()']
- TBODYGYROJERKMAG_MEAN: The average of the mean of tBodyGyroJerkMag measure by activitiy and subject [original variable name: 'tBodyGyroJerkMag-mean()']
- TBODYGYROJERKMAG_STD: The average of the standard deviation of tBodyGyroJerkMag measure by activitiy and subject [original variable name: 'tBodyGyroJerkMag-std()']
- FBODYACC_MEAN_X: The average of the mean of fBodyAcc measure in the X direction by activitiy and subject [original variable name: 'fBodyAcc-mean()-X']
- FBODYACC_MEAN_Y: The average of the mean of fBodyAcc measure in the Y direction by activitiy and subject [original variable name: 'fBodyAcc-mean()-Y']
- FBODYACC_MEAN_Z: The average of the mean of fBodyAcc measure in the Z direction by activitiy and subject [original variable name: 'fBodyAcc-mean()-Z']
- FBODYACC_STD_X: The average of the standard deviation of fBodyAcc measure in the X direction by activitiy and subject [original variable name: 'fBodyAcc-std()-X']
- FBODYACC_STD_Y: The average of the standard deviation of fBodyAcc measure in the Y direction by activitiy and subject [original variable name: 'fBodyAcc-std()-Y']
- FBODYACC_STD_Z: The average of the standard deviation of fBodyAcc measure in the Z direction by activitiy and subject [original variable name: 'fBodyAcc-std()-Z']
- FBODYACCJERK_MEAN_X: The average of the mean of fBodyAccJerk measure in the X direction by activitiy and subject [original variable name: 'fBodyAccJerk-mean()-X']
- FBODYACCJERK_MEAN_Y: The average of the mean of fBodyAccJerk measure in the Y direction by activitiy and subject [original variable name: 'fBodyAccJerk-mean()-Y']
- FBODYACCJERK_MEAN_Z: The average of the mean of fBodyAccJerk measure in the Z direction by activitiy and subject [original variable name: 'fBodyAccJerk-mean()-Z']
- FBODYACCJERK_STD_X: The average of the standard deviation of fBodyAccJerk measure in the X direction by activitiy and subject [original variable name: 'fBodyAccJerk-std()-X']
- FBODYACCJERK_STD_Y: The average of the standard deviation of fBodyAccJerk measure in the Y direction by activitiy and subject [original variable name: 'fBodyAccJerk-std()-Y']
- FBODYACCJERK_STD_Z: The average of the standard deviation of fBodyAccJerk measure in the Z direction by activitiy and subject [original variable name: 'fBodyAccJerk-std()-Z']
- FBODYGYRO_MEAN_X: The average of the mean of fBodyGyro measure in the X direction by activitiy and subject [original variable name: 'fBodyGyro-mean()-X']
- FBODYGYRO_MEAN_Y: The average of the mean of fBodyGyro measure in the Y direction by activitiy and subject [original variable name: 'fBodyGyro-mean()-Y']
- FBODYGYRO_MEAN_Z: The average of the mean of fBodyGyro measure in the Z direction by activitiy and subject [original variable name: 'fBodyGyro-mean()-Z']
- FBODYGYRO_STD_X: The average of the standard deviation of fBodyGyro measure in the X direction by activitiy and subject [original variable name: 'fBodyGyro-std()-X']
- FBODYGYRO_STD_Y: The average of the standard deviation of fBodyGyro measure in the Y direction by activitiy and subject [original variable name: 'fBodyGyro-std()-Y']
- FBODYGYRO_STD_Z: The average of the standard deviation of fBodyGyro measure in the Z direction by activitiy and subject [original variable name: 'fBodyGyro-std()-Z']
- FBODYACCMAG_MEAN: The average of the mean of fBodyAccMag measure by activitiy and subject [original variable name: 'fBodyAccMag-mean()']
- FBODYACCMAG_STD: The average of the standard deviation of fBodyAccMag measure by activitiy and subject [original variable name: 'fBodyAccMag-std()']
- FBODYACCJERKMAG_MEAN: The average of the mean of fBodyAccJerkMag measure by activitiy and subject [original variable name: 'fBodyBodyAccJerkMag-mean()']
- FBODYACCJERKMAG_STD: The average of the standard deviation of fBodyAccJerkMag measure by activitiy and subject [original variable name: 'fBodyBodyAccJerkMag-std()']
- FBODYGYROMAG_MEAN: The average of the mean of fBodyGyroMag measure by activitiy and subject [original variable name: 'fBodyBodyGyroMag-mean()']
- FBODYGYROMAG_STD: The average of the standard deviation of fBodyGyroMag measure by activitiy and subject [original variable name: 'fBodyBodyGyroMag-std()']
- FBODYGYROJERKMAG_MEAN: The average of the mean of fBodyGyroJerkMag measure by activitiy and subject [original variable name: 'fBodyBodyGyroJerkMag-mean()']
- FBODYGYROJERKMAG_STD: The average of the standard deviation of fBodyGyroJerkMag measure by activitiy and subject [original variable name: 'fBodyBodyGyroJerkMag-std()']
