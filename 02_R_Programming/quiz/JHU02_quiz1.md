Question 1
----------
The R language is a dialect of which of the following programming languages? </br>

### Answer
- [x] S
- [ ] C
- [ ] Haskell
- [ ] Java
</br>

### Remarks
R is a dialect of the S language which was developed at Bell Labs.</br>

Question 2
----------
The definition of free software consists of four freedoms (freedoms 0 through 3). Which of the following is NOT one of the freedoms that are part of the definition?  Select all that apply. </br>

### Answer
- [ ] The freedom to study how the program works, and adapt it to your needs.
- [ ] The freedom to improve the program, and release your improvements to the public, so that the whole community benefits.
- [ ] The freedom to run the program, for any purpose.
- [ ] The freedom to redistribute copies so you can help your neighbor.
- [x] The freedom to restrict access to the source code for the software.
- [x] The freedom to prevent users from using the software for undesirable purposes.
- [x] The freedom to sell the software for any price.
</br>

### Remarks
The 4 freedoms of free software are the items which were **NOT** selected.</br>

Question 3
----------
In R the following are all atomic data types EXCEPT: (Select all that apply) </br>

### Answer
- [ ] character
- [x] list
- [ ] numeric
- [x] array
- [x] table
- [ ] integer
- [ ] logical
- [x] data frame
- [x] matrix
- [ ] complex
</br>

### Remarks
The 4 freedoms of free software are the items which were **NOT** selected.</br>

Question 4
----------
If I execute the expression x <- 4 in R, what is the class of the object 'x' as determined by the `class()' function? </br>

### Answer
- [ ] real
- [ ] complex
- [x] numeric
- [ ] integer
- [ ] list
- [ ] matrix
- [ ] vector
</br>

### Remarks
Use the following code to evaluate class of variable </br>
```R
x <- 4
class(x)
```
</br>

Question 5
----------
What is the class of the object defined by x <- c(4, TRUE)? </br>

### Answer
- [ ] logical
- [ ] matrix
- [ ] list
- [x] numeric
- [ ] integer
- [ ] character
</br>

### Remarks
Use the following code to evaluate class of variable, and the numeric class is the "lowest common denominator" here and so all elements will be coerced into that class. </br>

```R
x <- c(4, TRUE)
class(x)
```
</br>

Question 6
----------
If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by the expression rbind(x, y)? </br>

### Answer
- [ ] a 3 by 2 matrix
- [ ] a 3 by 3 matrix
- [ ] a vector of length 2
- [ ] a 2 by 2 matrix
- [x] a matrix with two rows and three columns
- [ ] a vector of length 3
</br>

### Remarks
The **rbind** function treats vectors as if they were rows of a matrix. It then takes those vectors and binds them together row-wise to create a matrix. If use **cbind**, then the vectors will be binded column-wise to create the matrix so it will be a matrix with 3 rows and 2 columns in this case.  </br>

```R
x <- c(1,3, 5)
y <- c(3, 2, 10)
rbind(x, y)
```
</br>

Question 7
----------
A key property of vectors in R is that </br>

### Answer
- [ ] elements of a vector can be of different classes
- [ ] a vector cannot have have attributes like dimensions
- [ ] the length of a vector must be less than 32,768
- [x] elements of a vector all must be of the same class
- [ ] elements of a vector can only be character or numeric
</br>

### Remarks
N/A </br>

Question 8
----------
Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[2]] give me? Select all that apply. </br>

### Answer
- [x] a character vector of length 1.
- [ ] a character vector with the elements "a" and "b".
- [ ] a list containing a character vector with the elements "a" and "b".
- [ ] a list containing character vector with the letter "a".
- [x] a character vector containing the letter "a".
</br>

### Remarks
Can use the following code to verify the input </br>

```R
x <- list(2, "a", "b", TRUE)
x[[2]]
class(x[[2]])
length(x[[2]])
```
</br>

Question 9
----------
Suppose I have a vector x <- 1:4 and a vector y <- 2. What is produced by the expression x + y?

### Answer
- [ ] a numeric vector with elements 3, 2, 3, 6.
- [ ] a integer vector with elements 3, 2, 3, 4.
- [ ] a integer vector with elements 3, 2, 3, 6.
- [x] a numeric vector with elements 3, 4, 5, 6.
- [ ] a numeric vector with elements 3, 2, 3, 4.
- [ ] a numeric vector with elements 1, 2, 3, 6.
</br>

### Remarks
Since the default vector format for numbers are numeric (unless indicated as integer during the naming stage), so the two vector's addition would be considered as a vector. Use the following codes to validate the results. </br>

```R
x <- 1:4
y <- 2
x + y

