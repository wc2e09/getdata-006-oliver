
#_____1.Merges the training and the test sets to create one data set.

### basic information loaded
activity_labels=read.csv("./data/UCI HAR Dataset/activity_labels.txt",header=F,sep=" ")
names(activity_labels)=gsub("V1","activity_label",names(activity_labels))
names(activity_labels)=gsub("V2","activity_name",names(activity_labels))

#features_info=read.csv("./data/UCI HAR Dataset/activity_labels.txt",header=F,sep=" ")
features=read.csv("./data/UCI HAR Dataset/features.txt",header=F,sep=" ")
names(features)=gsub("V1","feature_label",names(features))
names(features)=gsub("V2","variable",names(features))
features$features_label=paste0("V",features$features_label)


### tidy test dataset
subject_test=read.csv("./data/UCI HAR Dataset/test/subject_test.txt",header=F,sep=" ")
names(subject_test)=gsub("V1","subject_id",names(subject_test))

x=read.fwf("./data/UCI HAR Dataset/test/X_test.txt",widths=seq(from=16,to=16,length.out=561),fill=T,sep="\n")
temp=matrix(x$V1,nrow=(length(x$V1)/561),ncol=561)
x_test=data.frame(temp)
names(x_test)=gsub("X","V",names(x_test))
y_test=read.csv("./data/UCI HAR Dataset/test/y_test.txt",header=F,sep=" ")
names(y_test)=gsub("V1","activity_label",names(y_test))

dataset_test=cbind(x_test,activity_label=y_test,subject_id=subject_test)
dataset_test$data_type="test"


### tiny train dataset
subject_train=read.csv("./data/UCI HAR Dataset/train/subject_train.txt",header=F,sep=" ")
names(subject_train)=gsub("V1","subject_id",names(subject_train))

x=read.fwf("./data/UCI HAR Dataset/train/X_train.txt",widths=seq(from=16,to=16,length.out=561),fill=T,sep="\n")
temp=matrix(x$V1,nrow=(length(x$V1)/561),ncol=561)
x_train=data.frame(temp)
names(x_train)=gsub("X","V",names(x_train))
y_train=read.csv("./data/UCI HAR Dataset/train/y_train.txt",header=F,sep=" ")
names(y_train)=gsub("V1","activity_label",names(y_train))

dataset_train=cbind(x_train,activity_label=y_train,subject_id=subject_train)
dataset_train$data_type="train"

dataset=rbind(dataset_test,dataset_train)

#_____2.Extracts only the measurements on the mean and standard deviation for each measurement. 

# Find out mean of variable (V1)
mean_v1=features[grepl("mean",tolower(features$V2)),"V1"]
mean_v1=paste0("V",mean_v1)
# Find out standard of variable (V1)
std_v1=features[grepl("std",tolower(features$V2)),"V1"]
std_v1=paste0("V",std_v1)

dataset[,which(names(dataset) %in% mean_v1)]
dataset[,which(names(dataset) %in% std_v1)]


#_____3.Uses descriptive activity names to name the activities in the data set

dataset=merge(dataset,activity_labels,by.x="activity_label",by.y="activity_label",all=F)

# check out the answer
dataset



#_____4.Appropriately labels the data set with descriptive variable names. 

for( i in 1:561 ){  
    label(dataset[,features[i,1]])=features[i,2]
}

# check out the answer
for( i in 1:561 ){  
	print(
	,paste0("V",i)]))
}



#_____5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

xvar=paste0("V",c(1:561))  
avg_var_sum=matrix(0,nrow=30,ncol=6)
dataset_avg=vector("list",561)  

for( k in 1:561 ){
	for( i in 1:30 ){    # activity_label, 1st dimension
    	for( j in 1:6 ){    # subject_id, 2nd dimension
        	avg_var_sum[i,j] = sum(dataset[dataset$subject_id==i & dataset$activity_label==j,xvar[k]])/avg_var_count[i,j] 
    	}
	}
	dataset_avg[[k]]=avg_var_sum  # variable #1~#561, 3rd dimension
}

# check out the answer
label(dataset_avg)





