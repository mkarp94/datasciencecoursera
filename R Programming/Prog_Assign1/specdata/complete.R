library(mice)
complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  #first format string to have 3 character with .csv using c style format
  #next paste together wd with file names seperated by /
  fnames <- paste(getwd(), sprintf("%03d.csv", id), sep="/")
  #loop through all files and use ccn from mice package to count num complete cases
  num_rows <- sapply(fnames, function(f) ccn(read.csv(f)))
  #id labels = nrow(nrows)
  row_nums <- nrow(num_rows)
  # save as a data frame for output
  df_ccn <- data.frame(id=sprintf('%3d', id), 
                        nobs=sapply(fnames,function(x) 
                          length(count.fields(x))),
                row.names=row_nums)
  df_ccn
}


  

  
  
