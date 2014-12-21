# MKarp94
# Coursera - Exploratory Data Analysis - Data Science Specialization
# Proj2 - plot.R
setwd("/Users/MKarp/datasciencecoursera/Exploratory Data Analysis/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <- factor(NEI$year)
emissions_sums <- tapply(NEI$Emissions, NEI$year, sum)
emissions_plot <- plot(levels(NEI$year), emissions_sums)
png("plot1.R.png")
plot(levels(NEI$year), emissions_sums)
dev.off()
# Total emissions decreasing