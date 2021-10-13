# (JHU Coursera) Regression Models Quiz 3 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Data Science's coursera courses.</br>

Question 1
----------
Consider the **mtcars** data set. Fit a model with mpg as the outcome that includes number of cylinders as a factor variable and weight as confounder. Give the adjusted estimate for the expected change in mpg comparing 8 cylinders to 4.</br>

### Answer
- [ ] -4.256
- [ ] 33.991
- [x] -6.071
- [ ] -3.206
</br>

### Remarks
Refer to the following R code for setting up the coefficients </br>

```R
## use lm to setup the part and summarize the coefficients
fit1 <- lm(mpg ~ factor(cyl) + wt, data = mtcars)
fit1_coef <- summary(fit1)$coef

## Results
##              Estimate Std. Error   t value     Pr(>|t|)
## (Intercept)  33.990794  1.8877934 18.005569 6.257246e-17
## factor(cyl)6 -4.255582  1.3860728 -3.070244 4.717834e-03
## factor(cyl)8 -6.070860  1.6522878 -3.674214 9.991893e-04
## wt           -3.205613  0.7538957 -4.252065 2.130435e-04

## To filter the estimate of the 8 cylinder factor, then subset the coefficients
## fit1_coef[3,1] 
## [1] -6.07086
```
</br>

Question 2
----------
Consider the **mtcars** data set. Fit a model with mpg as the outcome that includes number of cylinders as a factor variable and weight as a possible confounding variable. Compare the effect of 8 versus 4 cylinders on mpg for the adjusted and unadjusted by weight models.  Here, adjusted means including the weight variable as a term in the regression model and unadjusted means the model without weight included. What can be said about the effect comparing 8 and 4 cylinders after looking at models with and without weight included?. </br>

### Answer
- [x] Holding weight constant, cylinder appears to have less of an impact on mpg than if weight is disregarded.
- [ ] Within a given weight, 8 cylinder vehicles have an expected 12 mpg drop in fuel efficiency.
- [ ] Holding weight constant, cylinder appears to have more of an impact on mpg than if weight is disregarded.
- [ ] Including or excluding weight does not appear to change anything regarding the estimated impact of number of cylinders on mpg.
</br>

### Remarks
Use the R code between 2 different models to compare </br>

```R
## compare between 2 models (use fit1 from question 1)
fit2 <- lm(mpg ~ factor(cyl), data = mtcars)
fit2_coef <- summary(fit2)$coef
print(fit2_coef)

##                Estimate Std. Error   t value     Pr(>|t|)
## (Intercept)   26.663636  0.9718008 27.437347 2.688358e-22
## factor(cyl)6  -6.920779  1.5583482 -4.441099 1.194696e-04
## factor(cyl)8 -11.563636  1.2986235 -8.904534 8.568209e-10
```
</br>

Based on the results displayed, the adjusted model demonstrated that the cylinder's impact is not as significant when holding the weight as constant. </br>

Question 3
----------
Consider the **mtcars** data set. Fit a model with mpg as the outcome that considers number of cylinders as a factor variable and weight as confounder. Now fit a second model with mpg as the outcome model that considers the interaction between number of cylinders (as a factor variable) and weight. Give the P-value for the likelihood ratio test comparing the two models and suggest a model using 0.05 as a type I error rate significance benchmark. </br>

### Answer
- [ ] The p-value is small (less than 0.05). So according to our criterion, we reject, which suggests that the interaction term is not necessary.
- [ ] The p-value is small (less than 0.05). Thus it is surely true that there is an interaction term in the true model.
- [ ] The p-value is small (less than 0.05). Thus it is surely true that there is no interaction term in the true model.
- [ ] The p-value is small (less than 0.05). So according to our criterion, we reject, which suggests that the interaction term is necessary.
- [x] The p-value is larger than 0.05. So, according to our criterion, we would fail to reject, which suggests that the interaction terms may not be necessary.
- [ ] The p-value is larger than 0.05. So, according to our criterion, we would fail to reject, which suggests that the interaction terms is necessary.

</br>

### Remarks
Refer to the following R code to see the calculated result. </br>

