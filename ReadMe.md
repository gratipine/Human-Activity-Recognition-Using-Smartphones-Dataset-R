#Human Activity Recognition Using Smartphones Tidy Dataset
##Version 1.0
##ReadMe.md


The script takes an untidy dataset and turns it into a tidy one.

###The files included in the dataset are:
- run_analysis.R - the tranformational script
- cleanData.txt - the tidy data set


###run_analysis.R:
####Script for transforming an untidy dataset into a tidy one
####Data represents measurements of people wearing a Samsung phone while doing various activities

'Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of
each variable for each activity and each subject.'

####Load training and test sets

xtest<-read.table("X_test.txt")
ytest<-read.table("y_test.txt")
subtest<-read.table("subject_test.txt")

xtrain<-read.table("X_train.txt")
ytrain<-read.table("y_train.txt")
subtrain<-read.table("subject_train.txt")

####Load names of activities and measurements
dataNames<-read.table("features.txt")
activityNames<-read.table("activity_labels.txt", stringsAsFactors = FALSE)

####will simply merge without leaving a trace of which measurement came from which dataset (train or test)
results<-rbind.data.frame(xtest,xtrain)
resultsY<-rbind(ytest,ytrain)
resultssub<-rbind(subtest,subtrain)

####removes no longer necessary variables from the environment
rm("xtest", "xtrain", "ytest", "ytrain", "subtest","subtrain")

####Extracts only the measurements on the mean and standard deviation for each measurement.
temp<-results[,grepl("mean|std|Activity|Subject", names(results))]

rm("results")
rm("resultssub")
rm("resultsY")

####Renaming the activities
for(i in 1:nrow(activityNames))
{
  temp$Activity[temp$Activity==i]<-activityNames$V2[i]
}

rm("i")

####Fixing names of the measurements
names(temp)<-gsub("^t", "time", names(temp))
names(temp)<-gsub("^f", "frequency", names(temp))
names(temp)<-gsub("Acc", "Accelerometer", names(temp))
names(temp)<-gsub("Gyro", "Gyroscope", names(temp))
names(temp)<-gsub("Mag", "Magnitude", names(temp))
names(temp)<-gsub("BodyBody", "Body", names(temp))
names(temp)<-gsub("Freq", "Frequency", names(temp))


####Creating the final dataset and writing it
require(plyr)
final<-ddply(temp, ~Activity + Subject, numcolwise(mean))
'think about replacing with 
dtf <- data.frame(age=rchisq(100000,10),group=factor(sample(1:10,100000,rep=T)))
dt <- data.table(dtf)
dt[,list(mean=mean(age),sd=sd(age)),by=group]
for speed reasons'

write.table(final, "cleanData.txt", sep = "\t")

rm("final", "activityNames", "temp")



