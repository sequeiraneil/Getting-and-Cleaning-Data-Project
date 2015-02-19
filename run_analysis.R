library(plyr)

##      read the training data set & activity
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

##      read the training subjects
subject_train <- read.table("train/subject_train.txt")


##      read the test data set & activity
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")


##      read the test subjects
subject_test <- read.table("test/subject_test.txt")


##      create a mega set with both training & test data
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)



##      read the features being tested
features <- read.table("features.txt")

##      pass the required columns only as a vector
##      grep is brilliant!!
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[,2])


##      subset the mega set with only the required columns
x_data <- x_data[, mean_and_std_features]


##      give the subsetted data names 
names(x_data) <- features[mean_and_std_features,2]


##      read the activities data
activities <- read.table("activity_labels.txt")

##      replace activity column with the activity name 
y_data[,1] <- activities[y_data[,1],2]


##       columns get a name
names(y_data) <- "activity"
names(subject_data) <- "subject"


##      merge all the columns to give a cleaned data set
all_data <- cbind(x_data, y_data, subject_data)

##      on which to use the column means function, & assign to a variable
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[,1:66]))

##      write the tidy data set to a file, without row names.
write.table(averages_data, "averages_data.txt", row.names = FALSE)
