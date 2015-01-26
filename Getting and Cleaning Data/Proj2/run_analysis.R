# MKarp94
# Coursera - Getting and Cleaning Data - Data Science Specialization
# 1/25/15
# Proj2 - run_analysis.R
test_file_x = "/Users/MKarp/datasciencecoursera/Getting and Cleaning Data/Proj2/UCI HAR Dataset/test/X_test.txt"
test_file_y = "/Users/MKarp/datasciencecoursera/Getting and Cleaning Data/Proj2/UCI HAR Dataset/test/Y_test.txt"
train_file_x = "/Users/MKarp/datasciencecoursera/Getting and Cleaning Data/Proj2/UCI HAR Dataset/train/X_train.txt"
train_file_y = "/Users/MKarp/datasciencecoursera/Getting and Cleaning Data/Proj2/UCI HAR Dataset/train/Y_train.txt"
activity_labels <- "/Users/MKarp/datasciencecoursera/Getting and Cleaning Data/Proj2/UCI HAR Dataset/activity_labels.txt"
feature_labels <- "/Users/MKarp/datasciencecoursera/Getting and Cleaning Data/Proj2/UCI HAR Dataset/features.txt"


train_data_x <- read.table(train_file_x, header=TRUE, sep="\t")
train_data_y <- read.table(train_file_y, header=TRUE, sep="\t")
train_data <- merge(train_data_x, train_data_y)
str(train_data)

test_data_x <- read.table(test_file_x, header=TRUE, sep="\t")
test_data_y <- read.table(test_file_y, header=TRUE, sep="\t")
test_data <- merge(test_data_x, test_data_y)
str(test_data)
dat <- merge(train_data, test_data)

write.table(x = dat, file = "FullDataSet.txt", row.name=FALSE)