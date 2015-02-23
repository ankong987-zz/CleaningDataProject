## Introduction

This assignment uses data from http://archive.ics.uci.edu/ where it focuses on data of wearable technology


## Code

The code when executed will chose the required packages; data.table and reshape2. 

From there it will read in the data from the UCI HAR Dataset, it will read the activity, features, subject, X_test, Y_test, X_train and Y_train dataset as tables into R. 

After it will extract the mean and standard deviation from the features and apply it to the X_test dataset. This is also applied to the X_train dataset as well. 

After that the names for the X_test are pulled from features dataset and assigned as header for the X_test.

Y_test and Y_train names are assigned the headers 'Activity_ID' and 'Activity_Label' while the subject is given the header of 'subject'

After that the data is 