class(x + y)
```
Question 10
-----------
Suppose I have a vector x <- c(3, 5, 1, 10, 12, 6) and I want to set all elements of this vector that are less than 6 to be equal to zero. What R code achieves this? Select all that apply.

### Answer
- [ ] x[x < 6] == 0
- [x] x[x < 6] <- 0
- [ ] x[x > 6] <- 0
- [ ] x[x == 0] <- 6
- [ ] x[x >= 6] <- 0
- [ ] x[x != 6] <- 0
- [ ] x[x == 0] < 6
- [x] x[x <= 5] <- 0
- [x] x[x %in% 1:5] <- 0
</br>

### Remarks
* For x[x < 6] <- 0, the inner bracket is applied with logic condition and assign value towards logical evaluation for subsetting. </br>

```R
x <- c(3, 5, 1, 10, 12, 6)
x[x < 6] <- 0
x
```
</br>

* For x[x <= 5] <- 0, it's the same just like first one except use less or equal to 5 (still equivalent to less than 6) for subsetting. </br>
```R
x <- c(3, 5, 1, 10, 12, 6)
x[x <= 5] <- 0
x
```
</br>

* For x[x %in% 1:5] <- 0, different way to express the %in% operator within the 1:5 vector as inclusive condition for subsetting. </br>
```R
x <- c(3, 5, 1, 10, 12, 6)
x[x %in% 1:5] <- 0
x
```
</br>

Question 11
-----------
Use the week 1 quiz data set to answer question 11-20 </br>
In the dataset provided for this Quiz, what are the column names of the dataset? </br>

### Answer
- [ ] Ozone, Solar.R, Wind
- [ ] 1,2,3,4,5,6
- [ ] Month, Day, Temp, Wind
- [x] Ozone, Solar.R, Wind, Temp, Month, Day
</br>

### Remarks
Use the following code to observe values </br>
```R
# use read.csv to store the data frame for entering 
quiz1 = read.csv("hw1_data.csv")

