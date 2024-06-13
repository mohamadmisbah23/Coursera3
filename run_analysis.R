# Load necessary libraries
library(dplyr)
library(tidyr)

# Load the datasets
features <- read.table("features.txt", col.names = c("index", "feature"))
activities <- read.table("activity_labels.txt", col.names = c("activityId", "activityName"))

subject_train <- read.table("train/subject_train.txt", col.names = "subject")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt", col.names = "activityId")

subject_test <- read.table("test/subject_test.txt", col.names = "subject")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt", col.names = "activityId")

# Merge training and test datasets
subject <- rbind(subject_train, subject_test)
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)

# Combine all data into one dataset
merged_data <- cbind(subject, y_data, x_data)

# Get the indices of the features that are mean or standard deviation
mean_std_features <- grep("-(mean|std)\\(\\)", features$feature)

# Extract the relevant columns
x_data_mean_std <- x_data[, mean_std_features]

# Adjust the column names to be descriptive
names(x_data_mean_std) <- features[mean_std_features, 2]
names(x_data_mean_std) <- gsub("\\()", "", names(x_data_mean_std))
names(x_data_mean_std) <- gsub("^t", "Time", names(x_data_mean_std))
names(x_data_mean_std) <- gsub("^f", "Frequency", names(x_data_mean_std))
names(x_data_mean_std) <- gsub("-mean", "Mean", names(x_data_mean_std))
names(x_data_mean_std) <- gsub("-std", "Std", names(x_data_mean_std))
names(x_data_mean_std) <- gsub("-", "", names(x_data_mean_std))

# Use descriptive activity names to name the activities in the data set
merged_data$activityId <- factor(merged_data$activityId, levels = activities$activityId, labels = activities$activityName)

# Combine the datasets
final_data <- cbind(subject, merged_data$activityId, x_data_mean_std)
names(final_data)[2] <- "activity"

# Appropriately label the data set with descriptive variable names
names(final_data) <- make.names(names(final_data), unique = TRUE)

# Create the tidy dataset with the average of each variable for each activity and each subject
tidy_data <- final_data %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean = mean))

# Write the tidy dataset to a file
write.table(tidy_data, "tidy_data.txt", row.name = FALSE)
