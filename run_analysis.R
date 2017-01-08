#Script for transforming an untidy dataset into a tidy one
#Data represents measurements of people wearing a Samsung phone while doing various activities

'Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of
each variable for each activity and each subject.'

#Load training and test sets

xtest<-read.table("X_test.txt")
ytest<-read.table("y_test.txt")
subtest<-read.table("subject_test.txt")

xtrain<-read.table("X_train.txt")
ytrain<-read.table("y_train.txt")
subtrain<-read.table("subject_train.txt")

#will simply merge without leaving a trace of which measurement came from which dataset (train or test)
results<-rbind.data.frame(xtest,xtrain)
resultsY<-rbind(ytest,ytrain)
resultssub<-rbind(subtest,subtrain)

rm("xtest", "xtrain", "ytest", "ytrain", "subtest","subtrain")


#Extracts only the measurements on the mean and standard deviation for each measurement.
extractions<-data.frame(stringsAsFactors = FALSE)
for(j in 1:10299) {
  temp<-results[j,1:561]
  extractions[j,1]<-rowMeans(temp[1,])
  extractions[j,2]<-sd(temp[1,])
}
rm("j")
rm("temp")

#Renaming the activities
resultsY$V1[resultsY$V1==1]<-"Walking"
resultsY$V1[resultsY$V1==2]<-"Walking Upstairs"
resultsY$V1[resultsY$V1==3]<-"Walking Downstairs"
resultsY$V1[resultsY$V1==4]<-"Sitting"
resultsY$V1[resultsY$V1==5]<-"Standing"
resultsY$V1[resultsY$V1==6]<-"Laying"

#putting actual names on the columns in the data set
colnames(extractions)[1]<-"Means"
colnames(extractions)[2]<-"Standard_Deviations"

#Creating the final dataset
extractions$Activities<-resultsY$V1
extractions$Subject<-resultssub$V1

rm("results")
rm("resultssub")
rm("resultsY")


#http://stats.stackexchange.com/questions/8225/how-to-summarize-data-by-group-in-r
require(plyr)
final<-ddply(extractions, ~Activities +Subject, summarise,mean=mean(Means), sd=mean(Standard_Deviations))
'think about replacing with 
dtf <- data.frame(age=rchisq(100000,10),group=factor(sample(1:10,100000,rep=T)))
dt <- data.table(dtf)
dt[,list(mean=mean(age),sd=sd(age)),by=group]
for speed reasons'

#http://www.statmethods.net/input/exportingdata.html
write.table(final, "cleanData.txt", sep = "\t")

rm("extractions")
rm("final")