# Column names of the dataset 
names(quiz1)
```
</br>

Question 12
-----------
Extract the first 2 rows of the data frame and print them to the console. What does the output look like? </br>

### Answer
	  Ozone Solar.R Wind Temp Month Day
	1    41     190  7.4   67     5   1
	2    36     118  8.0   72     5   2
</br>

### Remarks
Use the following code to observe values </br>
```R
# Use vector form to perform the data subsetting
quiz1[1:2, ] or quiz1[c(1,2), ]
```
</br>

```R
# Use head function to obtain the first 2 rows.
head(quiz1, 2)
```
</br>

Question 13
-----------
How many observations (i.e. rows) are in this data frame? </br>

### Answer
- [x] 153
- [ ] 129
- [ ] 45
- [x] 160
</br>

### Remarks
Use the following code to observe values  </br>
```R
# Use nrow to get the total number of rows in dataset
nrow(quiz1)
```
</br>

```R
# Use dim function to obtain both rows and column numbers in dataset.
dim(quiz1)
```
</br>

Question 14
-----------
Extract the last 2 rows of the data frame and print them to the console. What does the output look like? </br>

### Answer

	   Ozone Solar.R Wind Temp Month Day
	152    18     131  8.0   76     9  29
	153    20     223 11.5   68     9  30
</br>

### Remarks
Use the following code to observe values  </br>
```R
# Use vector form to perform the data subsetting
quiz1[152:153, ] or quiz1[c(152,153), ]
```
</br>

```R
# Use tail function to obtain the last 2 rows.
tail(quiz1, 2)
```
</br>

Question 15
-----------
What is the value of Ozone in the 47th row? </br>

### Answer
- [ ] 34
- [ ] 63
- [x] 21
- [ ] 18
</br>

### Remarks
Use the following code to observe values </br>
```R
# Subset formulat 1
quiz1[47, "Ozone"]
```
</br>

```R
# Subset formulat 2
quiz1$Ozone[47]
```
</br>

Question 16
-----------
How many missing values are in the Ozone column of this data frame? </br>

### Answer
- [ ] 9
- [ ] 78
- [ ] 43
- [x] 37
</br>

### Remarks
Use the following code to find value </br>
```R
# use is.na to get the logical vector for the Ozone column and sum up, since is.na will return to logical vector of 0 = FALSE and 1 = TRUE
sum(is.na(quiz1$Ozone))
```

```R
# Sapply can also be used and use is.na function setup.
sum(sapply(quiz1$Ozone,is.na))
```

Question 17
-----------
What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation. </br>

### Answer
- [ ] 53.2
- [ ] 18.0
- [ ] 31.5
- [x] 42.1
</br>

### Remarks
Use to following code to summarize the mean setup. </br>

```R
# Use na.omit to eliminate the data frame before calculating mean
q1_17 = na.omit(quiz1)
mean(q1_17$Ozone)
```
</br>

```R
# Use complete cases as logical factor and subsetting existing database before calculating mean.
FULL = complete.cases(quiz1)
q1_17 = quiz1[FULL, ]
mean(q1_17$Ozone)
```
</br>

Question 18
-----------
Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset? </br>

### Answer
- [ ] 205.0
- [ ] 334.0
- [ ] 185.9
- [x] 212.8
</br>

### Remarks
Use to following code to summarize the mean setup. </br>

```R
# Use na.omit to eliminate the missing values based on the which subsetting condition.
q1_18 = na.omit(quiz1[which(quiz1$Ozone>31 & quiz1$Temp>90),]) 
mean(q1_18$Solar.R)
```
</br>

```R
# Use complete cases as logical factor and subsetting existing database before calculating mean.
FULL = complete.cases(quiz1)
quiz11 = quiz1[FULL, ]
q1_18 = quiz11[which(quiz11$Ozone > 31 & quiz11$Temp >90), ]
mean(q1_18$Solar.R)
```
</br>

Question 19
-----------
What is the mean of "Temp" when "Month" is equal to 6? </br>

### Answer
- [x] 79.1
- [ ] 75.3
- [ ] 90.2
- [ ] 85.6
</br>

### Remarks
Use to following code to summarize the mean setup. </br>

```R
# Use which filter to get the conditional setup for average calculation
q1_19 = quiz1[which(quiz1$Month == 6), ] 
mean(q1_19$Temp)

or

q1_19 = quiz1[which(quiz1[, "Month"] == 6), ] 
mean(q1_19[, "Temp"])
```
</br>

Question 20
-----------
What was the maximum ozone value in the month of May (i.e. Month = 5)? </br>

### Answer
- [x] 115
- [ ] 18
- [ ] 97
- [ ] 100
</br>

### Remarks
Use to following code to summarize the mean setup. </br>

```R
# Use which filter to get the conditional setup for the column summary
q1_20 = quiz1[which(quiz1$Month == 5), ] 
summary(q1_20$Ozone)

or

q1_20 = quiz1[which(quiz1[, "Month"] == 5), ] 
summary(q1_20[, "Ozone"])
```
</br>
