# Getting-and-Cleaning-Data-Course-Project

Synopsis

The R script, run_analysis.R loads the data provided by Human Activity Recognition Using Smartphones Dataset (Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto) and  prepare a tidy data set following the principles of tidy data presented in Getting and Cleaning Data class by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD with Coursera and Johns Hopkins Bloomberg School of Public Health.

Prescription

Running R version 3.1.2 (RStudio Version 0.98.1091), with working directory set as UCI HAR Dataset folder (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) run the script contained in run_analysis.R.

The script first loads the training data (subject, X, and Y) with read.table. The training data is combined via cbind. Test data is then loaded and combined with read.table and cbind. Traning and Test data tables are then concatenated with rbind to form combined_data. Column names are corrected to equal those provided in features.txt with the first column (Subject Data) = “Subject” and the final column (Y Data) = “Activity”. Using grep, the columns which do not pertai to subject, activity, mean, or std (here those which do not contain “Subject”, “mean()”, “std()”, or “Activity”) are removed to form keeper_data. Activity integers 1-6 are replaced with the corresponding activity label from activity_labels.txt. tidy_data = null is created. Mean value of all columns in keeper data for each subject on each activity type is computed and appended to the tidy data. Tidy data wrote to txt file tab delimited with row.names = FALSE.
