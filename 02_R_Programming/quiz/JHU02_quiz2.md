Question 1
----------
Suppose I define the following function in R </br>

```R
cube <- function(x, n) {
        x^3
}
```
</br>

What is the result of running cube(3) in R after defining this function? </br>

### Answer
- [ ] An error is returned because 'n' is not specified in the call to 'cube'
- [ ] The user is prompted to specify the value of 'n'
- [x] The number 27 is returned
- [ ] A warning is given with no value returned
</br>

### Remarks
Since variable *'n'* is not evaluated and applied as the formal function argument, therefore the number will return when only place x so 3^3 = 27.</br>

Question 2
----------
The following code will produce a warning in R. </br>

```R
x <- 1:10
if(x > 5) {
        x <- 0
}
```
</br>

Why? </br>

### Answer
- [ ] The syntax of this R expression is incorrect.
- [ ] The expression uses curly braces.
- [x] 'x' is a vector of length 10 and 'if' can only test a single logical statement.
- [ ] You cannot set 'x' to be 0 because 'x' is a vector and 0 is a scalar.
- [ ] There are no elements in 'x' that are greater than 5
</br>

### Remarks
N/A.</br>

Question 3
----------
Consider the following function </br>

```R
f <- function(x) {
    g <- function(y) {
          y + z
      }
      z <- 4
      x + g(x)
}
```
</br>

If I then run in R </br>

```R
	  z <- 10
	  f(3)
```
</br>

What value is returned? </br>

### Answer
- [ ] 16
- [x] 10
- [ ] 7
- [ ] 4
</br>

### Remarks
Although z is assigned in a value of 10, but the f(3) already included as a function where z is set as 4 in the function, so the value of 3 + 4 is included in g(x) before adding the 3 to make it 10.</br>

Question 4
----------
Consider the following expression: </br>

```R
x <- 5
y <- if(x < 3) {
        NA
     } 
     else {
        10
     }
```
</br>

What is the value of 'y' after evaluating this expression? </br>

### Answer
- [ ] 5
- [ ] NA
- [ ] 3
- [x] 10
</br>

### Remarks
In this conditional statement, x is greater than 5 and it will fall into the else loop which returns the value of 10.</br>

Question 5
----------
Consider the following R function </br>

```R
h <- function(x, y = NULL, d = 3L) {
        z <- cbind(x, d)
        if(!is.null(y))
                z <- z + y
        else
                z <- z + f
        g <- x + y / z
        if(d == 3L)
                return(g)
        g <- g + 10
        g
}
```
</br>

Which symbol in the above function is a free variable?</br>

### Answer
- [x] f
- [ ] z
- [ ] d
- [ ] L
- [ ] g
</br>

### Remarks
Since f was the free variable which is independent compared to the other options. </br>

Question 6
----------
Which symbol in the above function is a free variable? </br>

### Answer
- [ ] a list whose elements are all functions
- [x] a collection of symbol/value pairs
- [ ] a special type of function
- [ ] an R package that only contains data.
</br>

### Remarks
N/A </br>

Question 7
----------
The R language uses what type of scoping rule for resolving free variables? </br>

### Answer
- [x] lexical scoping
- [ ] global scoping
- [ ] dynamic scoping
- [ ] compilation scoping
</br>

### Remarks
N/A </br>

Question 8
----------
How are free variables in R functions resolved? </br>

### Answer
- [ ] The values of free variables are searched for in the environment in which the function was called
- [x] The values of free variables are searched for in the environment in which the function was defined
- [ ] The values of free variables are searched for in the global environment
- [ ] The values of free variables are searched for in the working directory.
</br>

### Remarks
N/A </br>

Question 9
----------
What is one of the consequences of the scoping rules used in R? </br>

### Answer
- [ ] R objects cannot be larger than 100 MB
- [x] All objects must be stored in memory
- [ ] Functions cannot be nested
- [ ] All objects can be stored on the disk
</br>

### Remarks
N/A </br>

Question 10
-----------
In R, what is the parent frame? </br>

### Answer
- [ ] It is the package search list
- [ ] It is always the global environment
- [ ] It is the environment in which a function was defined 
- [x] It is the environment in which a function was called
</br>

### Remarks
N/A </br>
