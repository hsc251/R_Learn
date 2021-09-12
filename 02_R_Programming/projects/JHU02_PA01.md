## R Programming Week 2's Programming Assignment 1

For this first programming assignment you will write three functions that are meant to interact with dataset that accompanies this assignment. The dataset is contained in a zip file **specdata.zip** that you can download from the Coursera web site. </br>

Although this is a programming assignment, you will be assessed using a separate quiz. </br>

The zip file containing the data can be downloaded here:[specdata.zip](https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip) [2.4MB] </br>

Description: The zip file contains 332 comma-separated-value (CSV) files containing pollution monitoring data for fine particulate matter (PM) air pollution at 332 locations in the United States. Each file contains data from a single monitor and the ID number for each monitor is contained in the file name. For example, data for monitor 169 is contained in the file "169.csv". Each file contains three variables: </br>

</br>
* Date: The date of the observation in YYYY-MM-DD (year-month-day)</br>
* sulfate: the level of sulfate PM in the air on that date (measured in micrograms per cubic meter)</br>
* nitrate: the level of nitrate PM in the air on that date (measured in micrograms per cubic meter)</br>

### Part 1 ([pollutantmean.R](https://github.com/hsc251/RLearn/blob/master/02_R_Programming/projectcodes/pollutantmean.R))

```R
pollutantmean <- function(directory,pollutant,id=1:332){

# generate the loading of file list by list.files while have directory input and put full.names = TRUE to obtain the specdata's csv files.
  files_list <- list.files(directory, full.names = TRUE)

# generate empty data frame for the data storage.
  dat <- data.frame() #empty data frame

# Generate the for loop while consider the input for the sensor ID to bind the data)
  for (i in id){
    dat <- rbind(dat, read.csv(files_list[i]))
  }

# use if and else if condition to calculate the averages for sulfate or nitrate averages
  if (pollutant == "sulfate")
  {
    sulf <-dat[, "sulfate"] 
    sulf_mean <- mean(sulf,na.rm = TRUE)
    print (sulf_mean)
  }
    
  else if (pollutant == "nitrate")
  {
    nitr <- dat [,"nitrate"]
    nitr_mean <- mean(nitr,na.rm = TRUE)
    print (nitr_mean)
  }
}

# Example usage
## If we want to analyze the nitrate concentration data from sensor 70 to sensor 72, use the following code for output.
source("pollutantmeanA.R")
pollutantmean('specdata','nitrate', 70:72)

#Solution
[1] 1.706047
```
</br>

### Part 1 [Alternate Solution](https://github.com/hsc251/RLearn/blob/master/02_R_Programming/projectcodes/pollutantmeanA.R) ([Referenced from M.Galarnyk](https://github.com/mGalarnyk/datasciencecoursera/blob/master/2_R_Programming/projects/project1.md))

```R
library('data.table')

pollutantmeanA <- function(directory, pollutant, id = 1:332){
  
  # Format number with fixed width and cover .csv to numbers accordingly
  filez <- paste0(directory, '/', formatC(id, width=3, flag="0"),".csv")

  # Read in all files with fast read and combine as a large data table 
  # by rbindlist to compile the list
  lst <- lapply(filez, data.table::fread)
  tbl <- rbindlist(lst)  
  
  # use the if condition to filter sulfate or nitrate and use return
  # and lapply for combining data table. And usage of .SD and .SDcols
  # for subsetting the data according by the conditions while na.rm
  # is applied to remove the NA values in the data.
  
  if(c(pollutant) %in% names(tbl)){
    return(tbl[, lapply(.SD, mean, na.rm = TRUE), .SDcols = pollutant][[1]])
  }
}

# Example usage
source("pollutantmeanA.R")
pollutantmean("specdata", "sulfate", 1:10)

#Solution
[1] 4.064128
```
</br>

### Part 2 ([complete.R](https://github.com/hsc251/RLearn/blob/master/02_R_Programming/projectcodes/complete.R))

