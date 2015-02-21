# The CodeBook


The script `run_analysis.R` performs the 5 steps described in the course project's definition.

The order of operations is thus: 
Merge all similar data using the `rbind()` function.  This includes the training data, the test data & the subject data 


Select only the columns with the mean and standard deviation measures. 
These columns are then correctly named using the features.txt file.


Activity data is numbered 1:6. ID's are replaced with activity names from the activity_labels.txt file.

Columns with vague column names are corrected.

The script then produces a new dataset with average measures for each subject and activity type (Since there are 30 subjects * 6 activities, we expect to have a 180 rows as the outpout). This output file (averages_data.txt),is uploaded to this repository.



Variables

x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.

x_data, y_data and subject_data merge the previous datasets to perform further tidying.

features contains the names for x_data datasets. 
mean_and_std_features is a numeric vector used to extract the desired columns, & relevant names are used from the features variable.


activities contains the activity labels, which are applied as names to the y_data dataset.


all_data is the merged data of x_data, y_data and subject_data.

averages_data contains the relevant averages which will be later stored in a .txt file. 
This script uses plyr packages' ddply() function to apply colMeans().