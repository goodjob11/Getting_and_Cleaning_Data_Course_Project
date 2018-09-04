library(plyr)
library(ggplot2)


# Download the data for analysis
theUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(theUrl, destfile = "./dataset.zip")
unzip("dataset.zip")

# read data
features <- read.table("UCI HAR Dataset/features.txt")
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activity) <- c("No","activity")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
colnames(x_train) <- features[,2]
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
colnames(y_train) <- "activity"
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
colnames(x_test) <- features[,2]
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
colnames(y_test) <- "activity"
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(subject_test) <- "subject"
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(subject_train) <- "subject"


# 1. Merges the training and the test sets to create one data set.
train <- cbind(subject_train, y_train, x_train)
test <- cbind(subject_test, y_test, x_test)
merged_data <- rbind(train, test)


# 2. Extracts only the measurements on the mean and standard deviation 
#    for each measurement.
mean_sd <- merged_data[ , c(1:2, grep("-mean\\(\\)|-std\\(\\)", names(merged_data)))]


# 3. Uses descriptive activity names to name the activities in the data set
activity_name <- activity$activity
mean_sd$activity <- activity_name[mean_sd$activity]

# 4. Appropriately labels the data set with descriptive variable names.
# remove "()"
names(mean_sd) <- gsub("\\(|\\)", "", names(mean_sd), perl = TRUE)
names(mean_sd) <- gsub("^t", "TimeDomain", names(mean_sd))
names(mean_sd) <- gsub("^f", "FrequencyDomain", names(mean_sd))
names(mean_sd) <- gsub("-std-", "-StandardDeviation-", names(mean_sd))
names(mean_sd) <- gsub("Acc", "Accelerometer", names(mean_sd))
names(mean_sd) <- gsub("Gyro", "Gyroscope", names(mean_sd))
names(mean_sd) <- gsub("Mag", "Magnitude", names(mean_sd))


# 5. From the data set in step 4, creates a second, independent 
#    tidy data set with the average of each variable for each activity and each subject
tidy_data <- aggregate(. ~ subject + activity, mean_sd, mean)

