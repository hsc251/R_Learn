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
