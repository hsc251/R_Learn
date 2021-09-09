Question 1
----------
Take a look at the 'iris' dataset that comes with R. The data can be loaded with the code: </br>

```R
library(datasets)
data(iris)
```
</br>

A description of the dataset can be found by running </br>
```R
?iris
```
</br>

There will be an object called 'iris' in your workspace. In this dataset, what is the mean of 'Sepal.Length' for the species virginica? **Please round your answer to the nearest whole number**.</br>


### Answer
7

### Remarks
Use the following code to calculate: </br>

```R
# Assign a variable to store the filtered column
q3_1 = iris[which(iris$Species == "virginica"),]

# use round function for the mean function of filtered column's Sepal Length 
round(mean(q3_1$Sepal.Length))
```
</br>

Question 2
----------
Continuing with the 'iris' dataset from the previous Question, what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'? </br>

### Answer
- [x] apply(iris[, 1:4],2,mean)
- [ ] apply(iris, 2, mean)
- [ ] colMeans(iris)
- [ ] apply(iris[, 1:4], 1, mean)
- [ ] apply(iris, 1, mean)
- [ ] rowMeans(iris[, 1:4])
</br>

### Remarks
Apply function is stated as apply(X, MARGIN, FUN) where X is the data, MARGIN = 1 is row, MARGIN = 2 is column. And since one of the columns is character, then colMeans(iris) or rowMeans(iris[, 1:4]) will not work.  </br>


Question 3
----------
Load the 'mtcars' dataset in R with the following code </br>

```R
library(datasets)
data(mtcars)
```
</br>

There will be an object names 'mtcars' in your workspace. You can find some information about the dataset by running </br>

```R
?mtcars
```
</br>

How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? </br>

### Answer
- [ ] tapply(mtcars$cyl, mtcars$mpg, mean)
- [ ] split(mtcars, mtcars$cyl)
- [ ] lapply(mtcars, mean)
- [x] with(mtcars, tapply(mpg,cyl,mean))
- [ ] mean(mtcars$mpg, mtcars$cyl)
- [x] sapply(split(mtcars$mpg,mtcars$cyl), mean)
- [ ] apply(mtcars, 2, mean)
- [x] tapply(mtcars$mpg, mtcars$cyl, mean)
</br>

### Remarks
* For **sapply(split(mtcars$mpg, mtcars$cyl), mean)**, use the split function to classify the miles per gallon by cylinder and then use the sapply function for the desired dataset's mean. </br>
* For **tapply(mtcars$mpg, mtcars$cyl, mean)**, use tapply to apply function to each cell of the array. this is given by the respective cells by having objects which can applied with split (so in this case mtcars$mpg and mtcars$cyl) were implemented before mean. </br>
* For **with(mtcars, tapply(mpg,cyl,mean))**, this is the expression which can be referred from the original data set, so by having the original data as the 1st argument, then tapply can be used to split the columns with mpg by cylinder to calculate the mean. </br>

Question 4
----------
Continuing with the 'mtcars' dataset from the previous Question, what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars? </br>

(**Please round your final answer to the nearest whole number**. Only enter the numeric result and nothing else.) </br>

### Answer
127


### Remarks
Use the following code to calculate: </br>

```R
# Use the expressions from question 3 to split the horsepower by cylinder
q4 = with(mtcars,tapply(hp,cyl,mean))

# After identifying that the avg hp for 4 cylinder is in the 1st section and avg hp for 8 cylinder is in the 3rd section, the calculation can be done below
round(abs(q4[3]-q4[1]))
```
</br>

Question 5
----------
If you run </br>

```R
debug(ls)
```
</br>

what happens when you next call the 'ls' function?</br>

### Answer
- [x] Execution of 'ls' will suspend at the beginning of the function and you will be in the browser
- [ ] You will be prompted to specify at which line of the function you would like to suspend execution and enter the browser.
- [ ] The 'ls' function will return an error
- [ ] The 'ls' function will execute as usual.
</br>

### Remarks
Since f was the free variable which is independent compared to the other options. </br>
