# (JHU Coursera) Regression Models Quiz 4 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Data Science's coursera courses.</br>

Question 1
----------
Consider the space shuttle data **shuttle** in the **MASS** library. Consider modeling the use of the autolander as the outcome (variable name \verb|use|use). Fit a logistic regression model with autolander (variable auto) use (labeled as "auto" 1) versus not (0) as predicted by wind sign (variable wind). Give the estimated odds ratio for autolander use comparing head winds, labeled as "head" in the variable headwind (numerator) to tail winds (denominator).

### Answer
- [ ] 1.327
- [ ] -0.031
- [ ] 0.031
- [x] 0.969
</br>

### Remarks
Refer to the following R code for setting up the coefficients </br>

```R
## load library

library(MASS)

## Re-arrange data accordingly.
shuttle$auto <- 1*(shuttle$use == "auto")
shuttle$headwind <- 1*(shuttle$wind == "head")
fit <- glm(auto ~ headwind, data = shuttle, family = binomial)
exp(coef(fit))

## Results
##  (Intercept)    headwind 
##   1.3272727   0.9686888 
```
</br>

Question 2
----------
Consider the previous problem. Give the estimated odds ratio for autolander use comparing head winds (numerator) to tail winds (denominator) adjusting for wind strength from the variable magn. </br>

### Answer
- [x] 0.969
- [ ] 1.485
- [ ] 0.684
- [ ] 1.00
</br>

### Remarks
Refer to the following R code for setting up the coefficients </br>

```R
## load library

library(MASS)

## Re-arrange data accordingly.
shuttle$auto <- 1*(shuttle$use == "auto")
shuttle$headwind <- 1*(shuttle$wind == "head")
fit <- glm(auto ~ headwind + magn, data = shuttle, family = binomial)
exp(coef(fit))

## Results
## (Intercept)    headwind  magnMedium     magnOut  magnStrong 
##  1.4851533   0.9684981   1.0000000   0.6841941   0.9376181 
```
</br>

By looking at the inclusion of the magnitude, the headwind coefficients does not change. </br>

Question 3
----------
If you fit a logistic regression model to a binary variable, for example use of the autolander, then fit a logistic regression model for one minus the outcome (not using the autolander) what happens to the coefficients? </br>

### Answer
- [ ] The coefficients change in a non-linear fashion.
- [ ] The coefficients get inverted (one over their previous value).
- [ ] The intercept changes sign, but the other coefficients dont.
- [x] The coefficients reverse their signs.
</br>

### Remarks
Remember that the coefficients are on the log scale. So changing the sign changes the numerator and denominator for the exponent.</br>

Question 4
----------
Consider the insect spray data **InsectSprays**. Fit a Poisson model using spray as a factor level. Report the estimated relative rate comapring spray A (numerator) to spray B (denominator). </br>

### Answer
- [ ] 0.136
- [ ] 0.321
- [ ] -0.056
- [x] 0.9457
</br>

### Remarks
Refer to the R-Code for comparison </br>

```R
## Establish model setup where as the spray B as the denominator
fit4 <- glm(count ~ relevel(spray, "B"), data = InsectSprays, family = poisson)
exp(fit4$coefficients)

## Demonstrate the results when compare with other numerators (with exponential fit in)
##          (Intercept) relevel(spray, "B")A relevel(spray, "B")C 
##           15.3333333            0.9456522            0.1358696 
## relevel(spray, "B")D relevel(spray, "B")E relevel(spray, "B")F 
##            0.3206522            0.2282609            1.0869565


## select the comparison nominator
exp(fit4$coefficients)[2] 
```
</br>

Question 5
----------
Consider a Poisson glm with an offset *t*. So, for exmaple, a model of the form `glm(count ~ x + offset(t), family = poisson)` where x is a factor variable comparing a treatment (1) to a control (0) and **t** is the natural log of a monitoring time. What is impact of the coefficient for x if we fit the model `glm(count ~ x + offset(t2), family = poisson)` where 2 <- log(10) + t? In other words, what happens to the coefficients if we change the units of the offset variable. (Note, adding log(10) on the log scale is multiplying by 10 on the original scale.) </br>

### Answer
- [ ] The coefficient estimate is multiplied by 10.
- [ ] The coefficient estimate is divided by 10.
- [ ] The coefficient is subtracted by log(10).
- [x] The coefficient estimate is unchanged.
</br>

### Remarks
Note, the coefficients are unchanged, except the intercept, which is shifted by log(10). Recall that, except the intercept, all of the coefficients are interpretted as log relative rates when holding the other variables or offset constant. Thus, a unit change in the offset would cancel out. This is not true of the intercept, which is interperted as the log rate (not relative rate) with all of the covariates set to 0 </br>

Refer to the following code for the offset change. </br>

```R
## Store the vector values before implement lm model
set.seed(69)
n <- 100
count <- sample(50, n, replace = TRUE)
x <- factor(sample(2, n, replace = TRUE) - 1)
t <- log(seq(1,100, length.out = n))

fit5_1 <- glm(count ~ x + offset(t), family = "poisson")
fit5_1$coef

t2 <- log(10) + t
fit5_2 <- glm(count ~ x + offset(t2), family = "poisson")
fit5_2$coef
```
</br>

Question 6
----------
Consider the data </br>

```R
x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
```
</br>

Using a knot point at 0, fit a linear model that looks like a hockey stick with two lines meeting at x=0. Include an intercept term, x and the knot point term. What is the estimated slope of the line after 0? </br>

### Answer
- [ ] -0.183
- [x] 1.013
- [ ] -1.024
- [ ] 2.037
</br>

### Remarks
Please refer to the following code for setup </br>

```R
## Define the variables
x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
z <- (x > 0) * x

## perform the linear fit with the zero for knot point
fit6 <- lm(y ~ x + z)
fit6$coef

## (Intercept)           x           z 
##  -0.1825806  -1.0241584   2.0372258 

## Slope before 0 is -1.0241584
## Slope after 0 = 2.0372258 + (-1.0241584) = 1.013067
```
</br>
