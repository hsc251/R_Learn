# (JHU Coursera) Statistical Inference Quiz 4 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Data Science's coursera courses.</br>

Question 1
----------
A pharmaceutical company is interested in testing a potential blood pressure lowering medication. Their first examination considers only subjects that received the medication at baseline then two weeks later. The data are as follows (SBP in mmHg) </br>

Subject | Baseline | Week 2
--- | --- | ---
1 |	140 |	132
2	| 138 |	135
3	| 150 |	151
4 |	148 |	146
5 |	135 |	130

Consider testing the hypothesis that there was a mean reduction in blood pressure? Give the P-value for the associated two sided T test. </br>

(Hint, consider that the observations are paired.) </br>

### Answer
- [ ] 0.043
- [ ] 0.10
- [ ] 0.05
- [x] 0.087
</br>

### Remarks
Refer to the following R code for setup.

```R
## Setup data.frame for table
sub_no <- c(1,2,3,4,5)
base <- c(140,138,150,148,135)
week2 <- c(132,135,151,146,130)
exam <- data.frame(sub_no, base, week2)

## Execute t_test for the paired group comparison between the populations. 
t_test <- t.test(x = exam$base, y = exam$week2, alt = "two.sided", paired = TRUE)
p <- t_test$p.value
round(p,3)

## [1] 0.087
```
</br>

Question 2
----------
A sample of 9 men yielded a sample average brain volume of 1,100cc and a standard deviation of 30cc. What is the complete set of values of μ0 that a test of H0:μ=μ<sub>0</sub> would fail to reject the null hypothesis in a two sided 5% Students t-test? </br>

### Answer
- [ ] 1080 to 1120
- [ ] 1081 to 1119
- [x] 1077 to 1123
- [ ] 1031 to 1169
</br>

### Remarks
Refer to the following R code to see the calculated result. </br>

```R
## Setup the mean, sample size and standard deviation.
n <- 9
μ <- 1100
σ <- 30

## Setup calculation for confidence interval
quant = 0.975 ## Have confidence interval is 95% (2.5% on both sides) 
CI = μ + c(-1,1) * qt(quant, df = n - 1) * σ / sqrt(n)
print(round(CI))

## [1] 1077 1123
```
</br>

Question 3
----------
Researchers conducted a blind taste test of Coke versus Pepsi. Each of four people was asked which of two blinded drinks given in random order that they preferred. The data was such that 3 of the 4 people chose Coke. Assuming that this sample is representative, report a P-value for a test of the hypothesis that Coke is preferred to Pepsi using a one sided exact test. </br>

### Answer
- [x] 0.31
- [ ] 0.62
- [ ] 0.005
- [ ] 0.10
</br>

### Remarks
Refer to the following R code to see the calculated result. </br>

```R
## Setup the mean, sample size and standard deviation for binomial test.
n <- 4
x <- 3
b <- binom.test(x = x, n = n, alt = "greater")
round(b$p.value, 2)

## [1] 0.31
```
</br>

