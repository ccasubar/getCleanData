## Move the required .txt files to working directory

activityLabels <- read.csv("activity_labels.txt", sep = "", header = FALSE)
features <- read.csv("features.txt", sep = "", header = FALSE)
subjTest <- read.csv("subject_test.txt", sep = "", header = FALSE)
xtest <- read.csv("X_test.txt", sep = "", header = FALSE)
ytest <- read.csv("y_test.txt", sep = "", header = FALSE)
subjTrain <- read.csv("subject_train.txt", sep = "", header = FALSE)
xtrain <- read.csv("X_train.txt", sep = "", header = FALSE)
ytrain <- read.csv("y_train.txt", sep = "", header = FALSE)

## Instruction 1: Merge the training and test sets to create one data set.
## Merge all test and train files then use rbind to create the one data set

test <- data.frame(subjTest, ytest, xtest)
train <- data.frame(subjTrain, ytrain, xtrain)
mergedData <- rbind(test, train)

## Instruction 2: Extract only mean and standard deviation for each measurement.

colLabels <- as.vector(features[, 2])
colnames(mergedData) <- c("subjectId", "activity", colLabels) 
meanStdCol <- grep("-mean\\()|-std\\()", colnames(mergedData))
meanStdData <- mergedData[, c(1, 2, meanStdCol)]

## Instruction 3: Uses descriptive activity names to name the activities in 
## the data set.

meanStdData$activity <- 
     as.character(activityLabels[match(meanStdData$activity, activityLabels$V1), "V2"])

## Instruction 4: Appropriately labels the data set with descriptive 
## variable names.
## Examined the remaining columns and decided on the following changes:
## 1. replace "-mean()" with "Mean"
## 2. replace "-std()" with "Std"
## 3. replace "BodyBody" with "Body"

colnames(meanStdData) <- sub("-mean\\()", "Mean", colnames(meanStdData))
colnames(meanStdData) <- sub("-std\\()", "Std", colnames(meanStdData))
colnames(meanStdData) <- sub("BodyBody", "Body", colnames(meanStdData))

## Instruction 5: From the data set in step 4, creates a second, independent 
## tidy data set with the average of each variable for each activity and 
## each subject.

finalData <- meanStdData %>% group_by(subjectId, activity) %>%
     summarize_all(mean)

## Create tidy data set for peer review

write.table(finalData, file = "run_analysis_data.txt", row.names = FALSE)
