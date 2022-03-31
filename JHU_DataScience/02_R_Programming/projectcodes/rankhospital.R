rankhospital <- function(state, outcome, num){
  
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
  
  ## validate the number value by check if it's "best", "worst", or a number
  ## Remark: If num was Boolean then num%%1 = 0
  if( num!= "best" && num!= "worst" && num%%1 != 0){
    stop("invalid num")
  }
  
  ## Get only rows with input state value
  tbl <- tbl[tbl$state==state & tbl[outcome]!="Not Available",]
  
  ## use order function by name and then outcome to sort. Use as.numeric to
  ## convert from character to numbers for ranking.
  tbl[outcome] <- as.data.frame(sapply(tbl[outcome],as.numeric))
  tbl <- tbl[order(tbl$name, decreasing = FALSE), ]
  tbl <- tbl[order(tbl[outcome], decreasing = FALSE), ]
  
  ## Process the num argument to obtain row index.
  vals <- tbl[, outcome]
  if (num == "best"){
    rowNo <- which.min(vals)
  }
  
  else if (num == "worst"){
    rowNo <- which.max(vals)
  }
  
  else {
    rowNo <- num
  }
  
  ## Return Hospital name in the state with lowest 30-day death rate
  tbl[rowNo, ]$name
}