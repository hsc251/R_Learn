# (JHU Coursera) Regression Models Quiz 1 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Data Science's coursera courses.</br>

Question 1
----------
Consider the data set given below </br>

```R
x <- c(0.18, -1.54, 0.42, 0.95)
```
</br>

And weights given by </br>

```R
w <- c(2, 1, 3, 1)
```
</br>

Give the value of μ that minimizes the least squares equation </br>
![](https://github.com/hsc251/RLearn/blob/master/JHU_DataScience/07_Regression_Models/quiz/JHU07_quiz1_q1equ.jpg)

### Answer
- [ ] 1.077
- [ ] 0.0025
- [ ] 0.300
- [x] 0.1471
</br>

### Remarks
Refer to the following R code for calculating the flow </br>

```R
mu <- sum(x*w) / sum(w)
print(mu)
# [1] 0.1471429
```
</br>

Question 2
----------
Consider the following data set </br>

```R
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
```
</br>

Fit the regression through the origin and get the slope treating y as the outcome and x as the regressor. (Hint, do not center the data since we want regression through the origin, not through the means of the data.) </br>

### Answer
- [ ] -1.713
- [ ] 0.59915
- [x] 0.8263
- [ ] -0.04462
</br>

### Remarks
Refer to the following R code to see the calculated result. </br>

```R
coef(lm(y ~ x - 1))

## [1] 0.8263
```
</br>

or </br>

```R
sum(x*y) / sum(x^2)
# [1] 0.8262517
```
</br>

Question 3
----------
Do data(mtcars) from the datasets package and fit the regression model with mpg as the outcome and weight as the predictor. Give the slope coefficient. </br>

### Answer
- [ ] -9.559
- [x] -5.344
- [ ] 30.2851
- [ ] 0.5591
</br>

### Remarks
Refer to the following R code to see the calculated result. </br>

```R
## load data
data(mtcars)

## use lm to generate linear model (output ~ predictor, data)
carsM <- lm(mpg ~ wt, data = mtcars)
carsM$coefficients['wt']

## [1] -5.344
```
</br>

Question 4
----------
Consider data with an outcome (Y) and a predictor (X). The standard deviation of the predictor is one half that of the outcome. The correlation between the two variables is .5. What value would the slope coefficient for the regression model with Y as the outcome and X as the predictor? </br>

### Answer
- [ ] 0.25
- [ ] 3
- [x] 1
- [ ] 4
</br>

### Remarks
![](https://github.com/hsc251/RLearn/blob/master/JHU_DataScience/07_Regression_Models/quiz/JHU07_quiz1_q4.jpg)

Refer to the following R code to see the calculated result. </br>

```R
# Y (outcome)
# X (predictor)

corYX <- .5
sdYdivX <- 2

corYX * sdYdivX
#[1]  1
```
</br>

Question 5
----------
Students were given two hard tests and scores were normalized to have empirical mean 0 and variance 1. The correlation between the scores on the two tests was 0.4. What would be the expected score on Quiz 2 for a student who had a normalized score of 1.5 on Quiz 1? </br>

### Answer
- [x] 0.6
- [ ] 0.16
- [ ] 0.4
- [ ] 1.0
</br>

### Remarks
![](https://github.com/hsc251/RLearn/blob/master/JHU_DataScience/07_Regression_Models/quiz/JHU07_quiz1_q5.jpg)

```R
corYX <- .4
quiz1 <- 1.5

# Scores are normalized so slope (beta1) is corYX
beta1 <- corYX  

# Beta0 is 0 since scores are normalized
beta0 <- 0

quiz2 <- beta0 + beta1 * quiz1
quiz2

# Answer
# 0.6
```
</br>

Question 6
----------
Consider the data given by the following </br>

```R
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
```
</br>

What is the value of the first measurement if x were normalized (to have mean 0 and variance 1)?</br>

### Answer
- [ ] 9.31
- [ ] 8.86
- [x] -0.9719
- [ ] 8.58
</br>

### Remarks
Refer to the following R code for the setup </br>

```R
(x[1] - mean(x)) / sd(x)

## [1] -0.9719
```
</br>

Question 7
----------
Consider the following data set (used above as well). What is the intercept for fitting the model with x as the predictor and y as the outcome? </br>

```R
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
```
</br>

### Answer
- [ ] 2.105
- [x] 1.567
- [ ] 1.252
- [ ] -1.713
</br>

### Remarks
Refer to the following R code for the setup </br>

```R
q1q7 <- lm(y~x)
q1q7$coefficients['(Intercept)']

## [1] 1.567461 
```
</br>

Question 8
----------
You know that both the predictor and response have mean 0. What can be said about the intercept when you fit a linear regression?? </br>

### Answer
- [ ] Nothing about the intercept can be said from the information given.
- [ ] It is undefined as you have to divide by zero.
- [ ] It must be exactly one.
- [x] It must be identically 0.
</br>

### Remarks
The intercept estimate is Ybar - β1 x Xbar and so will be zero. </br>

Question 9
----------
Consider the data given by </br>

```R
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
```

What value minimizes the sum of the squared distances between these points and itself? </br>

### Answer
- [ ] 0.8
- [x] 0.573
- [ ] 0.36
- [ ] 0.44
</br>

### Remarks
Refer to the following calculation to obtain the average of x to minimize the sum of squared distance. </br>

```R
mean(x)
# [1] 0.573 
```
</br>

Question 10
----------
Let the slope having fit Y as the outcome and X as the predictor be denoted as β1. Let the slope from fitting X as the outcome and Y as the predictor be denoted as γ1. Suppose that you divide β1 by γ1; in other words consider β1/γ1. What is this ratio always equal to?
 
### Answer
- [x] Var(Y)/Var(X)
- [ ] Cor(Y,X)
- [ ] 2SD(Y)/SD(X)
- [ ] 1
</br>


### Remarks
Refer to the following calculation to obtain the setup </br>

```R
cor(X, Y)*sd(Y)/sd(X) / (cor(X,Y)*sd(X)/sd(Y))
= sd(Y)^2/(sd(X)^2) 
= var(Y)/var(X)

# Answer 
# Var(Y) / Var(X) 
```
</br>
