# (JHU Coursera) R Programming Quiz 4 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Data Science's coursera courses for beginner.</br>

Question 1
----------
What is produced at the end of this snippet of R code? </br>

```R
set.seed(1)
rpois(5, 2)
```
</br>

### Answer
- [x] A vector with the numbers 1,1,2,4,1
- [ ] It is impossible to tell because the result is random
- [ ] A vector with the numbers 3.3, 2.5, 0.5, 1.1, 1.7
- [ ] A vector with the numbers 1,4,1,1,5
</br>

### Remarks
Since `set.seed()` function was applied, `rpois()` will always display the same vector in this particular code..</br>

Question 2
----------
What R function can be used to generate standard Normal random variables? </br>

### Answer
- [ ] qnorm
- [x] rnorm
- [ ] pnorm
- [ ] dnorm
</br>

### Remarks
Function begin with 'r' prefix are applied for random variable simulation.</br>

Question 3
----------
When simulating data, why is using the `set.seed()` function important? </br>

### Answer
- [ ] It ensures that the sequence of random numbers is truly random.
- [x] It can be used to specify which random number generating algorithm R should use, ensuring consistency and reproducibility.
- [ ] It ensures that the random numbers generated are within specified boundaries.
- [ ] It can be used to generate non-uniform random numbers.
</br>

### Remarks
N/A.</br>

Question 4
----------
Which function can be used to evaluate the inverse cumulative distribution function for the Poisson distribution? </br>

### Answer
- [x] qpois
- [ ] dpois
- [ ] rpois
- [ ] ppois
</br>

### Remarks
Probability distribution functions begin with 'q' prefix are used to evaluate quantile (*inverse cumulative distribution*) function) </br>

Question 5
----------
What does the following code do? </br>

```R
set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
```
</br>

### Answer
- [ ] Generate random exponentially distributed data
- [x] Generate data from a Normal linear model
- [ ] Generate data from a Poisson generalized linear model
- [ ] Generate uniformly distributed random data
</br>

### Remarks
N/A. </br>

Question 6
----------
What R function can be used to generate Binomial random variables? </br>

### Answer
- [ ] qbinom
- [ ] dbinom
- [ ] pbinom
- [x] rbinom
</br>

### Remarks
N/A </br>

Question 7
----------
What aspect of the R runtime does the profiler keep track of when an R expression is evaluated? </br>

### Answer
- [x] the function call stack
- [ ] the working directory
- [ ] the global environment
- [ ] the package search list
</br>

### Remarks
N/A </br>

Question 8
----------
Consider the following R code </br>

```R
library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)
```
</br>

(Assume that y, x1, and x2 are present in the workspace.) Without running the code, what percentage of the run time is spent in the `lm` function, based on the `by.total` method of normalization shown in `summaryRprof()`? </br>


### Answer
- [x] 100%
- [ ] It is not possible to tell
- [ ] 50%
- [ ] 23%
</br>

### Remarks
When using `by.total` normalization, the top-level function (in this case, `lm()`) always takes 100% of the time. </br>

Question 9
----------
When using `system.time()`, what is the user time? </br>

### Answer
- [ ] It is the "wall-clock" time it takes to evaluate an expression
- [ ] It is a measure of network latency
- [ ] It is the time spent by the CPU waiting  for other tasks to finish
- [x] It is the time spent by the CPU evaluating an expression
</br>

### Remarks
N/A </br>

Question 10
-----------
If a computer has more than one available processor and R is able to take advantage of that, then which of the following is true when using `system.time()`? </br>

### Answer
- [ ] user time is 0
- [ ] elapsed time is 0
- [x] elapsed time may be smaller than user time
- [ ] user time is always smaller than elapsed time
</br>

### Remarks
N/A </br>
