# MKarp94
# Coursera - Exploratory Data Analysis - Data Science Specialization
# Proj2 - plot5.R
setwd("/Users/MKarp/datasciencecoursera/Exploratory Data Analysis/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <- factor(NEI$year)
balt_NEI <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]
library(ggplot2)
plot <- ggplot(balt_NEI, aes(year, Emissions)) +
  geom_point()
ggsave(file="plot5.png")

