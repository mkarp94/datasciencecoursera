# MKarp94
# Coursera - Exploratory Data Analysis - Data Science Specialization
# Proj2 - plot6.R
setwd("/Users/MKarp/datasciencecoursera/Exploratory Data Analysis/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <- factor(NEI$year)
NEI$type <- factor(NEI$type)

library(ggplot2)
balt.la.NEI <- NEI[(NEI$fips == "24510" | NEI$fips == "06037") & NEI$type == "ON-ROAD",] 
plot <- ggplot(balt.la.NEI, aes(year, Emissions)) +
  geom_point() + facet_grid(. ~ fips)
ggsave(file="plot6.png")
