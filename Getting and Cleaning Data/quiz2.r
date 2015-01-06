# MKarp94 
# 1/6/15
# Coursera - Gettomg and Cleaning Data - Data Science Specialization
# quiz2.R

if(!file.exists("data")){dir.create("data")}
# q2 - Which of the following commands will select only the data for the 
# probability weights pwgtp1 with ages less than 50?

#csv file url
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
# download file
download.file(fileUrl, destfile = "./data/acs.csv", method = "curl")
# save download date
dateDownloaded = date()
# read in the file
acs = read.csv("./data/acs.csv")
# summarize data
summary(acs)
library(sqldf)
pwgtp1_50 <- sqldf("select pwgtp1 from acs where AGEP < 50")

# q3 -  what is the equivalent function to unique(acs$AGEP)?
unique(acs$AGEP) == sqldf("select distinct pwgtp1 from acs")
# FALSE
unique(acs$AGEP) == sqldf("select unique AGEP from acs")
# FALSE
unique(acs$AGEP) == sqldf("select AGEP where unique from acs")
# FALSE
unique(acs$AGEP) == sqldf("select distinct AGEP from acs")
# TRUE


# q4 - How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page: 
htmlFile <- readLines(url("http://biostat.jhsph.edu/~jleek/contact.html"))
nchar(htmlFile[10])
# 45
nchar(htmlFile[20])
# 31
nchar(htmlFile[30])
# 7
nchar(htmlFile[100])
# 25


# q5 - sum of the numbers in the 4th and 9th columns
# fixed width file, counted widths in text file, first 4 rows are blanks
dat <- read.fwf(file=url("http://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"),
  skip=4,
  widths=c(12, 7,4, 9,4, 9,4, 9,4))

sum(dat$V4)
# 32426.7
sum(dat$V9)
# 36.5
