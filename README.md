# Getting and Cleaning Data
Course project for the [Coursera Getting and Cleaning Data course](https://www.coursera.org/course/getdata).  

The project consists of the script in `run_analysis.R`, a code book and this readme, which describes how to use the script.
* Before running the script, you have to [download the data](https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI+HAR+Dataset.zip) and unzip it.
* Run the script by executing `Rscript run_analysis.R /path/to/data`.
(Don't forget to specify the correct path to the folder where you unzipped the data).

* The script does the following:
  1. Merges the training and the test sets to create one data set
  2. Extracts only the measurements on the mean and standard deviation for each measurement
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

The file `run_analysis.R` contains comments, which indicate each of the above steps.
* When the script completes, the file `tidy_data.txt` in the current folder will contain the tidy data.
