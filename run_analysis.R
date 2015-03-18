dataFolder <- tail(commandArgs(), 1)

#1 Merge the training and the test sets to create one data set
trainData <- read.table(file.path(dataFolder, 'train/X_train.txt'),
  colClasses = c('numeric'))

testData <- read.table(file.path(dataFolder, 'test/X_test.txt'),
  colClasses = c('numeric'))

data <- rbind(trainData, testData)

#2 Extract only the measurements on the mean and standard deviation for each measurement
features <- read.table(file.path(dataFolder, 'features.txt'),
  col.names        = c('order', 'name'),
  colClasses       = c('integer', 'character'))

featureNames <- features[order(features$order),]$name
meanAndStdFeatures <- grep("(mean|std)\\(\\)", featureNames)

featureNames <- featureNames[meanAndStdFeatures]
data <- data[, meanAndStdFeatures]

#3 Use descriptive activity names to name the activities in the data set
loadActivities <- function(file, labels) {
  activities <- read.table(file,
    col.names  = c('id'),
    colClasses = c('integer'))

  activities$order <- seq(nrow(activities))
  activities <- merge(activities, labels, sort = FALSE)
  activities[order(activities$order), ]
}

activityLabels <- read.table(file.path(dataFolder, 'activity_labels.txt'),
  col.names  = c('id', 'name'),
  colClasses = c('integer', 'character'))

trainActivities <- loadActivities(file.path(dataFolder, 'train/y_train.txt'), activityLabels)
testActivities  <- loadActivities(file.path(dataFolder, 'test/y_test.txt'),   activityLabels)

activities <- rbind(trainActivities, testActivities)$name

#4 Appropriately label the data set with descriptive variable names
names(data)[1:length(featureNames)] <- featureNames

#5 Create a tidy data set with the average of each variable for each activity and each subject
loadSubjects <- function(file) {
  read.table(file,
    col.names  = c('id'),
    colClasses = c('integer'))
}

trainSubjects <- loadSubjects(file.path(dataFolder, 'train/subject_train.txt'))
testSubjects  <- loadSubjects(file.path(dataFolder, 'test/subject_test.txt'))
subjects <- rbind(trainSubjects, testSubjects)$id

tidyData <- aggregate(data, list(activity = activities, subject = subjects), mean)

# Store the result
write.table(tidyData, 'tidy_data.txt', row.name = FALSE)
