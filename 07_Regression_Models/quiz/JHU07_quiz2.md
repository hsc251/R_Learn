# (JHU Coursera) Regression Models Quiz 2 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Data Science's coursera courses.</br>

Question 1
----------
Consider the following data with x as the predictor and y as as the outcome. </br>

```R
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
```
</br>

Give a P-value for the two sided hypothesis test of whether β1 from a linear regression model is 0 or not. </br>


### Answer
- [x] 0.05296
- [ ] 0.391
- [ ] 0.025
- [ ] 2.325
</br>

### Remarks
Refer to the following R code for calculating the flow </br>

```R
## use lm for the setup.
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)

## execute linear model setup for the coefficients
fit1 <- lm(y ~ x)
coefSum <- coef(summary(fit1))

## obtain pvalue for the x variable instead of the intercept.
pval <- coefSum[2,4]
print(pval)

## [1] 0.05296439
```

or </br>

```R
## Manual Calculation
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)

## Store respective calculation value for the linear equation estimates.
n <- length(y)
beta1 <- cor(y, x) * sd(y) / sd(x)
beta0 <- mean(y) - beta1 * mean(x)

## calculate the errors and sigma.
e <- y - beta0 - beta1*x
sigma <- sqrt(sum(e^2) / (n-2))
ssx <- sum((x - mean(x))^2)

## Finalize the estimated beta values for probability.
ssBeta1 <- sigma / sqrt(ssx)
tBeta1 <- beta1 / seBeta1
pBeta1 <- 2 * pt(abs(tBeta1), df = n-2, lower.tail = FALSE)
print(pBeta1)

## [1] 0.05296439
```
</br>

Question 2
----------
Consider the previous problem, give the estimate of the residual standard deviation (formula is listed below). </br>

