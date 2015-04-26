
#Read in the test file
test<-read.table("X_test.txt")
#Read in the features file, which has the identity of the variables in "test"
col.heads<-read.table("features.txt")
#Assign the variables names as given in the features file. "V2" is the default column name given during import.
colnames(test)<-col.heads$V2
#Read in the activity associated with each row of "test"
activity<-read.table("y_test.txt")
test$activity<-factor(activity$V1,levels=c(1,2,3,4,5,6))
#Read in subjects
subjects<-read.table("subject_test.txt")
#Assign subject ID to each row of test data
test$SubjectID<-as.character(subjects$V1)


#Read in the training file.
train<-read.table("X_train.txt")
#Assign the variables names as given in the features file. "V2" is the default column name given during import.
colnames(train)<-col.heads$V2
#Read in the activity associated with each row of "test"
activity.train<-read.table("y_train.txt")
train$activity<-factor(activity.train$V1,levels=c(1,2,3,4,5,6))
#Read in subjects
subjects.train<-read.table("subject_train.txt")
#Assign subject ID to each row of test data
train$SubjectID<-as.character(subjects.train$V1)

#Join the "train" and "test" into a single file.
joined<-rbind(test,train)
#Create valid column names that can be selected in dplyr
valid_column_names <- make.names(names=names(joined), unique=TRUE, allow_ = TRUE)
names(joined) <- valid_column_names

#Extract only variables related to mean/SD
selected<-joined%>%
select(matches("mean|std|subject|activity"))

#Calculate means by activity, subject and place into data.frame
means<-selected%>%
  group_by(SubjectID,activity)%>%
  summarise_each(funs(mean))

#Write the table for output
tidydata<-write.table(means,file="tidydata.txt",row.names=F)
