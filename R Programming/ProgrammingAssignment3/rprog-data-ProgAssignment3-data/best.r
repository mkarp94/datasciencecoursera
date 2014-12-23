# MKarp94
# Coursera - R Programming - Data Science Specialization
# Programming Assignment 3.R - best.R

best <- function(state, outcome) {
  ## Read outcome data
  outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  outcome_list <- c("heart attack","heart failure","pneumonia")
  ## create vector of valid state names
  state_names <- unique(outcomes$State)
  ## Check that state and outcome are valid
  if (!state %in% state_names) {
    stop("invalid state")
  }
  if (!outcome %in% outcome_list) {
    stop("invalid outcome")
  }
  else {
    ## Return hospital name in that state with lowest 30-day death rate
    ## get index of column based on outcome provided
    dat <- NA
    if (outcome == "heart attack"){
      ## outcome == heart attack; col 11
      outcomes[, 11] <- as.numeric(outcomes[, 11])
      dat <- outcomes[outcomes$State == state, c(2,11)]
    }
    if (outcome == "heart failure"){
      ## outcome == heart failure; col 17
      outcomes[, 17] <- as.numeric(outcomes[, 17])
      dat <- outcomes[outcomes$State == state, c(2,17)]
    }
    if (outcome == "pneumonia"){
      ## outcome == pneumonia; col 23
      outcomes[, 23] <- as.numeric(outcomes[, 23], na.rm = TRUE)
      dat <- outcomes[outcomes$State == state, c(2,23)]
    }
    dat <- dat[!is.na(dat[,2]),]
    new_dat <- dat[order(dat[,2],dat[,1]),]
    new_dat[1,1]
  }
}