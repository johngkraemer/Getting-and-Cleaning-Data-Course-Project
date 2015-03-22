#Read in training data
subject_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

#Combine training data subjects, x, and y data
train_data <- cbind(subject_train, x_train, y_train)

#Read in test data
subject_test <- read.table("test/subject_test.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")

#Combine test data subjects, x, and y data
test_data <- cbind(subject_test, x_test, y_test)

#Combine train and test data
combined_data <- rbind(train_data, test_data)

#Name columns based on features.txt
features <- read.table("features.txt")
features2 <- as.character(features[,2])
column_names <- c("Subject", features2, "Activity")
colnames(combined_data) <- column_names

#Sort data based on Subject and then Activity
combined_data[with(combined_data, order("Subject","Activity"))]

#Remove data not pertaining to mean, std, subject or activity
keepers <- c(grep("Subject", column_names), grep("mean()", column_names), grep("std()", column_names), grep("Activity", column_names))
keeper_data <- combined_data[,keepers]

#Change Activity numeric values to activity name
activity_names <- read.table("activity_labels.txt")
activity_labels <- as.character(activity_names[,2])
#Append activity name to activities vector by looping over the activity label values of the data
activities <- {}
for (i in keeper_data[,81]){
      if (i == 1){
              activities <- c(activities, activity_labels[1])
      }
      else if (i == 2){
              activities <- c(activities, activity_labels[2])
      }
      else if (i == 3){
              activities <- c(activities, activity_labels[3])
      }
      else if (i == 4){
              activities <- c(activities, activity_labels[4])
      }
      else if (i == 5){
              activities <- c(activities, activity_labels[5])
      }
      else if (i == 6){
              activities <- c(activities, activity_labels[6])
      }
}
# Replace the activity label numeric data with activity labels
keeper_data[,81] <- activities

# Set tiny_data equal to null
tidy_data<- {}

# Loop over data table. Subset by subject and activity. Take mean of each variabl for
# each variable within each subset. Append mean to tidy data
for(i in 1:30){
        subjectnum <- i
        for(h in activity_names[,2]){
                oneone <- keeper_data[ which (keeper_data$Subject == subjectnum & keeper_data$Activity == h),]
                oneone2 <- colMeans(oneone[,2:80])
                oneone3 <- c(oneone[1,1], oneone2, oneone[1,81])
                tidy_data <- rbind(tidy_data, oneone3)
        }
}

# Correct column name
colnames(tidy_data)[1] <- "Subject"
colnames(tidy_data)[81] <- "Activity"

# Write tidy_data to .txt file as tab separated value data.
write.table(tidy_data, "tidy_data.txt", sep="\t", row.names=FALSE)
