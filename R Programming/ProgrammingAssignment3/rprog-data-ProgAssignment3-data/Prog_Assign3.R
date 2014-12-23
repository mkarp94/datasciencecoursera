# MKarp94
# Coursera - R Programming - Data Science Specialization
# Programming Assignment 3.R

# Read in outcome data
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
str(outcome)
ncol(outcome)

# histogram of 11th column
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])

best <- function(state, outcome) {
  ## Read outcome data
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## create vector of valid state names
  state_names <- unique(outcome$State)
  
  ## Check that state and outcome are valid
  if (state %in% state_names) {
    stop("invalid state")
  }
  else if !(outcome %in% c("heart attack", "heart failure", "pneumonia")) {
    stop("invalid outcome")
  }
  else {
    ## Return hospital name in that state with lowest 30-day death rate
    ## get index of column based on outcome provided
    dat <- NA
    if (outcome == "heart attack"){
      ## outcome == heart attack; col 11
      outcome[, 11] <- as.numeric(outcome[, 11])
      dat <- outcome[outcome$State == state, c(2,11)]
    }
    if (outcome == "heart failure"){
      ## outcome == heart failure; col 17
      outcome[, 17] <- as.numeric(outcome[, 17])
      dat <- outcome[outcome$State == state, c(2,17)]
    }
    if (outcome == "pneumonia"){
      ## outcome == pneumonia; col 23
      outcome[, 23] <- as.numeric(outcome[, 23], na.rm = TRUE)
      dat <- outcome[outcome$State == state, c(2,23)]
    }
    dat <- dat[!is.na(dat[,2]),]
    new_dat <- dat[order(dat[,2],dat[,1])),]
    new_dat[1,1]
  }
}