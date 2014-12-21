# MKarp94
# Coursera - Exploratory Data Analysis - Data Science Specialization
# Proj2 - plot2.R
setwd("/Users/MKarp/datasciencecoursera/Exploratory Data Analysis/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$year <- factor(NEI$year)
balt_NEI <- NEI[NEI$fips == "24510"]
balt_emissions_sums <- tapply(balt_NEI$Emissions, balt_NEI$year, sum)
balt_emissions_plot <- plot(levels(balt_NEI$year), balt_emissions_sums)
png("plot2.R.png")
plot(levels(balt_NEI$year), balt_emissions_sums)
dev.off()
# Total emissions decreasing