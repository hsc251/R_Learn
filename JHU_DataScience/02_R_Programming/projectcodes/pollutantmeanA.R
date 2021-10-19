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
