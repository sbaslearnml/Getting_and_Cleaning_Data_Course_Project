---
title: "Codebook.md"
author: "Baskar Swaminathan"
date: "12/13/2016"
output: github_document
---

This code book  describes the variables, the data, and any transformations or work that was performed to clean up the data (link given below)

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Files avialable and used in this operation are \n

``` activity and feature lists ```

* .\\UCI HAR Dataset\\activity_labels.txt 
    - Links the class labels with their activity name 

* .\\UCI HAR Dataset\\features.txt
    - List of all features

``` test data ```

* .\\UCI HAR Dataset\\test\\subject_test.txt  
    - Test subjects

* .\\UCI HAR Dataset\\test\\X_test.txt
    - test data set

* .\\UCI HAR Dataset\\test\\y_test.txt
    - Test labels

``` train data ```

* .\\UCI HAR Dataset\\test\\subject_train.txt
    - Training subjects

* .\\UCI HAR Dataset\\test\\X_train.txt
    - Training data set

* .\\UCI HAR Dataset\\test\\y_train.txt\
    - Training labels


## The below tables will be creted after running run_analysis.R 
## Data Tables

* activity_label_tables (data table) 
    - Loaded activity_labels.txt

* features_table
    - Loaded features.txt
    
* X_test (data table)
    - Loaded X_test.txt
    
* y_test (data table)
    - Loaded y_test.txt

* X_train (data table)
    - Loaded X_train.txt
    
* y_train (data table)
    - Loaded y_train.txt
    
* tidy_data
    - data set created by running the run_analysis.R. 
    - This contains 180 observation and 81 variables
    - variable 'subject' - subject id (possible values - 1 to 30)
    - variable 'activity lable'- activity lable (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)
    - rest of the variables 

        These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

        tBodyAcc-XYZ

        tGravityAcc-XYZ
        
        tBodyAccJerk-XYZ

        tBodyGyro-XYZ

        tBodyGyroJerk-XYZ

        tBodyAccMag

        tGravityAccMag

        tBodyAccJerkMag

        tBodyGyroMag

        tBodyGyroJerkMag

        fBodyAcc-XYZ

        fBodyAccJerk-XYZ

        fBodyGyro-XYZ

        fBodyAccMag

        fBodyAccJerkMag

        fBodyGyroMag

        fBodyGyroJerkMag

    The set of variables that were estimated from these signals are: 

        mean(): Mean value

        std(): Standard deviation

        mad(): Median absolute deviation 

        max(): Largest value in array

        min(): Smallest value in array

        sma(): Signal magnitude area

        energy(): Energy measure. Sum of the squares divided by the number of values. 

        iqr(): Interquartile range 

        entropy(): Signal entropy

        arCoeff(): Autorregresion coefficients with Burg order equal to 4

        correlation(): correlation coefficient between two signals

        maxInds(): index of the frequency component with largest magnitude

        meanFreq(): Weighted average of the frequency components to obtain a mean frequency

        skewness(): skewness of the frequency domain signal 

        kurtosis(): kurtosis of the frequency domain signal 

        bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

        angle(): Angle between to vectors.

## Script
* run_analysis.R
    - run_analysis.R does the following
        
        -- Merges the training and the test sets to create one data set
        
        -- Extracts only the measurements on the mean and standard deviation for each measurement
        
        -- Uses descriptive activity names to name the activities in the data set
        
        -- Appropriately labels the data set with descriptive variable names
        
        -- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
        

## Vector

* activity_labels
    - List of activies stored in this vector
* features
    - List of features / variable
