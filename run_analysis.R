require(dplyr)

# read data
subject_test<-read.csv(".\\UCI HAR Dataset\\test\\subject_test.txt",header = FALSE,sep="")
subject_train<-read.csv(".\\UCI HAR Dataset\\train\\subject_train.txt",header = FALSE,sep="")
colnames(subject_test)<-"subject.no"
colnames(subject_train)<-"subject.no"
X_test<-read.csv(".\\UCI HAR Dataset\\test\\X_test.txt",header = FALSE,sep="")
X_train<-read.csv(".\\UCI HAR Dataset\\train\\X_train.txt",header = FALSE,sep="")
y_test<-read.csv(".\\UCI HAR Dataset\\test\\y_test.txt",header = FALSE,sep="")
y_train<-read.csv(".\\UCI HAR Dataset\\train\\y_train.txt",header = FALSE,sep="")
colnames(y_test)<-c("activity.no")
colnames(y_train)<-c("activity.no")
features<-read.csv(".\\UCI HAR Dataset\\features.txt",header = FALSE,sep="")
colnames(X_test)<-as.vector(t(features[,2]))
colnames(X_train)<-as.vector(t(features[,2]))
activity.names<-read.csv(".\\UCI HAR Dataset\\activity_labels.txt",header = FALSE,sep="")
colnames(activity.names)<-c("activity.no","activity")

# find number of columns for features with mean and std expression in name
features.tosave<-rbind(features[grep("-mean\\(\\)",features[,2]),],features[grep("-std",features[,2]),])

# save only mean and std columns
X_test.limited<-X_test[,as.vector(t(features.tosave[,2]))]
X_train.limited<-X_train[,as.vector(t(features.tosave[,2]))]

# join activity name with activity No. in test and train
activity.test<-merge(activity.names,y_test,by ="activity.no" ,all.y=TRUE)
activity.train<-merge(activity.names,y_train,by ="activity.no" ,all.y=TRUE)
#bind data
test.data<-cbind(subject_test,activity.test,X_test.limited)
train.data<-cbind(subject_train,activity.train,X_train.limited)

# bind row all togehter
data<-rbind(test.data,train.data)
# rewrite column names
header<-colnames(data)
header<-gsub("-",".",header)
header<-gsub("std","StandardDeviation",header)
header<-gsub("\\(\\)","",header)
header<-gsub("BodyBody","Body",header)
header<-gsub("tBody","time.Body.",header)
header<-gsub("fBody","frequency.Body.",header)
header<-gsub("tGravity","time.Gravity.",header)
data2<-data
colnames(data2)<-header
data3<-select(data2,-activity.no)

#group results and summarise
data4<-
data3 %>%
    group_by(subject.no,activity) %>% 
        summarise_each(funs(mean))

#write results to file
write.table(data4,file = "./UciHar.txt",sep = ",",row.names=FALSE)
