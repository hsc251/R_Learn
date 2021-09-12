### Introduction

This second programming assignment will require you to write an R function that is able to cache potentially time-consuming computations. For example, taking the mean of a numeric vector is typically a fast operation. However, for a very long vector, it may take too long to compute the mean, especially if it has to be computed repeatedly (e.g. in a loop). If the contents of a vector are not changing, it may make sense to cache the value of the mean so that when we need it again, it can be looked up in the cache rather than recomputed. In this Programming Assignment you will take advantage of the scoping rules of the R language and how they can be manipulated to preserve state inside of an R object. </br>

### Example: Caching the Mean of a Vector

In this example we introduce the `<<-` operator which can be used to assign a value to an object in an environment that is different from the current environment. Below are two functions that are used to create a special object that stores a numeric vector and caches its mean.</br>

The first function, `makeVector` creates a special "vector", which is really a list containing a function to </br>

1.  set the value of the vector </br>
2.  get the value of the vector </br>
3.  set the value of the mean </br>
4.  get the value of the mean </br>

```R
    makeVector <- function(x = numeric()) {
            m <- NULL
            set <- function(y) {
                    x <<- y
                    m <<- NULL
            }
            get <- function() x
            setmean <- function(mean) m <<- mean
            getmean <- function() m
            list(set = set, get = get,
                 setmean = setmean,
                 getmean = getmean)
    }
```
</br>

The following function calculates the mean of the special "vector" created with the above function. However, it first checks to see if the mean has already been calculated. If so, it `get`s the mean from the cache and skips the computation. Otherwise, it calculates the mean of the data and sets the value of the mean in the cache via the `setmean` function. </br>

```R
    cachemean <- function(x, ...) {
            m <- x$getmean()
            if(!is.null(m)) {
                    message("getting cached data")
                    return(m)
            }
            data <- x$get()
            m <- mean(data, ...)
            x$setmean(m)
            m
    }
```
</br>

### Assignment: Caching the Inverse of a Matrix

Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix rather than computing it repeatedly (there are also alternatives to matrix inversion that we will not discuss here). Your assignment is to write a pair of functions that cache the inverse of a matrix.</br>

Write the following functions: </br>

1.  `makeCacheMatrix`: This function creates a special "matrix" object that can cache its inverse.</br>
2.  `cacheSolve`: This function computes the inverse of the special "matrix" returned by `makeCacheMatrix` above. If the inverse has already been calculated (and the matrix has not changed), then `cacheSolve` should retrieve the inverse from the cache. </br>

Computing the inverse of a square matrix can be done with the `solve` function in R. For example, if `X` is a square invertible matrix, then `solve(X)` returns its inverse. </br>

For this assignment, assume that the matrix supplied is always invertible. </br>

In order to complete this assignment, you must do the following: </br>

1.  Fork the GitHub repository containing the stub R files at [https://github.com/rdpeng/ProgrammingAssignment2](https://github.com/rdpeng/ProgrammingAssignment2)
    to create a copy under your own account. </br>
2.  Clone your forked GitHub repository to your computer so that you can edit the files locally on your own machine. </br>
3.  Edit the R file contained in the git repository and place your solution in that file (please do not rename the file). </br>
4.  Commit your completed R file into YOUR git repository and push you git branch to the GitHub repository under your account. </br>
5.  Submit to Coursera the URL to your GitHub repository that contains the completed R code for the assignment. </br>

## R Programming Project 2

```R
## makeCacheMatrix function is the preliminary function which would store matrix input and return the list input consists of set matrix,
## get matrix, set inverse and get inverse. The list is considered the input to perform the cacheSolve function.

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
  
  ## otherwise, the following statement will initiate inverse calculation to return the inverse.
  mat.input = x$get()
  inv = solve(mat.input,...)
  
  x$setinv(inv)
  
  return(inv)
}
```
