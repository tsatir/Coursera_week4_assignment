# Code Book
run_analysis.R scripts reads the Samsung data from working directory and applys assignment's requirements. 
1. Read files from working directory and named according to "read.me" file in the Samsung Data file.

-features = 561 rows, 2 columns 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

-activity_labels = 6 rows, 2 columns
Contains activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) which is performed and a code that specifies the activity.

-x_test = 2947 rows, 561 columns
Contains features of the %30 subjects' data which is chosen by randomly.
-y_test = 2947 rows, 1 column
Contains test data of activities' code.
-x_train = 7352 rows, 561 column
Contains features of the %70 subjects' data which is chosen by randomly.
-y_train = 7352 rows, 1 column
Contains train data of activities' code.
-test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
Contains subjects' code of the %30 data.
-train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
Contains subjects' code of the %70 data.

X_testtrain = 10299 rows, 88 columns
-Merged x_train and x_test data which is formed by rbind
Y_testtrain_act = 10299 rows, 1 column
-Merged y_train and y_test data which is formed by rbind
subjects <- 10299 rows, 1 column
-Merged train_subject and test_subject data which is formed by rbind
data_all <- 10299 rows, 563 columns
-Merged data of X_testtrain,Y_testtrain and subjects data which is formed by cbind

2. 
-Pattern is defined by using regular expressions.It contains mean, std, subjects column and class_names column.
-X contains 10299 rows and 88 columns. It is created by using pattern defined above with grep.

3.
-X1 is formed by merging with x dataset and activity labels. Activity code's merged with definitions.

4.
-Abbrevetions replaced by descriptive variables names.

5.
-X3 a new tidy data is created with the average of each variable for each activity and each subject in x1.
