# (JHU Coursera) Statistical Inference Quiz 3 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Data Science's coursera courses.</br>

Question 1
----------
In a population of interest, a sample of 9 men yielded a sample average brain volume of 1,100cc and a standard deviation of 30cc. What is a 95% Student's T confidence interval for the mean brain volume in this new population? </br>

### Answer
- [ ] [1080, 1120]
- [x] [1077, 1123]
- [ ] [1092, 1108]
- [ ] [1031, 1169]
</br>

### Remarks
Refer to the following R code for setup.

```R
# Setup the mean, standard deviation, sample size and confidence interval.
x_avg <- 1100
s <- 30
n <- 9
alpha <- 0.05

# calculate the t score with required confidence interval & sample population
t_score <- qt(1 - alpha / 2 , n - 1) # 2.306004 

# round up the score
round(x_avg + c(-1,1)* t_score * s /sqrt(n))

# 1077 1123
```

Question 2
----------
A diet pill is given to 9 subjects over six weeks. The average difference in weight (follow up - baseline) is -2 pounds. What would the standard deviation of the difference in weight have to be for the upper endpoint of the 95% T confidence interval to touch 0? </br>

### Answer
- [ ] 1.50
- [x] 2.60
- [ ] 0.30
- [ ] 2.10
</br>

### Remarks
Refer to the following R code to see the calculated result. </br>

```R
## Setup the mean, sample size and confidence interval.
x_avg <- -2
n <- 9
alpha <- 0.05

## calculate the t score with required confidence interval & sample population
t_score <- qt(1 - alpha / 2 , n - 1) # 2.306004 

## since x_avg + t_score * s /sqrt(n) = 0, therefore standard deviation is calculated as.
## s = -x_avg / t_score * sqrt(n)
s <- -x_avg / t_score * sqrt(n) 

## solution is calculated as 
[1] 2.601903
```

Question 3
----------
In an effort to improve running performance, 5 runners were either given a protein supplement or placebo. Then, after a suitable washout period, they were given the opposite treatment. Their mile times were recorded under both the treatment and placebo, yielding 10 measurements with 2 per subject. The researchers intend to use a T test and interval to investigate the treatment. Should they use a paired or independent group? T test and interval? </br>

### Answer
- [ ] It's necessary to use both
- [x] A paired interval
- [ ] You could use either
- [ ] Independent groups, since all subjects were seen under both systems
</br>

### Remarks
Independent tests are for participants who are **NOT RELATED**, meanwhile paired tet are for the **related participants**, or when the same group uses 2 different tests. That's why paired interval is necessary for the implementation. </br>

Question 4
----------
In a study of emergency room waiting times, investigators consider a new and the standard triage systems. To test the systems, administrators selected 20 nights and randomly assigned the new triage system to be used on 10 nights and the standard system on the remaining 10 nights. They calculated the nightly median waiting time (MWT) to see a physician. The average MWT for the new system was 3 hours with a variance of 0.60 while the average MWT for the old system was 5 hours with a variance of 0.68. Consider the 95% confidence interval estimate for the differences of the mean MWT associated with the new system. Assume a constant variance. What is the interval? Subtract in this order (New System - Old System). </br>

### Answer
- [x] [-2.75 , -1.25]
- [ ] [1.25 , 2.75]
- [ ] [-2.70 , -1.29]
- [ ] [1.29 , 2.70]
</br>

### Remarks
Refer to the following R code to see the calculated result. </br>

```R
## Set up the parameters for standard solution with confidence interval
n_old <- 10
avg_old <- 5
var_old <- 0.68
a <- 0.05

## Set up the parameters for new solution.
n_new <- 10
avg_new <- 3
var_new <- 0.6

## Perform pooled stdev calculation between 2 systems.
sp2 <- ((n_old - 1)*var_old + (n_new - 1)*var_new) / (n_old + n_new - 2)
sp <- sqrt(sp2)

## Calculate the t-score between the pooled population.
t_score <- qt (1 - (a/2), n_old + n_new - 2)
round((avg_new - avg_old) + c(-1,1) * t_score * sp * (sqrt(1/n_old + 1/n_new)), 2)

## [1] -2.75 -1.25
```

