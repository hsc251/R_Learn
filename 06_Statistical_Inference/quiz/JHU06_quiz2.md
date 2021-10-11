# (JHU Coursera) Statistical Inference Quiz 2 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Data Science's coursera courses.</br>

Question 1
----------
What is the variance of the distribution of the average an IID draw of n observations from a population with mean μ and variance σ<sup>2</sup>. </br>

(Hints look at lecture 2 around 5:30 and chapter 4 problem 4). </br>

### Answer
- [x] σ<sup>2 / n
- [ ] σ / n
- [ ] σ<sup>2
- [ ] 2σ / sqrt(n)
</br>

### Remarks
For variance of X of sample would be the square of standard deviation divide by the sample size.

Question 2
----------
Suppose that diastolic blood pressures (DBPs) for men aged 35-44 are normally distributed with a mean of 80 (mm Hg) and a standard deviation of 10. About what is the probability that a random 35-44 year old has a DBP less than 70? </br>

### Answer
- [ ] 32%
- [ ] 8%
- [ ] 22%
- [x] 16%
</br>

### Remarks
Refer to the following R code to see the calculated result. </br>

```R
pnorm(70, mean = 80, sd = 10)

## [1] 0.1587
```

Question 3
----------
Brain volume for adult women is normally distributed with a mean of about 1,100 cc for women with a standard deviation of 75 cc. What brain volume represents the 95th percentile? </br>

### Answer
- [x] approximately 1223
- [ ] approximately 1247
- [ ] approximately 1175
- [ ] approximately 977
</br>

### Remarks
Refer to the following R code to see the calculated result. </br>

```R
qnorm(0.95, mean = 1100, sd = 75)

## [1] 1223
```

Question 4
----------
Refer to the previous question. Brain volume for adult women is about 1,100 cc for women with a standard deviation of 75 cc. Consider the sample mean of 100 random adult women from this population. What is the 95th percentile of the distribution of that sample mean? </br>

### Answer
- [ ] approximately 1112 cc
- [ ] approximately 1110 cc
- [ ] approximately 1115 cc
- [ ] approximately 1088 cc
</br>

### Remarks
Refer to the following R code to see the calculated result. </br>

```R
qnorm(0.95, mean = 1100, sd = 75/sqrt(100))

## [1] 1112
```


Question 5
----------
You flip a fair coin 5 times, about what's the probability of getting 4 or 5 heads? </br>

### Answer
- [ ] 3%
- [ ] 12%
- [ ] 6%
- [ ] 19%
</br>

### Remarks
Refer to the following R code for setup and the justification for binomial distribution</br>

```R
pbinom(3, size = 5, prob = 0.5, lower.tail = FALSE)

## [1] 0.1875
```
</br>

Question 6
----------
The respiratory disturbance index (RDI), a measure of sleep disturbance, for a specific population has a mean of 15 (sleep events per hour) and a standard deviation of 10. They are not normally distributed. Give your best estimate of the probability that a sample mean RDI of 100 people is between 14 and 16 events per hour? </br>

### Answer
- [ ] 95%
- [x] 68%
- [ ] 34%
- [ ] 47.5%
</br>

### Remarks
The standard error of the mean is 10 / sqrt(100) = 1, therefore between 14 and 16 is with one standard deviation of the mean of the distribution of the sample mean. Thus it should be about 68%. </br>

```R
pnorm(16, mean = 15, sd = 1) - pnorm(14, mean = 15, sd = 1)

## [1] 0.6827
```
</br>

Question 7
----------
Consider a standard uniform density. The mean for this density is .5 and the variance is 1 / 12. You sample 1,000 observations from this distribution and take the sample mean, what value would you expect it to be near? </br>

### Answer
- [ ] 0.10
- [ ] 0.25
- [x] 0.5
- [ ] 0.75
</br>

### Remarks
Via the LLN it should be near .5. </br>

Question 8
----------
The number of people showing up at a bus stop is assumed to be Poisson with a mean of 5 people per hour. You watch the bus stop for 3 hours. About what's the probability of viewing 10 or fewer people? </br>

### Answer
- [x] 0.12
- [ ] 0.08
- [ ] 0.06
- [ ] 0.03
</br>

### Remarks
Please refer to the following R code for calculation </br>
```R
ppois(10, lambda = 15)

## [1] 0.1185
```
