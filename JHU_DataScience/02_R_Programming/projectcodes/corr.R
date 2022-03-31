corr <- function(directory, threshold = 0) {
  
  # Reading in all files and making a large data.table
  fl <- lapply(file.path(directory, list.files(path = directory, pattern="*.csv")), data.table::fread)
  d_table <- rbindlist(fl)
  
  # Maintain completed observed cases only
  d_table <- d_table[complete.cases(d_table),]
  
  # Apply threshold for correlation
  d_table <- d_table[, .(nobs = .N, corr = cor(x = sulfate, y = nitrate)), by = ID][nobs > threshold]
  return(d_table[, corr])
}