## set the working directory to the current user profile/home directory
setwd("~")

## download the file from the below link
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "Data.zip")

## Extract the files
unzip("data.zip")

## Read activity ladel table and set the column name
activity_label_table <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Initialize the activity variable
activity_labels <- activity_label_table[,2]

## Read features variable table and set the column name
features_table <- read.table("./UCI HAR Dataset/features.txt")

## Initialize the features variable
features <- features_table[,2]

## Extract the measurements label on the mean and standard deviation for each measurement
## and store it in a logical vector
extract_features <- grepl("mean|std", features)

## Load X_test, y_test data and subject_test variables
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Set the column name for X_test
names(X_test) <- features

## Keep only the std and mean column variables
X_test <- X_test[,extract_features]

## Load activity labels
y_test[,2] <- activity_labels[y_test[,1]]
names(y_test) <- c("activityid", "activitylabel")
names(subject_test) <- "subject"

## Bind test data

test_data <- cbind(subject_test, y_test, X_test)


## Load X_train, y_train data and subject_train variables
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Set the column name for X_train
names(X_train) <- features

## Keep only the std and mean column variables
X_train <- X_train[,extract_features]

## Load activity labels
y_train[,2] <- activity_labels[y_train[,1]]
names(y_train) <- c("activityid", "activitylabel")
names(subject_train) <- "subject"

## Bind train data

train_data <- cbind(subject_train, y_train, X_train)

## convert columns into rows
id_labels   <- c("subject", "activityid", "activitylabel")
data_labels <- setdiff(colnames(data), id_labels)
melt_data   <- melt(data, id = id_labels, measure.vars = data_labels)

## apply mean and cast it back to columns
tidy_data   <- dcast(melt_data, subject + activitylabel ~ variable, mean)

## write tidy_data into a output file
write.table(tidy_data, file = "tidy_data.txt")

