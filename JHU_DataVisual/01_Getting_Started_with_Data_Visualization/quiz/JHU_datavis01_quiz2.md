# (Base R and Functions) Getting Started with Data Visualization in R Quiz 2 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Data Visualization & Dashboarding with R Specialization.</br>

Question 1
----------
What does this line of code do in R? </br>

`a <- 2+2` </br>

### Answer
- [ ] Tells R that "a" will be less than or equal to 2+2
- [ ] Creates a function (a) that will execute 2+2
- [x] Assigns the value of 2+2 to the object "a"
</br>

### Remarks
N/A </br>

Question 2
----------
Will R return a value of true or false if you evaluate this expression? </br>

`"apple"=="appla"` </br>

### Answer
- [x] It will return the value `FALSE`
- [ ] It will return the value `TRUE`
</br>

### Remarks
When you use the "==" or "is equal" operator with two character strings, R will test whether those two strings are exactly the same. In this case, the two strings are different, so R will return "FALSE" if you run this code.</br>

Question 3
----------
What will happen if you try to run this line of code in R? </br>

`10variable1 <- c(5,19,10,"apple")` </br>

### Answer
- [ ] R will save the vector to the object 10variable1
- [ ] R will return an error because you cannot combine numbers and character strings into the same vector in R. 
- [x] R will return an error because 10variable1 is not a valid object name.
</br>

### Remarks
You cannot start an object name in R with a number, so would give you an error and do nothing if you tried to run this code. </br>

Question 4
----------
What does the class() function do in R? </br>

### Answer
- [x] Gives a line of output that identifies the class of an object in R.
- [ ] Creates a new object class in R.
- [ ] Assigns a class to an object in R.
</br>

### Remarks
`class()` will tell you the class of the object you put inside the parenthesis. It might be something like numeric, logical, or character. </br>

Question 5
----------
In R, create the following object: </br>

`test_vector` <- c("dog","fish","pig","parrot"). </br>

After you create the object, what do you get if you then run `test_vector[4]`? </br>

### Answer
- [ ] "dog"
- [ ] "fish"
- [ ] "pig"
- [x] "parrot"
- [ ] "dog", "fish", "pig", "parrot"
- [ ] TRUE
- [ ] FALSE
</br>

### Remarks
test_vector[4] returns the fourth element of the vector, which in this case is "parrot." </br>

Question 6
----------
What value will this return? </br>

```{R}
subtract_and_divide<- function(x,y){
x-y
x/y
}

subtract_and_divide(4,8)
```
</br>

### Answer
- [x] 0.5
- [ ] 4
- [ ] -4 and 0.5
- [ ] -4
</br>

### Remarks
In this function, only the last command of function would be stored and displayed. That is why the x and y are taken for the division. </br>
