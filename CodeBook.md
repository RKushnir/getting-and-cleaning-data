# Code Book
## Variables

Variable name               | Description
----------------------------|------------
activity                    | Activity name
subject                     | Id of the subject, from 1 to 30
tBodyAcc-mean()-X           | Time domain body acceleration mean along X
tBodyAcc-mean()-Y           | Time domain body acceleration mean along Y
tBodyAcc-mean()-Z           | Time domain body acceleration mean along Z
tBodyAcc-std()-X            | Time domain body acceleration standard deviation along X
tBodyAcc-std()-Y            | Time domain body acceleration standard deviation along Y
tBodyAcc-std()-Z            | Time domain body acceleration standard deviation along Z
tGravityAcc-mean()-X        | Time domain gravity acceleration mean along X
tGravityAcc-mean()-Y        | Time domain gravity acceleration mean along Y
tGravityAcc-mean()-Z        | Time domain gravity acceleration mean along Z
tGravityAcc-std()-X         | Time domain gravity acceleration standard deviation along X
tGravityAcc-std()-Y         | Time domain gravity acceleration standard deviation along Y
tGravityAcc-std()-Z         | Time domain gravity acceleration standard deviation along Z
tBodyAccJerk-mean()-X       | Time domain body jerk mean along X
tBodyAccJerk-mean()-Y       | Time domain body jerk mean along Y
tBodyAccJerk-mean()-Z       | Time domain body jerk mean along Z
tBodyAccJerk-std()-X        | Time domain body jerk standard deviation along X
tBodyAccJerk-std()-Y        | Time domain body jerk standard deviation along Y
tBodyAccJerk-std()-Z        | Time domain body jerk standard deviation along Z
tBodyGyro-mean()-X          | Time domain gyroscope mean along X
tBodyGyro-mean()-Y          | Time domain gyroscope mean along Y
tBodyGyro-mean()-Z          | Time domain gyroscope mean along Z
tBodyGyro-std()-X           | Time domain gyroscope standard deviation along X
tBodyGyro-std()-Y           | Time domain gyroscope standard deviation along Y
tBodyGyro-std()-Z           | Time domain gyroscope standard deviation along Z
tBodyGyroJerk-mean()-X      | Time domain gyroscope jerk mean along X
tBodyGyroJerk-mean()-Y      | Time domain gyroscope jerk mean along Y
tBodyGyroJerk-mean()-Z      | Time domain gyroscope jerk mean along Z
tBodyGyroJerk-std()-X       | Time domain gyroscope jerk standard deviation along X
tBodyGyroJerk-std()-Y       | Time domain gyroscope jerk standard deviation along Y
tBodyGyroJerk-std()-Z       | Time domain gyroscope jerk standard deviation along Z
tBodyAccMag-mean()          | Time domain body acceleration magnitude mean
tBodyAccMag-std()           | Time domain body acceleration magnitude standard deviation
tGravityAccMag-mean()       | Time domain gravity acceleration magnitude mean
tGravityAccMag-std()        | Time domain gravity acceleration magnitude standard deviation
tBodyAccJerkMag-mean()      | Time domain body jerk magnitude mean
tBodyAccJerkMag-std()       | Time domain body jerk magnitude standard deviation
tBodyGyroMag-mean()         | Time domain gyroscope magnitude mean
tBodyGyroMag-std()          | Time domain gyroscope magnitude standard deviation
tBodyGyroJerkMag-mean()     | Time domain gyroscope jerk magnitude mean
tBodyGyroJerkMag-std()      | Time domain gyroscope jerk magnitude standard deviation
fBodyAcc-mean()-X           | Frequency domain body acceleration mean along X
fBodyAcc-mean()-Y           | Frequency domain body acceleration mean along Y
fBodyAcc-mean()-Z           | Frequency domain body acceleration mean along Z
fBodyAcc-std()-X            | Frequency domain body acceleration standard deviation along X
fBodyAcc-std()-Y            | Frequency domain body acceleration standard deviation along Y
fBodyAcc-std()-Z            | Frequency domain body acceleration standard deviation along Z
fBodyAccJerk-mean()-X       | Frequency domain body jerk mean along X
fBodyAccJerk-mean()-Y       | Frequency domain body jerk mean along Y
fBodyAccJerk-mean()-Z       | Frequency domain body jerk mean along Z
fBodyAccJerk-std()-X        | Frequency domain body jerk standard deviation along X
fBodyAccJerk-std()-Y        | Frequency domain body jerk standard deviation along Y
fBodyAccJerk-std()-Z        | Frequency domain body jerk standard deviation along Z
fBodyGyro-mean()-X          | Frequency domain gyroscope mean along X
fBodyGyro-mean()-Y          | Frequency domain gyroscope mean along Y
fBodyGyro-mean()-Z          | Frequency domain gyroscope mean along Z
fBodyGyro-std()-X           | Frequency domain gyroscope standard deviation along X
fBodyGyro-std()-Y           | Frequency domain gyroscope standard deviation along Y
fBodyGyro-std()-Z           | Frequency domain gyroscope standard deviation along Z
fBodyAccMag-mean()          | Frequency domain body acceleration magnitude mean
fBodyAccMag-std()           | Frequency domain body acceleration magnitude standard deviation
fBodyBodyAccJerkMag-mean()  | Frequency domain body jerk magnitude mean
fBodyBodyAccJerkMag-std()   | Frequency domain body jerk magnitude standard deviation
fBodyBodyGyroMag-mean()     | Frequency domain gyroscope magnitude mean
fBodyBodyGyroMag-std()      | Frequency domain gyroscope magnitude standard deviation
fBodyBodyGyroJerkMag-mean() | Frequency domain gyroscope jerk magnitude mean
fBodyBodyGyroJerkMag-std()  | Frequency domain gyroscope jerk magnitude standard deviation

## Transformations
1. The script reads train and test data and unions them using `rbind`.
2. It reads the names of the features and, using a regular expression, selects only means and standard deviations(the ones with names including `mean()` and `std()`). It filters the data so only the values for the selected features are left.
3. It loads activities data and activities labels, and joins them using `merge` to get a vector of the corresponding activity names for each data row.
4. It sets the labels for the data columns.
5. It loads the subjects train and test data, and unions them using `rbind`. Then it calculates means for each of the columns, grouping by activities and subjects.
