---
title: "README"
author: "Antgu"
date: "Sunday, February 22, 2015"
output: html_document
---
Scripts:
============
1. run_analysis.R

run_analysis reads the following files:
#activity_labels.txt
#features.txt
#y_train.txt
#X_train.txt
#subject_train.txt
#y_test.txt
#X_test.txt
#subject_test.txt

The script then merges the training and test data sets, adds descriptive variable names from features.txt and adds information about about subject and activity from the those files. It then removes all measures other than mean values and standard deviations. Finally it summarizes the data by keeping one row for each subject and activity with the average values of the mean and standard deviation measures for those specific subjects and activites.As long as the files listed are in your working directory, all you have to do is to run the script. The output will be stored in a txt-file named "activityDataTidy.txt".