# (Linear Regression) Modeling Data in the Tidyverse Quiz 3 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Tidyverse Skills for Data Science in R Specialization.</br>

Question 1
----------
In the scatterplot displaying the relationship between your dependent and independent variable, what would indicate that the homoscedasticity assumption has not been met? </br>

### Answer
- [ ] Data points are not Normally distributed
- [ ] The scatterpot demonstrates a negative relationship
- [x] Variance from the regression line are inconsistent
- [ ] There is a single outlier value
</br>

### Remarks
N/A </br>

Question 2
----------
To fit a linear regression model which of the following functions would you use? </br>

### Answer
- [ ] linm()
- [ ] stats()
- [ ] model()
- [x] lm()
</br>

### Remarks
N/A.</br>

Question 3
----------
If your beta coefficient for a model that looked at the relationship between height and weight were 0.2, what would that mean? </br>

For example, using: </br>

```{R}
lm(height ~ weight)
```
</br>

### Answer
- [x] for every 1 lb increase in weight, you would expect height to increase by 0.2 inches.
- [ ] for every 1 lb increase in height, you would expect weight to decrease by 0.2 inches.
- [ ] for every 1 lb increase in weight, you would expect height to increase by 1 inch.
- [ ] for every 1 lb decrease in weight, you would expect height to increase by 0.2 inches.
</br>

### Remarks
N/A </br>

Question 4
----------
What function from what package takes the summary output from a statistical model and organizes it into a tabular output? </br>

### Answer
- [x] the `tidy()` function of the `broom` package
- [ ] the `broom()` function of the `tidy` package
- [ ] the `tidyr()` function of the `broom` package
- [ ] the `broom()` function of the `tidyr` package
</br>

### Remarks
N/A </br>
