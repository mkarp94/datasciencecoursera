# MKarp94
# Coursera - R Programming - Data Science Specialization
# Programming Assignment 3.R - rankall.R

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  outcome_list <- c("heart attack","heart failure","pneumonia")
  ## create vector of valid state names
  state_names <- sort(unique(outcomes$State))
  final_frame <- data.frame(c(1:52), c(1:52))
  names(final_frame) <- c("hospital", "state")
  for (i in 1:52){
    ## Check that state and outcome are valid
    if (!outcome %in% outcome_list) {
      stop("invalid outcome")
    }
    else {
      ## Return hospital name in that state with "num" variables 30-day death rate
      ## get index of column based on outcome provided
      dat <- NA
      if (outcome == "heart attack"){
        ## outcome == heart attack; col 11
        outcomes[, 11] <- as.numeric(outcomes[, 11])
        dat <- outcomes[outcomes$State == state_names[i], c(2,11)]
      }
      if (outcome == "heart failure"){
        ## outcome == heart failure; col 17
        outcomes[, 17] <- as.numeric(outcomes[, 17])
        dat <- outcomes[outcomes$State == state_names[i], c(2,17)]
      }
      if (outcome == "pneumonia"){
        ## outcome == pneumonia; col 23
        outcomes[, 23] <- as.numeric(outcomes[, 23], na.rm = TRUE)
        dat <- outcomes[outcomes$State == state_names[i], c(2,23)]
      }
      dat <- dat[!is.na(dat[,2]),]
      new_dat <- dat[order(dat[,2],dat[,1]),]
      if (num == "best"){
        num <- 1
      }
      else if (num == "worst"){
        num <- nrow(new_dat)
      }
      hospital_name <- new_dat[num,1]
      if (num > nrow(new_dat)){
        hospital_name <- NA
      }
      final_frame$hospital[i] <- hospital_name
      final_frame$state[i] <- state_names[i] 
    }
  }
  #final_frame <- final_frame[order(final_frame$state),]
  final_frame
}