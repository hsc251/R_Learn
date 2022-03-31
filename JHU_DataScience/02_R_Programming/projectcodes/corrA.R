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