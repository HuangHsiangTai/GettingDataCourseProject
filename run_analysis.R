library(reshape2)

analysis <- function() {
  subject.test <-read.table("UCI HAR Dataset/test/subject_test.txt")
  x.test <- read.table("UCI HAR Dataset/test/X_test.txt")
  y.test <- read.table("UCI HAR Dataset/test/y_test.txt")
  subject.train <-read.table("UCI HAR Dataset/train/subject_train.txt")
  x.train <- read.table("UCI HAR Dataset/train/X_train.txt")
  y.train <- read.table("UCI HAR Dataset/train/y_train.txt")
  subject<- rbind(subject.test, subject.train)
  x <- rbind(x.test, x.train)
  y <- rbind(y.test, y.train)
  features <- read.table("UCI HAR Dataset/features.txt")
  activity.label <- read.table("UCI HAR Dataset/activity_labels.txt")
  minor.features <- features[(grepl("mean", features$V2) | 
                                grepl("std", features$V2)),]
  small.x <- x[,minor.features$V1]
  small.x$label <- y$V1
  small.x$subject <- subject$V1
  activity.x <- merge(small.x, activity.label, by.x = "label",
                      by.y = "V1")
  drops <- c("label")
  activity.x <- activity.x[,!(colnames(activity.x) %in% drops)]
  variable.name <-c(as.character(minor.features$V2),"subject", "activity")
  colnames(activity.x) <- variable.name
  melt.data <- melt(activity.x, id= c("activity", "subject"),
                    measure.vars=as.character(minor.features$V2))
  tidy.data <- dcast(melt.data, activity + subject ~ variable, mean)
  write.table(tidy.data, file = "tidyData.txt", row.name=FALSE)
} 