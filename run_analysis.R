library(dplyr)
library(stringr)
setwd("~/Getting and Cleaning Data/CourseProject/test")
xtest <- read.table("x_test.txt")
ytest <- read.table("y_test.txt")
subtst <- read.table("subject_test.txt")
setwd("~/Getting and Cleaning Data/CourseProject/train")
xtrain <- read.table("x_train.txt")
ytrain <- read.table("y_train.txt")
subtrn <- read.table("subject_train.txt")
setwd("~/Getting and Cleaning Data/CourseProject")
features <- read.table("features.txt")
actlbl <- read.table("activity_labels.txt")
x <- rbind(xtest, xtrain)
y <- rbind(ytest, ytrain)
sub <- rbind(subtst, subtrn)
features <- select(features, V2)
actlbl <- select(actlbl, V2)
features <- gsub("()-", "-", features$V2, fixed = T)
feat <- grep("mean|std", features, fixed = F)
x <- x[,feat]
features <- features[feat]
names(x) <- features
xysub <- cbind(sub, y, x)
names(xysub) <- c("Subject", "Activity_Label", features)
lblnames <- as.character(actlbl$V2)
for(i in 1:6) {
  xysub$Activity_Label[xysub$Activity_Label == i] <- lblnames[i]
}
xysub <- group_by(xysub, Subject, Activity_Label)
tld <- summarise_each(xysub,funs(mean))
names(tld) <- ifelse(names(tld)%in%c("Subject", "Activity_Label"), str_c('', names(tld)), str_c('Avg-', names(tld)))
write.table(tld, file = "Tidy_Long_Data.txt", row.name = F)





