After unzipping the UCI download and looking at the contents, the following files were copied to the final work directory:
1. activity_labels.txt  (labels for the 6 physical activities)
2. features.txt:        (labels for 561-feature vector with time and frequency domain variables)
3. subject_test.txt
4. X_test.txt
5. y_test.txt
6. subject_train.txt
7. X_train.txt
8. y_train.txt

Each of the above files were all put into R as: 
activityLabels, features, subjTest, xtest, ytest, subjTrain, xtrain, ytrain

The R script "run_analysis.R" is written to do the following:

## 1. Merge the training and the test sets to create one data set.

What I did:
* subjTest, ytest, and xtest were merged to form "test"
* subjTrain, ytrain, and xtrain were merged to form "train"
* used rbind to merge "test" and "train" to form one data set "mergedData"

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

What I did:
* extract second column values from features to vector "colLabels"
* renamed columns in mergedData with "subjectID", "activity", and contents of "colLabels" respectively
* created meanStdCol which is a list of columns where the labels contain the exact strings "-mean()" or "-std()"
* created meanStdData which contains a subset of columns from mergedData

## 3. Uses descriptive activity names to name the activities in the data set.

What I did:
* replaced numeric values of activity column in meanStdData with the corresponding text labels in second column of activityLabels

## 4. Appropriately labels the data set with descriptive variable names.

What I did (based on principles of good variable names):
* replace "-mean()" with "Mean"
* replace "-std()" with "Std"
* replace "BodyBody" with "Body"

Labels before the change:
> names(meanStdData)

 [1] "subjectId"                   "activity"                    "tBodyAcc-mean()-X"          
 [4] "tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"           
 [7] "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"            "tGravityAcc-mean()-X"       
[10] "tGravityAcc-mean()-Y"        "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"        
[13] "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"         "tBodyAccJerk-mean()-X"      
[16] "tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"       
[19] "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"        "tBodyGyro-mean()-X"         
[22] "tBodyGyro-mean()-Y"          "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"          
[25] "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"           "tBodyGyroJerk-mean()-X"     
[28] "tBodyGyroJerk-mean()-Y"      "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
[31] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"       "tBodyAccMag-mean()"         
[34] "tBodyAccMag-std()"           "tGravityAccMag-mean()"       "tGravityAccMag-std()"       
[37] "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"       "tBodyGyroMag-mean()"        
[40] "tBodyGyroMag-std()"          "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
[43] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"           "fBodyAcc-mean()-Z"          
[46] "fBodyAcc-std()-X"            "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"           
[49] "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"       "fBodyAccJerk-mean()-Z"      
[52] "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
[55] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"          "fBodyGyro-mean()-Z"         
[58] "fBodyGyro-std()-X"           "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
[61] "fBodyAccMag-mean()"          "fBodyAccMag-std()"           "fBodyBodyAccJerkMag-mean()" 
[64] "fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
[67] "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()" 

Labels after change:
> names(meanStdData)

 [1] "subjectId"            "activity"             "tBodyAccMean-X"      
 [4] "tBodyAccMean-Y"       "tBodyAccMean-Z"       "tBodyAccStd-X"       
 [7] "tBodyAccStd-Y"        "tBodyAccStd-Z"        "tGravityAccMean-X"   
[10] "tGravityAccMean-Y"    "tGravityAccMean-Z"    "tGravityAccStd-X"    
[13] "tGravityAccStd-Y"     "tGravityAccStd-Z"     "tBodyAccJerkMean-X"  
[16] "tBodyAccJerkMean-Y"   "tBodyAccJerkMean-Z"   "tBodyAccJerkStd-X"   
[19] "tBodyAccJerkStd-Y"    "tBodyAccJerkStd-Z"    "tBodyGyroMean-X"     
[22] "tBodyGyroMean-Y"      "tBodyGyroMean-Z"      "tBodyGyroStd-X"      
[25] "tBodyGyroStd-Y"       "tBodyGyroStd-Z"       "tBodyGyroJerkMean-X" 
[28] "tBodyGyroJerkMean-Y"  "tBodyGyroJerkMean-Z"  "tBodyGyroJerkStd-X"  
[31] "tBodyGyroJerkStd-Y"   "tBodyGyroJerkStd-Z"   "tBodyAccMagMean"     
[34] "tBodyAccMagStd"       "tGravityAccMagMean"   "tGravityAccMagStd"   
[37] "tBodyAccJerkMagMean"  "tBodyAccJerkMagStd"   "tBodyGyroMagMean"    
[40] "tBodyGyroMagStd"      "tBodyGyroJerkMagMean" "tBodyGyroJerkMagStd" 
[43] "fBodyAccMean-X"       "fBodyAccMean-Y"       "fBodyAccMean-Z"      
[46] "fBodyAccStd-X"        "fBodyAccStd-Y"        "fBodyAccStd-Z"       
[49] "fBodyAccJerkMean-X"   "fBodyAccJerkMean-Y"   "fBodyAccJerkMean-Z"  
[52] "fBodyAccJerkStd-X"    "fBodyAccJerkStd-Y"    "fBodyAccJerkStd-Z"   
[55] "fBodyGyroMean-X"      "fBodyGyroMean-Y"      "fBodyGyroMean-Z"     
[58] "fBodyGyroStd-X"       "fBodyGyroStd-Y"       "fBodyGyroStd-Z"      
[61] "fBodyAccMagMean"      "fBodyAccMagStd"       "fBodyAccJerkMagMean" 
[64] "fBodyAccJerkMagStd"   "fBodyGyroMagMean"     "fBodyGyroMagStd"     
[67] "fBodyGyroJerkMagMean" "fBodyGyroJerkMagStd" 

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

What I did:
* use summarize_all to get mean of each variable for each activity by each subject and store results in finalData
* create final data set file "run_analysis_data.txt" to be submitted with the repo for peer review
