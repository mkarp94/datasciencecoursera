# MKarp94
# Coursera - Exploratory Data Analysis - Data Science Specialization
# Proj2 - plot3.R
setwd("/Users/MKarp/datasciencecoursera/Exploratory Data Analysis/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <- factor(NEI$year)
balt_NEI <- NEI[NEI$fips == "24510"]
library(ggplot2)
plot <- ggplot(balt_NEI, aes(year, Emissions)) +
  geom_point() + facet_grid(. ~ type)
ggsave(file="plot3.R.png")