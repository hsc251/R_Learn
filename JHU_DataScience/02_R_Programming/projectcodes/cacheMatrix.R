## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix function is the preliminary function which would store
## matrix input and return the list input consists of set matrix,
## get matrix, set inverse and get inverse. The list is considered the input 
## to perform the cacheSolve function.

makeCacheMatrix <- function(x = matrix()) {
  inv = NULL ##initialize the inverse as NULL item.
  set = function(y){
    x <<- y
    inv <<- NULL
  }
  
  get = function() x
  setinv = function(inv2) inv <<- inv2
  getinv = function() inv
  list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## cacheSolve function will return the inverse of the input matrix at 
## makeCacheMatrix function.


cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv = x$getinv()
  
  ## When inverse were already calculated
  if(!is.null(inv)){
    message("obtaining cached data")
    return(inv)
  }
  
  ## otherwise, the following statement will initiate inverse calculation to
  ## return the inverse.
  mat.input = x$get()
  inv = solve(mat.input,...)
  
  x$setinv(inv)
  
  return(inv)
}