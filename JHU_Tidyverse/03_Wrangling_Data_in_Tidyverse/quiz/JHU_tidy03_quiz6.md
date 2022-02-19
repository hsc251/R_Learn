# (Functional Programming) Wrangling Data in the Tidyverse Quiz 6 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Tidyverse Skills for Data Science in R Specialization.</br>

Question 1
----------
If you wanted to calculate the standard deviation for all the variables in the **mtcars** dataset, what code would you use?</br>

### Answer
- [ ] map_sd(mtcars)
- [x] map_dbl(mtcars,sd)
- [ ] map(sd, mtcars)
- [ ] map_dbl(sd, mtcars)
</br>

### Remarks
N/A </br>

Question 2
----------
If we wanted to calculate the miles per gallon per cylinder using the mtcars data, how could we do this using the `map2_dbl()` function of the `purrr` package. </br>

### Answer
- [ ] map(mtcars$mpg, mtcars$cyl, ~(.x/.y))
- [x] map2_dbl(mtcars$mpg, mtcars$cyl, ~(.x/.y))
- [ ] map2(mtcars$mpg, mtcars$cyl, ~(.y/.x))
- [ ] map_dbl(mtcars$mpg, mtcars$cyl, ~(.x/.y))
</br>

### Remarks
N/A.</br>
