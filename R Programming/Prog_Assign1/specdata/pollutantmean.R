library(plyr)
pollutantmean <- function(directory, pollutant, id = 1:132) {
  #first format string to have 3 character with .csv using c style format
  #next paste together wd with file names seperated by /
  fnames <- paste(getwd(), sprintf("%03d.csv", id), sep="/")
  #apply read.csv to all list of filenames and save into a list
  #use plyr package to combine list into a data frame
  df_csvs = ldply(lapply(fnames, read.csv))
  # df_csvs is now a data frame with all files loaded
  mean(df_csvs[, pollutant], na.rm = TRUE)
}