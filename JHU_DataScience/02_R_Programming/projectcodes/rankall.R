rankall <- function(outcome, num = "best"){
  
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
  
  ## validate the number value by check if it's "best", "worst", or a number
  ## Remark: If num was Boolean then num%%1 = 0
  if( num!= "best" && num!= "worst" && num%%1 != 0){
    stop("invalid num")
  }
  
  ## Obtain the rows with data in respective outcome.
  tbl <- tbl[tbl[outcome]!="Not Available",]
  
  ## use order function by name and then outcome to sort. Use as.numeric to
  ## convert from character to numbers for ranking.
  tbl[outcome] <- as.data.frame(sapply(tbl[outcome],as.numeric))
  tbl <- tbl[order(tbl$name, decreasing = FALSE), ]
  tbl <- tbl[order(tbl[outcome], decreasing = FALSE), ]
  
  ## Have intermediate function to process the num argument
  HospRank <- function (dt, s, n){
    dt <- dt[dt$state==s, ]
    vals <- dt[, outcome]
    
    ## use the conditions to filter the num argument
    if (n == "best"){
      rowNo <- which.min(vals)
    }
    
    else if (n == "worst"){
      rowNo <- which.max(vals)
    }
    
    else {
      rowNo <- n
    }
    dt[rowNo, ]$name
  }
  
  ## For each state, obtain the state's unique entries
  states <- tbl[, 2]
  states <- unique(states)
  
  ## create blank new table for the rank all data.frame with hospital &
  ## states entries
  newtbl <- data.frame("hospital"=character(), "state"=character())
  
  ## Use for loop to accumulate the sum of hospital and index.   
  for(st in states) {
    hosp <- HospRank(tbl, st, num)
    newtbl <- rbind(newtbl, data.frame(hospital=hosp, state=st))
  }
  
  ## Return the complete data.frame with hospital names & ranks
  newtbl <- newtbl[order(newtbl['state'], decreasing = FALSE), ]
  newtbl
}