![](https://github.com/hsc251/RLearn/blob/master/07_Regression_Models/quiz/JHU07_quiz2_q2.jpg)

### Answer
- [ ] 0.4358
- [ ] 0.05296
- [ ] 0.3552
- [x] 0.223
</br>

### Remarks
Refer to the following R code to see the calculated result (the x and y are stored as question 1's value). </br>

```R
## use lm to calculate from previous question code.
fit1 <- lm(y ~ x)
summary(fit1)$sigma

## [1] 0.2229981
```

or </br>

```R
## Store respective calculation for the linear estimates
n <- length(y)
beta1 <- cor(y, x) * sd(y) / sd(x)
beta0 <- mean(y) - beta1 * mean(x)

## Calculate errors and sigmas
e <- y - beta0 - beta1*x
sigma <- sqrt(sum(e^2) / (n-2))

## [1] 0.2229981
```
</br>

Question 3
----------
In the mtcars data set, fit a linear regression model of weight (predictor) on mpg (outcome). Get a 95% confidence interval (formula below) for the expected mpg at the average weight. What is the lower endpoint? </br>

![](https://github.com/hsc251/RLearn/blob/master/07_Regression_Models/quiz/JHU07_quiz2_q3.jpg)

### Answer
- [ ] -4.00
- [ ] -6.486
- [x] 18.991
- [ ] 21.190
</br>

### Remarks
Refer to the following R code to see the calculated result. </br>

```R
## use lm to calculate from previous question code.
fit_veh <- lm(mpg ~ wt, data = mtcars)
predict(fit_veh, newdata = data.frame(wt = mean(mtcars$wt)), interval = ("confidence"))

## Results
##        fit      lwr      upr
## 1 20.09062 18.99098 21.19027
```

or </br>

```R
## Store respective calculation for the linear estimates (y = b0 + b1x)
yh <- fit_veh$coef[1] + fit_veh$coef[2]*mean(mtcars$wt)
yh + c(-1,1) * qt(0.975, df = fit_veh$df) * summary(fit_veh)$sigma / sqrt(length(mtcars$mpg))

## [1] 18.99098 21.19027
```
</br>

Question 4
----------
Refer to the previous question. Read the help file for mtcars. What is the weight coefficient interpreted as? </br>
 
### Answer
- [x] The estimated expected change in mpg per 1,000 lb increase in weight.
- [ ] The estimated expected change in mpg per 1 lb increase in weight.
- [ ] The estimated 1,000 lb change in weight per 1 mpg increase.
- [ ] It can't be interpreted without further information
</br>

### Remarks
This is the standard interpretation of a regression coefficient. The expected change in the response per unit change in the predictor. </br>

Question 5
----------
Consider again the mtcars data set and a linear regression model with mpg as predicted by weight (1,000 lbs). A new car is coming weighing 3000 pounds. Construct a 95% prediction interval (formula below) for its mpg. What is the upper endpoint? </br>

![](https://github.com/hsc251/RLearn/blob/master/07_Regression_Models/quiz/JHU07_quiz2_q5.jpg)

### Answer
- [ ] 21.25
- [ ] 14.93
- [x] 27.57
- [ ] -5.77
</br>

### Remarks
Please refer to the following rcode for setup </br>

```R
## use lm method
fit_veh <- lm(mpg ~ wt, data = mtcars)
predict(fit_veh, newdata = data.frame(wt = 3), interval = ("prediction"))

## Results
##        fit      lwr      upr
## 1 21.25171 14.92987 27.57355
```
</br>

or</br>

```R
## Store respective calculation for the linear estimates (y = b0 + b1x) while x = 3
yh <- fit_veh$coef[1] + fit_veh$coef[2]*3
yh + c(-1,1) * qt(0.975, df = fit_veh$df) * summary(fit_veh)$sigma * sqrt(1 + (1/length(mtcars$mpg)) + ((3 - mean(mtcars$wt)) ^ 2 / sum((mtcars$wt - mean(mtcars$wt)) ^ 2)))

## Results
## [1] 14.92987 27.57355
```
</br>

Question 6
----------
Consider again the mtcars data set and a linear regression model with mpg as predicted by weight (in 1,000 lbs). A “short” ton is defined as 2,000 lbs. Construct a 95% confidence interval for the expected change in mpg per 1 short ton increase in weight. Give the lower endpoint. </br>

```R
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
```
</br>

What is the value of the first measurement if x were normalized (to have mean 0 and variance 1)?</br>

### Answer
- [ ] -9.000
- [ ] 4.2026
- [x] -12.973
- [ ] -6.486
</br>

### Remarks
Please refer to the following rcode for setup </br>

```R
## use lm method, except change predictor from 1000 lbs to 2000 lbs for unit
fit_veh2 <- lm(mpg ~ I(wt/2), data = mtcars)
coef2 <- coef(summary(fit_veh2))

## use the estimated wt/2 coefficient to calculate the confidence interval
coef2[2,1] + c(-1,1) * qt(0.975, df = fit_veh2$df)* coef2[2,2]

## Results
## [1] -12.97262  -8.40527
```
</br>

Question 7
----------
If my X from a linear regression is measured in centimeters and I convert it to meters what would happen to the slope coefficient? </br>

### Answer
- [ ] It would get multiplied by 10
- [x] It would get multiplied by 100.
- [ ] It would get divided by 10
- [ ] It would get divided by 100
</br>

### Remarks
Refer to the following R code to validate </br>

```R
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit <- lm(y ~ x)
fit$coef[2]
##         x 
## 0.7224211

x_meter <- x / 100
fit_meter <- lm(y ~ x_meter)
fit_meter$coef[2]
##  x_meter 
## 72.24211
```
</br>

Question 8
----------
I have an outcome, Y, and a predictor, X and fit a linear regression model with Y=β0+β1X+ϵ to obtain β^0 and β^1. What would be the consequence to the subsequent slope and intercept if I were to refit the model with a new regressor, X+c for some constant, c? </br>

![](https://github.com/hsc251/RLearn/blob/master/07_Regression_Models/quiz/JHU07_quiz2_q8.jpg)

### Answer
- [ ] The new slope would be β^1+c
- [ ] The new slope would be cβ^1
- [x] The new intercept would be β^0−cβ^1
- [ ] The new intercept would be β^0+cβ^1
</br>

### Remarks
Note that if Y = β^0 + β^1X + ε, then Y = β^0 - cβ^1 + β^1(X+c) + ε such that the answer indicates the intercept gets subtracted by cβ^1. </br>

Use the following R code to validate: </br>

```R
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit <- lm(y ~ x)
fit$coef
## (Intercept)           x 
##   0.1884572   0.7224211

x_c <- x + 10
fit_c <- lm(y ~ x_c)
fit_c$coef
## (Intercept)         x_c 
##  -7.0357536   0.7224211

fit$coef[1] - 10 * fit$coef[2] 
## (Intercept) 
##   -7.035754
```

Question 9
----------
Refer back to the mtcars data set with mpg as an outcome and weight (wt) as the predictor. About what is the ratio of the the sum of the squared errors, When comparing a model with just an intercept (denominator) to the model with the intercept and slope (numerator)? </br>

![](https://github.com/hsc251/RLearn/blob/master/07_Regression_Models/quiz/JHU07_quiz2_q9.jpg)

### Answer
- [x] 0.25
- [ ] 0.50
- [ ] 4.00
- [ ] 0.75
</br>

### Remarks
Refer to the following calculation to obtain the sum square errors. </br>

```R
fit1 <- lm(mpg ~ wt, data = mtcars)
fit2 <- lm(mpg ~ 1, data = mtcars)
sse <- 1 - summary(fit1)$r.squared
print(sse)

## [1] 0.2471672
```

or </br>

```R
fit_veh <- lm(mpg ~ wt, data = mtcars)
sum(resid(fit_veh)^2) / sum((mtcars$mpg - mean(mtcars$mpg))^2)

## [1] 0.2471672
```

Question 10
----------
Do the residuals always have to sum to 0 in linear regression? </br>

### Answer
- [ ] The residuals must always sum to zero.
- [ ] If an intercept is included, the residuals most likely won't sum to zero.
- [x] If an intercept is included, then they will sum to 0.
- [ ] The residuals never sum to zero.
</br>


### Remarks
Refer to the following calculation to validate the sum is eventually summed to zero when applying with intercepts. </br>

```R
# With Intercept
fit_veh <- lm(mpg ~ wt, data = mtcars)
res1 <- sum(resid(fit_veh))
print(res)

# Change to be rounded to zero
#  [1] -1.637579e-15

# Without Intercept
fit_vehnc <- lm(mpg ~ wt - 1, data = mtcars)
res2 <- sum(resid(fit_vehnc))
print(res2)

#  [1] 98.11672

# With Intercept of repeated mpgvectors of 1's as intercept.
fit_vehic <- lm(mpg ~ rep(1, length(mpg)), data = mtcars)
res3 <- sum(resid(fit_vehic))
print(res3)

# Change to be rounded to zero
#  [1] -5.995204e-15
```
</br>
