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
