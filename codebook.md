
**The script runanalysis.R performs the 5 steps described in the course project's definition.**

1. Merges the training and the test sets to create one data set.
1.1 read from X_test.txt/ Y_test.txt / X_train.txt/  y_train.txt
1.2 use rbind merges data

2. Extracts only the measurements on the mean and standard deviation for each measurement.
2.1 read from features.txt
2.2. use grep get feature mean and std

3. Uses descriptive activity names to name the activities in the data set
3.1 read from activity_labels.txt

4. Appropriately labels the data set with descriptive variable names.
4.1 named activities
4.2 combind dataset


5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
5.1 install library plyr
5.2 get average data of sample data
5.3 write tidy data to tidydata.txt

