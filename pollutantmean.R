pollutantmean <- function(directory,pollutant,id=1:332){
  # generate the loading of file list by list.files while have directory input and put full.names = TRUE to obtain the specdata's csv files.
  files_list <- list.files(directory, full.names = TRUE) #create file list
  
  # generate empty data frame for the data storage.
  dat <- data.frame() #empty data frame
  
  # Generate the for loop while consider the input for the sensor ID to bind the data
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