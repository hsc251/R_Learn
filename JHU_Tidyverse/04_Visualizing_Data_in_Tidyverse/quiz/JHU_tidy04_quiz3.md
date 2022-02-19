# (Introduction to ggplot2) Visualizing Data in the Tidyverse Quiz 3 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Tidyverse Skills for Data Science in R Specialization.</br>

Question 1
----------
Which of these is **NOT** required when plotting in *ggplot2*? </br>

### Answer
- [x] the shape you want to use
- [ ] an aesthetic (aes) specified
- [ ] `ggplot()` function call
- [ ] the geom you want to plot
</br>

### Remarks
N/A </br>

Question 2
----------
Which geom would you specify to generate a scatterplot?</br>

### Answer
- [ ] geom_scatter()
- [x] geom_point()
- [ ] geom_histogram()
- [ ] geom_point_scatter()
</br>

### Remarks
N/A.</br>

Question 3
----------
Which geom would you specify to generate a barplot?</br>

### Answer
- [ ] geom_barplot()
- [ ] geom_abline()
- [x] geom_bar()
- [ ] geom_scatter()
</br>

### Remarks
N/A </br>

Question 4
----------
Which geom would you specify if you wanted to know how many individuals in a data set fell into each level of a categorical variable?</br>

### Answer
- [ ] geom_smooth()
- [x] geom_bar()
- [ ] geom_curve()
- [ ] geom_scatter()
</br>

### Remarks
N/A </br>

Question 5
----------
Which geom would you specify if you wanted to know how the distribution of values in a single numeric variable? </br>

### Answer
- [ ] geom_frequency()
- [x] geom_histogram()
- [ ] geom_boxplot()
- [ ] geom_scatterplot()
</br>

### Remarks
N/A </br>

Question 6
----------
If you were to run the following code, what color would the points be? </br>

```{R}
ggplot(data = diamonds, aes(x = carat, y = price, color = "blue")) + geom_point()
```
</br>

### Answer
- [x] coral
- [ ] blue
- [ ] gray
</br>

### Remarks
N/A </br>

Question 7
----------
If you were to run the following code, what color would the points be? </br>

```{R}
ggplot(data = diamonds, aes(x = carat, y = price), color = "blue") + geom_point()
```
</br>

### Answer
- [x] black
- [ ] gray
- [ ] coral
</br>

### Remarks
N/A </br>

Question 8
----------
If you were to run the following code, what color would the points be? </br>

```{R}
ggplot(data = diamonds, aes(x = carat, y = price)) + geom_point(color = "blue")
```
</br>

### Answer
- [ ] coral
- [x] blue
- [ ] gray
</br>

### Remarks
N/A </br>

Question 9
----------
What does the alpha argument change in the plot generated from this code? </br>

```{R}
ggplot(data = diamonds) + 
  geom_point(mapping = aes(x = carat, y = price, alpha = clarity))
```
</br>

### Answer
- [ ] change points to the greek letter "alpha"
- [ ] shades points with IF being the lightest and I1 being the darkest
- [x] shades points with IF points the darkest and I1 being the lightest
- [ ] highlights points of the most common category within clarity
</br>

### Remarks
N/A </br>
