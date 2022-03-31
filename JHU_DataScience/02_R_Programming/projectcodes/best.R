best <- function(state, outcome){
  
  ## Contain all outcomes for the medical failures
  outcomes = c("heart attack", "heart failure", "pneumonia")
  
  ## Check if the outcome is one of the strings 
  ## %in% is an intuitive interface as a binary operator, which returns
  ## a logical vector indicating if there is a match or not for outcome
  
  if (outcome %in% outcomes == FALSE){
    stop("invalid outcome")
  }
  
  ## read data table and make sure the column class is character
  ## since we want it to rank instead.
  tbl <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  
  ## Obtain columns from the read data for extraction and rename them.
  ## "Hospital.Name"
  ## "State"
  ## "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"  
  ## "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  ## "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia" 
  
  tbl <- tbl[c(2,7,11,17,23)]
  names(tbl)[1] <-"name"
  names(tbl)[2] <- "state"
  names(tbl)[3] <- "heart attack"
  names(tbl)[4] <- "heart failure"
  names(tbl)[5] <- "pneumonia"
  
  ## obtain vector of all the states in the read-data frame
  states <- tbl[,2]
  
  ## find unique entries for the respective states
  states <- unique(states)
  
  ## Filter inappropriate entries for the states in data.
  if (state %in% states == FALSE){
    stop("invalid state entries")
  }
  
  ## finalize the rows with state value correctly for both the state
  ## and symptom outcome.
  tbl <- tbl[tbl$state==state & tbl[outcome]!='Not Available', ]
  vals <- tbl[, outcome] 
  
  ## Use minimum value to indexing the ranking for lowest death rate.
  rowNo <- which.min(vals)
  
  ## Return the hospital name in the state with lowest death rate.
  tbl[rowNo, ]$name
}