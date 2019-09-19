#read everything! 

setwd("/Users/tugce/Desktop/data science")
features <- read.table("~/Desktop/data science/UCI HAR Dataset/features.txt", col.names = c("num", "features"))
activity_labels <- read.table("~/Desktop/data science/UCI HAR Dataset/activity_labels.txt", col.names = c("class_labels", "act_names"))
x_test <- read.table("~/Desktop/data science/UCI HAR Dataset/test/X_test.txt", col.names = features$features )
y_test <- read.table("~/Desktop/data science/UCI HAR Dataset/test/y_test.txt", col.names = "class_labels")
x_train <- read.table("~/Desktop/data science/UCI HAR Dataset/train/X_train.txt", col.names = features$features )
y_train <- read.table("~/Desktop/data science/UCI HAR Dataset/train/y_train.txt", col.names = "class_labels")
test_subject <- read.table("~/Desktop/data science/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
train_subject <- read.table("~/Desktop/data science/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

head(x_test)
X_testtrain <- rbind(x_train, x_test)
Y_testtrain_act <- rbind(y_train, y_test)
subjects <- rbind(train_subject,test_subject)
data_all <- cbind(subjects, Y_testtrain, X_testtrain)

#2
#Extracts only the measurements on the mean and standard deviation for each measurement.

pattern <- ("mean()|std()|subject|class_labels")
x <- data_all[grep(pattern, colnames(data_all))]

#3
#Uses descriptive activity names to name the activities in the data set

x1 <- merge(x,activity_labels, by="class_labels")

#4
#Appropriately labels the data set with descriptive variable names.

colnames(x1) <- gsub("^t",("Time"),colnames(x1))
colnames(x1) <- gsub("Acc"," Acceleration",colnames(x1))
colnames(x1) <- gsub("Mag","  Magnitude",colnames(x1))
colnames(x1) <- gsub("Gyro", " Gyroscope", colnames(x1))
colnames(x1) <- gsub(".mean", " Mean", colnames(x1))
colnames(x1) <- gsub(".std", " STD", colnames(x1))
colnames(x1) <- gsub("Freq", " Frequency", colnames(x1))
colnames(x1) <- gsub("^f", "Frequency", colnames(x1))
colnames(x1) <- gsub("[...]", " ", colnames(x1))

colnames(x1)

#5
# From the data set in step 4, creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.

x2 <- group_by(x1, subject, act_names)
x3 <- summarise_all(x2, mean)
write.table(x3, "Finalproject.txt", row.name=FALSE)