```R
## use lm to calculate from previous question code.
fit3_1 <- lm(mpg ~ factor(cyl) + wt, data = mtcars)
fit3_2 <- lm(mpg ~ factor(cyl) * wt, data = mtcars)

## Summarize the fit's coefficients while looking at the confounding elements.
summary(fit3_1)$coef

## Results for 1st model
##
##              Estimate Std. Error   t value     Pr(>|t|)
## (Intercept)  33.990794  1.8877934 18.005569 6.257246e-17
## factor(cyl)6 -4.255582  1.3860728 -3.070244 4.717834e-03
## factor(cyl)8 -6.070860  1.6522878 -3.674214 9.991893e-04
## wt           -3.205613  0.7538957 -4.252065 2.130435e-04


summary(fit3_2)$coef

## Results for 2nd model
##                  Estimate Std. Error    t value      Pr(>|t|)
## (Intercept)      39.571196   3.193940 12.3894599  2.058359e-12
## factor(cyl)6    -11.162351   9.355346 -1.1931522  2.435843e-01
## factor(cyl)8    -15.703167   4.839464 -3.2448150  3.223216e-03
## wt               -5.647025   1.359498 -4.1537586  3.127578e-04
## factor(cyl)6:wt   2.866919   3.117330  0.9196716  3.661987e-01
## factor(cyl)8:wt   3.454587   1.627261  2.1229458  4.344037e-02
                

## Then use ANOVA to compare to probability values between the 2 models.
anova(fit3_1,fit3_2)

## Analysis of Variance Table
##
## Model 1: mpg ~ factor(cyl) + wt
## Model 2: mpg ~ factor(cyl) * wt
##   Res.Df    RSS Df Sum of Sq      F Pr(>F)
## 1     28 183.06                           
## 2     26 155.89  2     27.17 2.2658 0.1239
```
</br>

Based on the ANOVA table, the probability is greater than 0.05, therefore the interaction term is insignificant based on the 95% confidence interval. </br>

Question 4
----------
Consider the **mtcars** data set. Fit a model with mpg as the outcome that includes number of cylinders as a factor variable and weight inlcuded in the model as? </br>

```R
lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
```
 </br>
 
How is the wt coefficient interpretted? </br>

### Answer
- [ ] The estimated expected change in MPG per half ton increase in weight for the average number of cylinders.
- [ ] The estimated expected change in MPG per one ton increase in weight
- [ ] The estimated expected change in MPG per half ton increase in weight for a specific number of cylinders (4,6,8)
- [x] The estimated expected change in MPG per one ton increase in weight for a specific number of cylinders (4,6,8)
- [ ] The estimated expected change in MPG per half ton increase in weight
</br>

### Remarks
Refer to the R-Code for comparison </br>

```R
## Establish model seutp
fit4_1 <- lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
fit4_2 <- lm(mpg ~ wt + factor(cyl), data = mtcars)

## Compare the coefficients
print(c(fit4_1$coefficients[2],fit4_2$coefficients[2]))

## Results
## I(wt * 0.5)          wt 
##   -6.411227   -3.205613   
```
</br>

Since the weight factor is halved, therefore the gradient is actually doubled when implement the slope. Therefore the increment will be one ton instead of half a ton (as the original unit from table)  </br>

Question 5
----------
Consider the following data set </br>

```R
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
```
</br>

Give the hat diagonal for the most influential point </br>

### Answer
- [x] 0.9946
- [ ] 0.2287
- [ ] 0.2804
- [ ] 0.2025
</br>

### Remarks
Please refer to the following code for setup </br>

```R
## Store the vector values before implement lm model
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit5 <- lm(y ~ x)

## Check the hat value via influence function.
influence(fit5)$hat

## Results
##        1         2         3         4         5 
## 0.2286650 0.2438146 0.2525027 0.2804443 0.9945734 
```
</br>

Question 6
----------
Consider the following data set </br>

```R
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
```
</br>

Give the slope dfbeta for the point with the highest hat value. </br>

### Answer
- [ ] -0.00134
- [ ] -0.378
- [ ] 0.673
- [x] -134
</br>

### Remarks
Please refer to the following code for setup </br>

```R
## Store the vector values before implement lm model
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
fit6 <- lm(y ~ x)

## Check the hat value via influence function.
influence.measures(fit6)

## Results
##    dfb.1_     dfb.x     dffit cov.r   cook.d   hat inf
## 1  1.0621 -3.78e-01    1.0679 0.341 2.93e-01 0.229   *
## 2  0.0675 -2.86e-02    0.0675 2.934 3.39e-03 0.244    
## 3 -0.0174  7.92e-03   -0.0174 3.007 2.26e-04 0.253   *
## 4 -1.2496  6.73e-01   -1.2557 0.342 3.91e-01 0.280   *
## 5  0.2043 -1.34e+02 -149.7204 0.107 2.70e+02 0.995   * 
```
</br>

Question 7
----------
Consider a regression relationship between Y and X with and without adjustment for a third variable Z. Which of the following is true about comparing the regression coefficient between Y and X with and without adjustment for Z. </br>

### Answer
- [ ] Adjusting for another variable can only attenuate the coefficient toward zero. It can't materially change sign.
- [ ] For the coefficient to change sign, there must be a significant interaction term.
- [ ] The coefficient can't change sign after adjustment, except for slight numerical pathological cases.
- [x] It is possible for the coefficient to reverse sign after adjustment. For example, it can be strongly significant and positive before adjustment and strongly significant and negative after adjustment. 
</br>

### Remarks
N/A </br>
