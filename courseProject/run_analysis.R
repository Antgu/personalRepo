#This script requires that the following files are in your working directory: 
#activity_labels.txt
#features.txt
#y_train.txt
#X_train.txt
#subject_train.txt
#y_test.txt
#X_test.txt
#subject_test.txt

library(dplyr)

#This section loads the data 
activityLabels<-read.table("activity_labels.txt")
features<-read.table("features.txt")
yTrain<-read.table("y_train.txt")
xTrain<-read.table("X_train.txt")
subjectTrain<-read.table("subject_train.txt")
yTest<-read.table("y_test.txt")
xTest<-read.table("X_test.txt")
subjectTest<-read.table("subject_test.txt")

#This section gives descriptive names to all the variables. The variables in the feature vector is named by extracting the names from the features.txt file 
# STEP 4 finished: "Appropriately labels the data set with descriptive variable names."  
names(yTrain)<-"Activity"
names(subjectTrain)<-"Subject"
names(xTrain)<-features[,2]
names(yTest)<-"Activity"
names(subjectTest)<-"Subject"
names(xTest)<-features[,2]

#This section adds the activity and subject columns to the train/test sets
train<-cbind(xTrain,yTrain,subjectTrain)
test<-cbind(xTest,yTest,subjectTest)

#We can now merge the data by simply adding the test set to the training set (STEP 1 finished: "Merges the training and the test sets to create one data set.")
data<-rbind(train,test)

#Adding descriptive names to the activityLabels data frame
names(activityLabels)<-c("Activity","ActivityDescription")

#This section adds an activity label matching the activity id (an integer between 1-6) by performing a left join. 
#The left join is used to allow missing labels, which is controlled for in the next section.(STEP 3 finished: "Uses descriptive activity names to name the activities in the data set")
data<-left_join(data,activityLabels)

# Controlling that there are no missin labels
table(is.na(data[,"ActivityDescription"]))

#Some variables, that we are not interested in, are not unique, therefor we remove the duplicates before proceeding to use grep (this function demands uniqe column names) to extract the columns of actual interest.  
data<-data[,!duplicated(colnames(data))]

#Adding a vector containing the indexes of the columns we are interested in, i.e. mean and std measures as well as the subjects and activity labels
keep<-c(grep("mean\\(\\)",names(data)),grep("std\\(\\)",names(data)),grep("ActivityDescription",names(data)),grep("Subject",names(data)))

#Select the columns that we want to keep (STEP 2 finished: "Extracts only the measurements on the mean and standard deviation for each measurement.")
data2<-select(data,keep)

#Creating a tidy data set containing the mean of the measures  per subject and activity and then writing it to a table in a file named activityDataTidy.txt
result<-group_by(data2,ActivityDescription,Subject)%>%summarise_each(funs(mean)) 
write.table(file="activityDataTidy.txt",result, row.name=FALSE)
