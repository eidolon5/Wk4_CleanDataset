# Script Description:
# Input File Description:
# - 'train/subject_train.txt": each row identifies the subject who performed
#    the activity for each window sample. Its range is from 1 to 30.
# - 'train/X_train.txt": contains training dataset associated with each activity/subject
# - 'train/y_train.txt": contains the activity labels associated with each subject and each observable
# - 'test/subject_test.txt": each row identifies the subject who performed the
#    activity for each window sample. Its range is from 1 to 30.
# - 'test/X_test.txt": contains test dataset 
# - 'test/y_test.txt": contains test activity labels
# - 'activity_labels.txt": activity labels used for test/training sets
# Function Declarations: None
# Variable Declarations: Variables are given throughout the code commentary below.
# Code commented out was used for debugging.

# Load libraries
# Find wd.
wd <- getwd()

# Read in datasets and build two dataframes: (1) training (traindf) and (2) test (testdf).
actlabels <- read.table(paste(wd, "UCIHARDataset", "activity_labels.txt", sep="/"))
testdf <- read.table(paste(wd, "UCIHARDataset", "test", "subject_test.txt", sep="/"))
traindf <- read.table(paste(wd, "UCIHARDataset", "train", "subject_train.txt", sep="/"))
#print(head(testdf, 5))
#print(head(traindf, 5))
traindf <- cbind(traindf, read.table(paste(wd, "UCIHARDataset", "train", "y_train.txt", sep="/")))
testdf <- cbind(testdf, read.table(paste(wd, "UCIHARDataset",  "test", "y_test.txt", sep="/")))

testdf <- cbind(testdf, read.table(paste(wd, "UCIHARDataset", "test", "X_test.txt", sep="/")))
#testdf <- cbind(testdf, read.table(paste(wd, "UCIHARDataset",  "test", "y_test.txt", sep="/")))
traindf <- cbind(traindf, read.table(paste(wd, "UCIHARDataset", "train", "X_train.txt", sep="/")))
#print(dim(testdf))
#print(dim(traindf))
#print(head(testdf, 5))
#print(head(traindf, 5))
print("Loaded training and test dataframes")

# Merge the training & test data frames into Human Activity Recognition (HAR)
# data frame, HARdf. 
HARdf <- rbind(testdf, traindf)
#print(head(HARdf))
#print(tail(HARdf))
#print(dim(HARdf))

# Assign column names. Label the data set with descriptive variable names.
names(HARdf) <- c("SubjectID", "Activity", "tBodyAcc-mean0-X", "tBodyAcc-mean0-Y", "tBodyAcc-mean0-Z", "tBodyAcc-std0-X", "tbodyAcc-std0-Y", "tBodyAcc-std0-Z")

print("Merged test and train dataframes and assigned column names")

# Extract only the measurements on the mean and standard deviation
# for each measurement.
#HARdf0 <- HARdf
HARdf <- HARdf[,1:8]
#print(dim(HARdf))
print("Extracted mean and std of each measurement")

# Name the activities in the data set with descriptive activity names. Exchange
# the numeric activity labels for character labels.
#HARdf0 <- HARdf
for(i in 1:dim(actlabels)[1]){
  HARdf[HARdf$Activity == i,2] <- actlabels[i,2]
}
#HARdf0 <- HARdf

# Set subject IDs to numeric class and order by asc.
HARdf[,1] <- as.numeric(HARdf[,1])
HARdf <- HARdf[order(HARdf$SubjectID),]
#HARdf0 <- HARdf
#print(HARdf[c(1,1000,7000),])
#print(unique(HARdf[,1]))
#print(mean(HARdf[,3]))
print("Updated activities with appropriate labels")

# Create a second tidy data set with the average of each variable
# for each activity and each subject. IOW, condense the tidy dataset to
# an average of each mean and std for each subject and activity. Thus, for each 
# subject, there will be 1 set (3 means for xyz, 3 stds for xyz) per activity.
# 30 subjects will have 6 activities and 6 measurements per activity -- which 
# should reduce to 180 rows and 8 columns.
HARsummary <- data.frame(matrix(nrow = 180, ncol = 8))
names(HARsummary) <- c("SubjectID", "Activity", "tBodyAcc-mean0-X", "tBodyAcc-mean0-Y", "tBodyAcc-mean0-Z", "tBodyAcc-std0-X", "tbodyAcc-std0-Y", "tBodyAcc-std0-Z")
subjectIDs <- unique(HARdf[,1])
#print(class(subjectIDs))
#print(class(HARdf[,2]))
#print(class(actlabels[,2]))
#print(length(subjectIDs))
id <- 1
act <- 1
for(i in 1:180){
  if(act == 7){
    act <- 1
    id <- id + 1
  }
  HARsummary[i,1] <- subjectIDs[id]
  HARsummary[i,2] <- actlabels[act,2]
  #print(subjectIDs[id])
  #print(actlabels[act,2])
  #print(actlabels[act,2])
  #print(act)
  subsetlogic <- HARdf$SubjectID == subjectIDs[id] & HARdf$Activity == actlabels[act,2]
  #print(sum(HARdf[,2] == actlabels[act,2]))
  #print(head(HARdf[,2]))
  for(j in 3:8){
    #print(class(j))
    #if(j == 3){
    #  print(sum(HARdf[subsetlogic,j]))
    #}
    HARsummary[i,j] <- round(mean(HARdf[subsetlogic, j]), 6)
    #print(HARdf[subsetlogic,j])
    #print(mean(HARdf[subsetlogic, j]))
  }
  if(act <= 6){
    act <- act + 1
  }
}
#print(actlabels)
#print(head(HARdf[,2]))
#print(head(HARdf, 5))
#print(head(HARdf0, 5))

# Save the dataset as a .txt file using write.table() using row.name = FALSE
# and upload it in the assignment submission.
write.table(HARsummary, paste(wd, "HARdataset.txt", sep="/"), row.name = FALSE)