```R
complete <- function(directory, id = 1:332){
  
  # create the full file list for reading.
  fl <- list.files(directory, full.names = TRUE) #create full file list
  
  # have the number of FULL data stored as an empty numeric values
  nobs <- numeric()
  
  # use for loop to accumulate the data set for selected data
  # then use complete cases to count the number of full information cases.
  # And have the summed counts while associated with the number of data.
  
  for (i in id){
    ok <- complete.cases(read.csv(fl[i]))
    nr <- sum(ok)
    nobs <-c(nobs,nr)
  }
  
  # once obtained the number of okay measurements, then use the sensor id join
  # the number of okays for data frame completion.
  result <- data.frame(id,nobs)
  return(result)
}

#Example usage
print(complete('specdata',c(10,20,34,100,200,310)))

#Solution
   id nobs
1  10  148
2  20  124
3  34  165
4 100  104
5 200  460
6 310  232
```
</br>

### Part 2 [Alternate Solution](https://github.com/hsc251/RLearn/blob/master/02_R_Programming/projectcodes/completeA.R) ([Referenced from M.Galarnyk](https://github.com/mGalarnyk/datasciencecoursera/blob/master/2_R_Programming/projects/project1.md))

```R
library('data.table')

completeA <- function(directory, pollutant, id = 1:332){
  
  # Format number with fixed width and cover .csv to numbers accordingly
  filez <- paste0(directory, '/', formatC(id, width=3, flag="0"),".csv")
  
  # Read in all files with fast read and combine as a large data table 
  # by rbindlist to compile the list
  lst <- lapply(filez, data.table::fread)
  tbl <- rbindlist(lst)  
  
  # once gathered all data, then use the complete.cases to read 
  # number of completed entries, while have the sorting order by
  # the identification.
  
  return(tbl[complete.cases(tbl), .(nobs = .N), by = ID])
}

#Example usage
source("completeA.R")
completeA(directory = 'specdata',id = c(10,20,34,100,200,310))

#Solution
   id nobs
1  10  148
2  20  124
3  34  165
4 100  104
5 200  460
6 310  232
```
</br>

### Part 3 ([corr.R](https://github.com/hsc251/RLearn/blob/master/02_R_Programming/projectcodes/corr.R)
```R
corr <- function(directory,threshold =0){
  # implement the file list for directories
  fl <- list.files(directory, full.names = TRUE)
  
  # use complete function from part 2 to extract all data
  # for all the complete cases. also the nobs can be decided
  # to see if the number of cases are greater than your
  # threshold before evaluating to the next command.
  
  dat <- complete(directory)
  good <- subset(dat,nobs >=threshold)
  
  # extract the good sensor's ID as a separate vector.
  goodid <- as.vector(good$id)
  
  # store the correlation as a empty numeric variable
  corr <- numeric()
  
  # use the for loop in the complete case vectors,
  # then have the database to store the complete cases
  # and use cor function to have the complete cases
  # between sulfate and nitrate.
  
  for (i in goodid){
    df <- read.csv(fl[i],header=TRUE)
    df1 <- df[complete.cases(df),]
    corr <- c(corr, cor(df1$sulfate,df1$nitrate))
  }
}

# Example Usage
source('complete.R')
source('corr.R')
cr = corr("specdata",150)
head(cr)

# Solution
[1] -0.01895754 -0.14051254 -0.04389737 -0.06815956
[5] -0.12350667 -0.07588814
```
</br>

### Part 3 [Alternate Solution](https://github.com/hsc251/RLearn/blob/master/02_R_Programming/projectcodes/corrA.R) ([Referenced from M.Galarnyk](https://github.com/mGalarnyk/datasciencecoursera/blob/master/2_R_Programming/projects/project1.md))
```R

library('data.table')
corrA <- function(directory, threshold = 0) {
  
  # Reading in all files and making a large data.table
  # with fread and list all files before rbindlist them.
  lst <- lapply(file.path(directory, list.files(path = directory, pattern="*.csv")), data.table::fread)
  tbl <- rbindlist(lst)
  
  # Only keep completely observed cases by doing the subsetting.
  tbl <- tbl[complete.cases(tbl),]
  
  # Apply threshold and use subsetting function to calculate correlation
  # between the sulfate and nitrate concentration.
  tbl <- tbl[, .(nobs = .N, corr = cor(x = sulfate, y = nitrate)), by = ID][nobs > threshold]
  return(tbl[, corr])
}

# Example Usage
corr(directory = 'specdata', threshold = 150)

#Solution
[1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
```