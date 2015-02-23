##Run_analysis project

require('data.table')
require('reshape2')

##Loading in data 
#only taking second column data
activity <- read.table('./UCI HAR Dataset/activity_labels.txt')[,2]
features <- read.table('./UCI HAR Dataset/features.txt')[,2]

subject <- read.table('./UCI HAR Dataset/train/subject_train.txt')

##data from the test folder
xtest <- read.table('./UCI HAR Dataset/test/X_test.txt') 
ytest <- read.table('./UCI HAR Dataset/test/Y_test.txt') 

##data from the train folder
xtrain <- read.table('./UCI HAR Dataset/train/X_train.txt') 
ytrain <- read.table('./UCI HAR Dataset/train/Y_train.txt') 

##extracting only the mean or standard deviation 
extract <- grepl('mean|std', features)
xtest = xtest[, extract]
xtrain = xtrain[,extract]


##assigning names 
names(xtest) = features
ytest[,2] = activity[ytest[,1]]
names(ytest) = c('Activity_ID', 'Activity_Label')
names(subject) = 'subject'

names(xtrain) = features
ytrain[,2] = activity[ytrain[,1]]
names(ytrain) = c('Activity_ID', 'Activity_Label')
names(subject) = 'subject'


##binding of the data
testd <- cbind(as.data.table(subject), ytest, xtest)
traind <- cbind(as.data.table(subject), ytrain, xtrain)

data = rbind(testd, traind)

idlabels = c('subject', 'Activity_ID', 'Activity_Label')
data_labels = setdiff(colnames(data), idlabels)
melt_data = melt(data, id = idlabels, measure.vars = data_labels)

tidy_data = dcast(melt_data, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = './tidy_data.txt', row.name = FALSE)


