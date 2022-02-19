# (Working with Factors) Wrangling Data in the Tidyverse Quiz 3 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Tidyverse Skills for Data Science in R Specialization.</br>

Question 1
----------
If you wanted to re-order the levels of a factor variable to be ordered by frequency of that variable in the dataset, what function would you use?</br>

### Answer
- [ ] fct_refreq()
- [ ] fct_tabyl()
- [x] fct_infreq()
- [ ] fct_reorder()
- [ ] fct_forcat()
</br>

### Remarks
N/A </br>

Question 2
----------
If you wanted to re-order the levels of a factor variable by hand, what function would you use? </br>

### Answer
- [x] fct_recode()
- [ ] fct_forcat()
- [ ] fct_refreq()
- [ ] fct_tabyl()
- [ ] fct_reorder()
</br>

### Remarks
N/A.</br>

Question 3
----------
Assuming you have a dataframe (**df**) with two columns: **car**, and **size**, what would the code **df %>% fct_reorder(car, size)** accomplish? </br>

### Answer
- [x] the levels of the variable car would be based on their median value of the size variable 
- [ ] sort the data frame of car by size
- [ ] arranges the data frame of car by size
- [ ] reorder the levels of the variable size based on their median car
- [ ] sort the data frame of size by car
</br>

### Remarks
N/A </br>

Question 4
----------
If you were working with the iris dataset in r, which functions would you use to add a new column to the dataframe and change the levels of the Species variable? </br>

### Answer
- [ ] `mutate()` and `fct_update_order()`
- [ ] `new_col()` and `fct_inorder()`
- [ ] `filter()` and `fct_recode()`
- [x] `mutate()` and `fct_recode()`
</br>

### Remarks
N/A </br>
