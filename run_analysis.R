
# Set the working directory to the main project data folder

setwd("~/Rstudio WD/getdata_projectfiles_UCI HAR Dataset")


# Read the activity labels and the features tables into the memory

activity_labels <- read.table("activity_labels.txt", stringsAsFactors = F)
features.tb <- read.table("features.txt", stringsAsFactors = F)


# Read the train and test datasets into the memory

setwd("~/Rstudio WD/getdata_projectfiles_UCI HAR Dataset/test") #directory for test

#Read the dataset all the while combining the descriptive variable name
x_test <- read.table("X_test.txt", stringsAsFactors = F)
y_test <- read.table("Y_test.txt", stringsAsFactors = F)
subject_test <- read.table("subject_test.txt", stringsAsFactors = F)

setwd("~/Rstudio WD/getdata_projectfiles_UCI HAR Dataset/train") #directory for train

#Read the dataset all the while combining the descriptive variable name
x_train <- read.table("X_train.txt", stringsAsFactors = F)
y_train <- read.table("Y_train.txt", stringsAsFactors = F)
subject_train <- read.table("subject_train.txt", stringsAsFactors = F)


# Merges the training and the test sets to create one data set.
combined_ds <- rbind(x_test, x_train)


# Appropriately labels the data set with descriptive variable names.
features.tb$V2 <- gsub("-mean", "Mean", features.tb$V2) #Cleaning variable names
features.tb$V2 <- gsub("-std", "Std", features.tb$V2)   
features.tb$V2 <- gsub("[-()]", "", features.tb$V2)     
names(combined_ds) <- features.tb$V2


# Extracts only the measurements on the mean and standard deviation for each measurement.
mean_columns <- grep("Mean", features.tb$V2)
std_columns <- grep("Std", features.tb$V2)
combined_ds <- combined_ds[,c(mean_columns, std_columns)]

# Uses descriptive activity names to name the activities in the data set
y_combined <- rbind(y_test, y_train)
for (i in 1:6) {
        y_combined$V1 <- gsub(i, activity_labels[i,2], y_combined$V1)
}
combined_ds <- cbind(y_combined, combined_ds)
names(combined_ds)[1] <- "activity"


# Add the subject number to the table
subject <- rbind(subject_test, subject_train)
combined_ds <- cbind(subject, combined_ds)
names(combined_ds)[1] <- "subject"


#  creates a second, independent tidy data set with the average of each variable for each activity and each subject.
combined_ds <- aggregate(combined_ds, list(combined_ds$activity, combined_ds$subject), FUN = mean)
combined_ds$activity <- combined_ds[,1]
combined_ds <- combined_ds[, 3:90]


# Write the table into a txt file
write.table(combined_ds, "tidy.txt")
