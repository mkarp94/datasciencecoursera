# MKarp94
# Coursera - Getting and Cleaning Data - Data Science Specialization
# Proj2 - run_analysis.R
test_file_x = "/Users/MKarp/datasciencecoursera/Getting and Cleaning Data/Proj2/UCI HAR Dataset/test/X_test.txt"
test_file_y = "/Users/MKarp/datasciencecoursera/Getting and Cleaning Data/Proj2/UCI HAR Dataset/test/Y_test.txt"
train_file_x = "/Users/MKarp/datasciencecoursera/Getting and Cleaning Data/Proj2/UCI HAR Dataset/train/X_train.txt"
train_file_y = "/Users/MKarp/datasciencecoursera/Getting and Cleaning Data/Proj2/UCI HAR Dataset/train/Y_train.txt"

train_data_x <- read.table(train_file_x, header=TRUE, sep="\t")
train_data_y <- read.table(train_file_y, header=TRUE, sep="\t")
train_data <- merge(train_data_x, train_data_y)
