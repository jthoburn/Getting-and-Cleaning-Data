library(dplyr)
library(tidyr)

# Create a vector of features using the features.txt file
features <- read.csv("features.txt", sep = "", header = FALSE, col.names = c("code", "feature"))[, c("feature")]

# Create a data frame of activities using the activity label file
activities <- read.csv("activity_labels.txt", sep = "", header = FALSE, col.names = c("code", "activity"))

# Read in the train data 
train <- read.csv("X_train.txt", sep = "", header = FALSE, col.names = features)

# Read in train activity code and merge it with the  activities data frame 
train_activities <- read.csv("y_train.txt", sep = "", header = FALSE, col.names = c("code"))
train_activities <- merge(activities, train_activities, by = c("code"))

# Read in train subjects 
train_subjects <- read.csv("subject_train.txt", sep = "", header = FALSE, col.names = c("subject"))

# Remove those columns that are not means or standard deviation
train <- train[, grepl("mean|std", names(train), ignore.case = TRUE)]

# Bind the train subjects and activities to the train features
train <- cbind(subject = train_subjects[,c("subject")], activity = train_activities[,c("activity")], 
        train)

# Read in the test data 
test <- read.csv("X_test.txt", sep = "", header = FALSE, col.names = features)

# Read in test activity code and merge it with the activities data frame 
test_activities <- read.csv("y_test.txt", sep = "", header = FALSE, col.names = c("code"))
test_activities <- merge(activities, test_activities, by = c("code"))

# Read in train subjects 
test_subjects <- read.csv("subject_test.txt", sep = "", header = FALSE, col.names = c("subject"))

# Remove those columns that are not means or standard deviation
test <- test[, grepl("mean|std", names(test), ignore.case = TRUE)]

# Bind the train activities to the train features
test <- cbind(subject = test_subjects[,c("subject")], activity = test_activities[,c("activity")], 
        test)

# Combine the train and test data sets
total <- rbind(train, test)

# Create a tidy data set of means for each feature grouped subject and activity
tidy <- total %>% group_by(subject, activity) %>% summarise_each(funs(mean))
