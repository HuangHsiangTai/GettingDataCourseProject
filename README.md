# GettingDataCourseProject

This reporsitory will include run_analysis.R file which will generate tidyData.txt

##Procedure
1. type source("run_analysis.R") in R prompt
2. type analysis() in R prompt

##How the script works
###Merges the training and the test sets to create one data set.
1.(Line 5~10)read the files from test folder, train folder 
2. (Line 11~12)use rbind to merge two sets. 
###Extracts only the measurements on the mean and standard deviation for each measurement.
1.(Line 13~ 14)read the feature and activity label from txt files.
2.(Line 15 ~16) find the measurement name which contains 'mean' or 'std'
3. (Line 17) extact the interesting measurement from the original data set 
###Uses descriptive activity names to name the activities in the data set
1.(line 18)append activity index to the data set
2.(line 19) append subject index to the data set
3.(line 20,21) merge data set with activity label set. Those two set both have acitivity index.
4. (line 22,23) drop the useless activity index column
###Appropriately labels the data set with descriptive variable names. 
1. (line 24) generate column name.
2. (line 25) rename column name.
###From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
1. (line 25~27) melt the data set, and keep activity and subject column as id column
2. (line 28) use dcast to caluculate the mean of each variable
3. (line 29 ) write the tidy data to the file