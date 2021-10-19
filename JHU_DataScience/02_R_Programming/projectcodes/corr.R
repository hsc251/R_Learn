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
