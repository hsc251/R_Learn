# (Data Wrangling) Wrangling Data in the Tidyverse Quiz 2 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Tidyverse Skills for Data Science in R Specialization.</br>

Question 1
----------
What package and function should you use to change the order of the values of a variable?</br>

### Answer
- [ ] The `order()` function of the **reorder** package.
- [ ] The `reorder()` function of the **dplyr** package.
- [x] The `arrange()` function of the **dplyr** package.
- [ ] The `sort()` function of the **tidyr** package.
</br>

### Remarks
N/A </br>

Question 2
----------
What function of what package should you use to create a new column or variable? </br>

### Answer
- [x] The `mutate()` function of the **dplyr** package.
- [ ] The `new_var()` function of the **tidyr** package.
- [ ] The `mutate()` function of the **tidyr** package.
- [ ] The `new_col()` function of the **dplyr** package.
- [ ] The `new_col()` function of the **tidyr** package.
- [ ] The `new_var()` function of the **dplyr** package.
</br>

### Remarks
N/A.</br>

Question 3
----------
If you were to select only the cars in the mtcars dataset with horsepower > 100 using the code newdata <- mtcars %>% filter(hp>100), how many cars would be left in your data frame? </br>

### Answer
- [ ] 15
- [ ] 30
- [ ] 0
- [x] 23
</br>

### Remarks
N/A </br>

Question 4
----------
Which car has the lowest mpg value in the mtcars dataset? </br>

### Answer
- [ ] Pontiac Firebird
- [ ] Fiat X1-9
- [x] Cadillac Fleetwood
- [ ] Chrysler Imperial
- [ ] Honda Civic
</br>

### Remarks
N/A </br>


Question 5
----------
If you had six different variables in the columns of a dataset (df) and wanted to select three of them (height, weight, bmi) and display them in alphabetical order, which of these would achieve that? </br>

### Answer
- [ ] *df %>% filter(height, weight, bmi)*
- [ ] *arrange(bmi, height, weight)*
- [x] *df %>% select(bmi, height, weight)*
- [ ] *filter(bmi, height, weight)*
- [ ] *df %>% mutate(bmi, height, weight)*
</br>

### Remarks
N/A </br>

Question 6
----------
If you had six different variables in the columns of a dataset (**df**) and wanted to order the data frame by **height**, then by **weight**, and then by **bmi**, which of these would you use? </br>

### Answer
- [x] *df %>% arrange(height, weight, bmi)*
- [ ] *df %>% filter(height, weight, bmi)*
- [ ] *df %>% select(height, weight, bmi)*
- [ ] *df %>% mutate(height, weight, bmi)*
</br>

### Remarks
N/A </br>
