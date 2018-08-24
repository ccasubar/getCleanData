After unzipping the UCI download and looking at the contents, the following files were copied to the final work directory:
1. activity_labels.txt: labels for the 6 physical activities
2. features.txt: labels for 561-feature vector with time and frequency domain variables
3. subject_test.txt
4. X_test.txt
5. y_test.txt
6. subject_train.txt
7. X_train.txt
8. y_train.txt

An R script called run_analysis.R exists and does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
