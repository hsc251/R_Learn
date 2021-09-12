## R Programming Week 2's Programming Assignment 3

### Introduction

This program assignment contains the data for the [hospital compare website](http://hospitalcompare.hhs.gov) run by the US Department of Health & Human Service. The dataset which we have for the assignment is to used to compared whether hospitals shall be fined for not providing high quality care to patients </br>

The Hospital Compare website contains a broad range of data, and this assignment will only obtain a small subset of this assignment where the files are listed below: /br>

* **outcome-of-care-measures.csv**: Contains information about 30-day mortality and readmission rates for heart attacks, heart failure, and pneumonia for over 4,000 hospitals across the USA. /br>
* **hospital-data.csv**: Contains information about each hospital./br>
* **Hospital_Revised_Flatfiles.pdf**: Descriptions of the variables in each file (a.k.a the code book). </br>

Based on the data for this program assignment, the following tasks shall be executed.

### Part 1 - Plot 30 Day Mortality Rates for Heart Attack ([histplot.R](https://github.com/hsc251/RLearn/blob/master/02_R_Programming/projectcodes/histplot.R))

```R
# read off the data.table library
library("data.table")

# read in the CSV data and plot histogram
outcome <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
hist(as.numeric(outcome[,11]), xlab = "Deaths"
                 , main = "Hospital 30-Day Death (Mortality) Rates from Heart Attack"
                 , col = "red")
```
</br>

## Part 2 - Find Best Hospital in a State ([best.R](https://github.com/hsc251/RLearn/blob/master/02_R_Programming/projectcodes/best.R))

```R
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

## Example.
source('best.R')
best('TX','heart attack')
[1] "CYPRESS FAIRBANKS MEDICAL CENTER"

best('TX','heart failure')
[1] "FORT DUNCAN MEDICAL CENTER"

best('MD','heart attack')
[1] "JOHNS HOPKINS HOSPITAL, THE"

best('MD','pneumonia')
[1] "GREATER BALTIMORE MEDICAL CENTER"

best('BB','pneumonia')
Error in best("BB", "pneumonia") : invalid state entries

best('NY','hert attack')
Error in best("NY", "hert attack") : invalid outcome
```
</br>

## Part 3 - Ranking Hospitals by Outcome in a State ([rankhospital.R](https://github.com/hsc251/RLearn/blob/master/02_R_Programming/projectcodes/rankhospital.R))

```R
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

## Example.
source('rankhospital.R')
rankhospital('TX','heart failure',4)
[1] "DETAR HOSPITAL NAVARRO"

rankhospital('MD','heart attack','worst')
[1] "HARFORD MEMORIAL HOSPITAL"

rankhospital('MN','heart attack',5000)
[1] NA
```
</br>

## Part 4 - Ranking Hospitals in All States ([rankall.R](https://github.com/hsc251/RLearn/blob/master/02_R_Programming/projectcodes/rankall.R))

```R
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

## Example
source('rankall.R')
head(rankall('heart attack',20),10)
                              hospital state
42                                <NA>    AK
40      D W MCMILLAN MEMORIAL HOSPITAL    AL
11   ARKANSAS METHODIST MEDICAL CENTER    AR
16 JOHN C LINCOLN DEER VALLEY HOSPITAL    AZ
4                SHERMAN OAKS HOSPITAL    CA
24            SKY RIDGE MEDICAL CENTER    CO
5              MIDSTATE MEDICAL CENTER    CT
49                                <NA>    DC
31                                <NA>    DE
19      SOUTH FLORIDA BAPTIST HOSPITAL    FL

tail(rankall('pneumonia','worst'),3)
                                     hospital state
28 MAYO CLINIC HEALTH SYSTEM - NORTHLAND, INC    WI
36                     PLATEAU MEDICAL CENTER    WV
41           NORTH BIG HORN HOSPITAL DISTRICT    WY
```
</br>
