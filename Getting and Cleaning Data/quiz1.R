# MKarp94 
# 1/5/15
# Coursera - Gettomg and Cleaning Data - Data Science Specialization
# quiz1.R



if(!file.exists("data")){dir.create("data")}
#csv file url
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
# download file
download.file(fileUrl, destfile = "./data/idaho_micro.csv", method = "curl")
# save download date
dateDownloaded = date()
# read in the file
idaho_data = read.csv("./data/idaho_micro.csv")
# summarize data
summary(idaho_data)
# question 1 - property values over 1M
table(idaho_data$VAL == 24)
# 53

# library(RCurl)
# idaho_download <- getURL(fileUrl)
# idaho_Data = read.csv(textConnection(idaho_download))

# question 2
# Tidy data should have only 1 variable/column


fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl2, destfile = "./data/nat_gas.xlsx", method = "curl")
dateDownloaded = date()
library(xlsx)
# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
dat <- read.xlsx("./data/nat_gas.xlsx",sheetIndex = 1, header = TRUE, rowIndex = 18:23, colIndex = 7:15)
# question 3 - What's the value of:
sum(dat$Zip*dat$Ext,na.rm=T) 
# 0



# question 4 - How many restaurants have zipcode 21231?
library(XML)
#extracting data from webpage
fileUrl3 = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc = xmlTreeParse(fileUrl3, useInternal = TRUE)
rootNode = xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]]
rootNode[[1]][[1]]
#extract node
xmlSApply(rootNode, xmlValue)

table(xpathSApply(rootNode, "//zipcode",xmlValue) == "21231")
# 127

# question 5 - Which of the following is the fastest way to calculate the average 
# value of the variable pwgtp15 broken down by sex using the data.table package?
fileUrl4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
# download file
download.file(fileUrl, destfile = "./data/micro_idaho.csv", method = "curl")
# save download date
library(data.table)
dateDownloaded = date()
# read in the file
DT = fread("./data/micro_idaho.csv")
DT <- data.table(DT)
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2])
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15))

