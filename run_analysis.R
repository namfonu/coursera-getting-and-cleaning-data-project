##You should create one R script called run_analysis.R that does the following.

##1. Merges the training and the test sets to create one data set.
XTest <- read.table("test/X_test.txt")
YTest <- read.table("test/Y_test.txt")

XTrain <- read.table("train/X_train.txt")
YTrain <- read.table("train/y_train.txt")

subjectTest <- read.table("test/subject_test.txt")
subjectTrain <- read.table("train/subject_train.txt")


x <- rbind(XTest,XTrain)
y <- rbind(YTest,YTrain)
subject <- rbind(subjectTest,subjectTrain)




##2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")
feature_mean_std <- grep("-(mean|std)\\(\\)", features[, 2])
x <- x[, feature_mean_std]
names(x) <- features[mean_and_std_features, 2]

##3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")
y[, 1] <- activities[y[, 1], 2]

##4. Appropriately labels the data set with descriptive variable names.

names(y) <- "activity"
names(subject) <- "subject"
all_data <- cbind(x, y, subject)

##5. From the data set in step 4, creates a second, 
##independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
averages_data <- ddply(all_data, .(Subject, activity), function(x) colMeans(x[, 1:100]))
write.table(averages_data, "tidydata.txt", row.name=FALSE)