Question 5
----------
Suppose that you create a 95% T confidence interval. You then create a 90% interval using the same data. What can be said about the 90% interval with respect to the 95% interval? </br>

### Answer
- [ ] It is impossible to tell.
- [ ] The interval will be the same width, but shifted.
- [x] The interval will be narrower.
- [ ] The interval will be wider.
</br>

### Remarks
N/A </br>

Question 6
----------
To further test the hospital triage system, administrators selected 200 nights and randomly assigned a new triage system to be used on 100 nights and a standard system on the remaining 100 nights. They calculated the nightly median waiting time (MWT) to see a physician. The average MWT for the new system was 4 hours with a standard deviation of 0.5 hours while the average MWT for the old system was 6 hours with a standard deviation of 2 hours. Consider the hypothesis of a decrease in the mean MWT associated with the new treatment. </br>

What does the 95% independent group confidence interval with unequal variances suggest vis a vis this hypothesis? (Because there's so many observations per group, just use the Z quantile instead of the T.) </br>

### Answer
- [ ] When subtracting (old - new) the interval contains 0. The new system appears to be effective.
- [ ] When subtracting (old - new) the interval is entirely above zero. The new system does not appear to be effective.
- [ ] When subtracting (old - new) the interval contains 0. There is not evidence suggesting that the new system is effective.
- [x] When subtracting (old - new) the interval is entirely above zero. The new system appears to be effective.
</br>

### Remarks
Please refer to the following R code for the clarification </br>

```R
## Set up the parameters for standard solution with confidence interval
n_old <- 100
avg_old <- 6
sd_old <- 2
a <- 0.05

## Set up the parameters for new solution.
n_new <- 100
avg_new <- 4
sd_new <- 0.5

## Perform pooled stdev calculation between 2 systems.
sp2 <- ((n_old - 1)*sd_old^2 + (n_new - 1)*sd_new^2) / (n_old + n_new - 2)
sp <- sqrt(sp2)

## Calculate the t-score between the pooled population.
t_score <- qt (1 - (a/2), n_old + n_new - 2)
round((avg_old - avg_new) + c(-1,1) * t_score * sp * (sqrt(1/n_old + 1/n_new)), 2)

## [1] 1.59 2.41
```
</br>

Since this interval is above zero (from old - new), therefore rejecting null hypothesis and conclude that new system does reduce MWTs compared to old systems. </br>

Question 7
----------
Suppose that 18 obese subjects were randomized, 9 each, to a new diet pill and a placebo. Subjects’ body mass indices (BMIs) were measured at a baseline and again after having received the treatment or placebo for four weeks. The average difference from follow-up to the baseline (followup - baseline) was −3 kg/m2 for the treated group and 1 kg/m2 for the placebo group. The corresponding standard deviations of the differences was 1.5 kg/m2 for the treatment group and 1.8 kg/m2 for the placebo group. Does the change in BMI over the four week period appear to differ between the treated and placebo groups?  Assuming normality of the underlying data and a common population variance, calculate the relevant *90%* t confidence interval. Subtract in the order of (Treated - Placebo) with the smaller (more negative) number first. </br>

### Answer
- [x] [-5.364 , -2.636]
- [ ] [2.469 , 5.531]
- [ ] [-5.531 , -2.469]
- [ ] [2.636 , 5.364]
</br>

### Remarks
Please refer to the following R code for the clarification </br>

```R
## Set up the parameters for treated group
n_treat <- 9
avg_treat <- -3
sd_treat <- 1.5


## Set up the parameters for placebo group.
n_place <- 9
avg_place <- 1
sd_place <- 1.8

## Perform pooled stdev calculation between 2 groups
sp <- sqrt(((n_treat - 1)*sd_treat^2 + (n_place - 1)*sd_place^2) / (n_treat + n_place - 2))

## Calculate the t-score interval (for new minus old)
(avg_treat - avg_place) + c(-1,1) * qt(0.95, n_treat + n_place - 2) * s * sqrt(1/n_treat + 1/n_place)

## [1] -5.364 -2.636
```
</br>
