#READ ME

##Additional packages required: dplyr, stringr

###The following steps, when applied sequentially, will give the user a tidy, long format dataset as demanded in the project



1. **Fetching required files in R by** *read.table()*

  1. x_test as xtest
  2. x_train as xtrain
  3. y_test as ytest
  4. y_train as ytrain
  5. subject_test as subtst
  6. subject_train as subtrn
  7. features as features
  8. activity_labels as actlbl

2. **Joining relevant data sets by** *rbind()*

  1. xtest & xtrain and store in x. 
  2. ytest & ytrain and store in y.
  3. subtst & subtrn and store in sub.

3. **Removing redundant first columns from datasets which include first column as a numeric vector from 1 to column length by** *select()*

4. **Removing all "()" present in column names in features by** *gsub()*

5. **Storing "feature" indices with strings "mean" or "std" in feat (and thereby including much debated "meanfreq" also) by** *grep(...,fixed = F)*

6. **Subsetting according to feat by** *[ ] operator*

  1. Columns of x; into x
  2. Rows of features; into features
  
7. **Setting variable names (column names) of  x from features vector obtained from above by** *names()*

8. **Joining sub, x and y (in this order) into a resulting data frame named xysub by** *cbind()*

9. **Assigning column names to xysub by** *names()*

  1. Column corresponding to sub i.e. 1st column: "Subject"
  2. Column corresponding to y i.e. 2nd column: "Activity_Label"
  3. Column corresponding to x i.e. 3rd to 81st column: features 
  
10. **Making name vector lblnames from actlbl by** *as.factor(as.character())*

11. **Replacing Activity_Label numeric entries (2nd column of xysub) with corresponding activity names from actlbl by** *for(i in 1:6) {xysub$Activity_Label[xysub$Activity_Label == i] <- lblnames[i]} *

12. **Coercing Subject and Activity_Label columns to factor by** *as.factor()*

13. **Grouping xysub by factor levels of Subject and Activity_Label by** *group_by()*

14. **Creating new data frame tld (tidy long data) containing "average of each variable for each activity and each subject" from xysub by** *summarise_each()*

15. **Appending "Avg-" to all column names except the first two in tld by** *ifelse(names(tld)%in%c("Subject", "Activity_Label"), str_c('', names(tld)), str_c('Avg-', names(tld)))*

16. **Writing tld to "Tidy_Long_Data.txt" by** *write.table(file = "", row.name = F)*

