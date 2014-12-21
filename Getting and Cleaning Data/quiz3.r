# MKarp94
# Coursera - Getting and Cleaning Data - Data Science Specialization
# Quiz 3

if(!file.exists("./data")){dir.create("./data")}
fileUrl1 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl1,destfile="./data/reviews.csv",method="curl")
housing = read.csv("./data/reviews.csv")

# Inspect Data
str(housing)
summary(housing)

# q1 - Identify first 3 rows of where 10+ acres were sold and 10K+ worth of product were sold
which(housing$ACR == 3 & housing$AGS == 6)

# q2 - Read Jpeg
library(jpeg)
img_name <- "/Users/MKarp/datasciencecoursera/Getting and Cleaning Data/data/getdata-jeff.jpg"
img <- readJPEG(img_name, native = TRUE)
# 30th and 80th quantiles
quantile(img,probs=c(0.3,0.8))

# q3 - GDP
if(!file.exists("./data")){dir.create("./data")}
fileUrl2 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileUrl3 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv" 
download.file(fileUrl2,destfile="./data/gdp190.csv",method="curl")
download.file(fileUrl3,destfile="./data/education190.csv",method="curl")
gdp190 = read.csv("./data/gdp190.csv")
education190 = read.csv("./data/education190.csv")
str(gdp190)
str(education190)


mergedData = merge(gdp190,education190,by.x="X",by.y="CountryCode")
head(mergedData)