![](https://github.com/hsc251/RLearn/blob/master/06_Statistical_Inference/quiz/JHU06_quiz4_q3exp.jpg) </br>

Question 4
----------
Infection rates at a hospital above 1 infection per 100 person days at risk are believed to be too high and are used as a benchmark. A hospital that had previously been above the benchmark recently had 10 infections over the last 1,787 person days at risk. About what is the one sided P-value for the relevant test of whether the hospital is *below* the standard? </br>


### Answer
- [ ] 0.22
- [ ] 0.52
- [x] 0.03
- [ ] 0.11
</br>

### Remarks
Refer to the following R code to see the calculated result. </br>

```R
## Set up the parameters for poisson rate, error and days.
rate <- 1/100
err <- 10
days <- 1787

## Perform poisson test and round up the p-value
test <- poisson.test(err, T = days, r = rate, alt = "less")
round(test$p.value, 2)

## [1] 0.03
```
</br>

Question 5
----------
Suppose that 18 obese subjects were randomized, 9 each, to a new diet pill and a placebo. Subjects’ body mass indices (BMIs) were measured at a baseline and again after having received the treatment or placebo for four weeks. The average difference from follow-up to the baseline (followup - baseline) was −3 kg/m2 for the treated group and 1 kg/m2 for the placebo group. The corresponding standard deviations of the differences was 1.5 kg/m2 for the treatment group and 1.8 kg/m2 for the placebo group. Does the change in BMI appear to differ between the treated and placebo groups? Assuming normality of the underlying data and a common population variance, give a p-value for a two sided t test. </br>

### Answer
- [ ] Less than 0.05, but larger than 0.01
- [ ] Larger than 0.10
- [x] Less than 0.01
- [ ] Less than 0.10 but larger than 0.05
</br>

### Remarks
Refer to the following R code to see the calculated result. </br>

```R
## Setup the treated group parameters (sample size, standard deviation and mean differences)
nt <- 9 # sample size
μt <- -3 # mean differences
σt <- 1.5 #stdev

## Setup the placebo group parameters (sample size, standard deviation and mean differences)
np <- 9 # sample size
μp <- 1 # mean differences
σp <- 1.8 # stdev

## Calculate pooled standard deviation.
σp <- ((nt-1)*σt^2 + (np-1)*σp^2)/(nt+np-2)
p <- pt((μt - μp) / (σp * (1/np + 1/nt)^0.5), df = nt+np-2)
print(p)

## [1] 0.003504094
```
</br>

Question 6
----------
Brain volumes for 9 men yielded a 90% confidence interval of 1,077 cc to 1,123 cc. Would you reject in a two sided 5% hypothesis test of H0:μ=1,078?</br>

### Answer
- [ ] Yes you would reject.
- [ ] It's impossible to tell.
- [x] No you wouldn't reject.
- [ ] Where does Brian come up with these questions?

### Remarks
N/A </br>

Question 7
----------
Researchers would like to conduct a study of 100 healthy adults to detect a four year mean brain volume loss of .01 mm<sup>3</sup>. Assume that the standard deviation of four year volume loss in this population is .04 mm<sup>3</sup>. About what would be the power of the study for a 5% one sided test versus a null hypothesis of no volume loss? </br>

### Answer
- [ ] 0.70
- [ ] 0.50
- [ ] 0.60
- [x] 0.80
</br>

### Remarks
Please refer to the following R code for the clarification </br>

```R
## Setup the mean, standard deviation, sigma value.
n <- 100 #subject
μ <- 0.01 # m^3 brain volume loss mean
σ <- 0.04 # m^3 brain volume loss std. dev.
p <- 0.05 # sigma level

## Calculate the power of interval with given information
pow <- power.t.test(n=n, delta=μ, sd=σ , sig.level=p, type="one.sample", alt="one.sided")$power
round(pow, 2)

## [1] 0.8
```
</br>

Question 8
----------
Researchers would like to conduct a study of n healthy adults to detect a four year mean brain volume loss of .01 mm<sup>3</sup>. Assume that the standard deviation of four year volume loss in this population is .04 mm<sup>3</sup>. About what would be the value of n needed for 90% power of type one error rate of 5% one sided test versus a null hypothesis of no volume loss? </br>

### Answer
- [ ] 160
- [ ] 180
- [x] 140
- [ ] 120
</br>

### Remarks
Please refer to the following R code for the clarification </br>

```R
## Setup the mean, standard deviation, sigma value and power interval
μ <- 0.01 # m^3 brain volume loss mean
σ <- 0.04 # m^3 brain volume loss std. dev.
p <- 0.05 # sigma level
pow <- 0.9 # power interval

## Calculate the sample size based on the power t test results.
n <- power.t.test(power = pow, delta=μ, sd=σ , sig.level=p, type="one.sample", alt="one.sided")$n
ceiling(n/10)*10

## [1] 140
```
</br>

Question 9
----------
As you increase the type one error rate, α, what happens to power? </br>

### Answer
- [ ] You will get smaller power.
- [ ] It's impossible to tell given the information in the problem.
- [x] You will get larger power.
- [ ] No, for real, where does Brian come up with these problems?
</br>

### Remarks
As you require less evidence to reject, i.e. your α rate goes up, you will have larger power. </br>
