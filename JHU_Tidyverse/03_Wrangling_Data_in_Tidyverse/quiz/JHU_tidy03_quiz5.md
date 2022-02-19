# (Working with Strings) Wrangling Data in the Tidyverse Quiz 5 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Tidyverse Skills for Data Science in R Specialization.</br>

Question 1
----------
Using the following object</br>

```{r}
colors <- c('red','orange','yellow','green','blue','violet','#C8C8C8','#000000')
```
</br>

Note: be sure to copy the entire vector. It ends with a closed parenthesis. </br>

To return the value 'TRUE' for each string that contains numbers in the object colors, which would you use?</br>

### Answer
- [ ] `str_view(colors, '\\d')`
- [ ] `str_extract(colors, '\\d')`
- [x] `str_detect(colors, '\\d')`
- [ ] `str_extract(colors, '[0-9]')`
</br>

### Remarks
N/A </br>

Question 2
----------
To return the values of each string that contains numbers in the object colors (in Question 1), which would you use? </br>

### Answer
- [x] `str_subset(colors, '[0-9]')`
- [ ] `str_extract(colors, '\\d')`
- [ ] `str_detect(colors, '[0-8]')`
- [ ] `str_view(colors, '\\d')`
</br>

### Remarks
N/A.</br>

Question 3
----------
To print the values of the colors object that start with a lowercase letter, which would you use? </br>

### Answer
- [ ] `str_detect(colors, '[a-z]')`
- [ ] `str_extract(colors, '[a-z]')`
- [x] `str_subset(colors, '^[a-z]')`
- [ ] `str_extract(colors, '^[[:lower:]]')`
</br>

### Remarks
N/A </br>

Question 4
----------
To print the number of lowercase letters in each string within colors, which would you use? </br>

### Answer
- [ ] `str_detect(colors, '[a-z]')`
- [x] `str_count(colors, '[a-z]')`
- [ ] `str_count(colors, '[A-Z]')`
- [ ] `str_detect(colors, '^[a-z]')`
</br>

### Remarks
N/A </br>


Question 5
----------
What does str_view_all(colors, "\\d+[A-Z]+") match?</br>

### Answer
- [ ] any uppercase letter
- [ ] one digit followed by one capital letter
- [x] one or more digits followed by one or more capital letters
- [ ] a string consisting of only uppercase letters
</br>

### Remarks
N/A </br>

Question 6
----------
What does **str_count(colors, '[a-zA-Z]')** accomplish? </br>

### Answer
- [ ] counts the number of capital letters in each string
- [ ] counts the number of lowercase letters in each string
- [x] prints the number of letters in each string
- [ ] prints the number of lowercase letters followed by uppercase letters in each string
</br>

### Remarks
N/A </br>

Question 7
----------
If you were to identify which strings start with #, what would you use? </br>

### Answer
- [x] `str_view_all(colors, '^#')`
- [ ] `str_view_all(colors, '#^')`
- [ ] `str_view_all(colors, '$#')`
- [ ] `str_view_start(colors, '#')`
</br>

### Remarks
N/A </br>

Question 8
----------
Using, `str_view_all()`, how would you only highlight strings that start with a vowel? </br>

### Answer
- [x] `str_view_all(colors, "^[aeiou]")`
- [ ] `str_view_all(colors, "^[royg]")`
- [ ] `str_view_all(colors, "^[letters]")`
- [ ] `str_view_all(colors, "^[vowels]")`
</br>

### Remarks
N/A </br>
