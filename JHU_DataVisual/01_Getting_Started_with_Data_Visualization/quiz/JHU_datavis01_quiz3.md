# (Dataframes and Importing Data in R) Getting Started with Data Visualization in R Quiz 3 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Data Visualization & Dashboarding with R Specialization.</br>

Question 1
----------
What happens if you run this code? </br>

`data.frame(alpha,beta)` </br>

### Answer
- [x] You are asking R to display a data frame with alpha and beta in the R console.
- [ ] You are creating a data frame with alpha and beta and saving it to the R environment.
- [ ] You are asking R whether the objects alpha and beta are data frames.
</br>

### Remarks
If you want to save the data frame to an object, you would do something like: </br>
`my_df <- data.frame(alpha,beta)` </br>

Question 2
----------
What part of the data frame "states" does this code call? </br>

`states[15,2]`

### Answer
- [ ] The entry of the second row down in the 15th column from the left.
- [x] The entry of the 15th row down in the second column from the left.
- [ ] The entry of the 15th row down in the second column from the right.
</br>

### Remarks
N/A </br>

Question 3
----------
Say you have a data frame named "inventory" with 3 rows and two columns, created like this: </br>

```{R}
home <- c("computer","calculator","scanner")
office <- c("paper","pens","pencils")

inventory <- data.frame(home,office)
```
</br>

What would happen if you ran this code? </br>

`inventory$annex` <- c("printer","stapler") </br>

### Answer
- [x] You'll get an error message because you are trying to add a column that only has two rows.
- [ ] A new row with the rowID office will be added to the data.
- [ ] You'll get a new column called office populated by "printer" and "stapler."
</br>

### Remarks
N/A </br>

Question 4
----------
How many working directories can you have set simultaneously in an R session? </br>

### Answer
- [x] One
- [ ] Two
- [ ] Unlimited
</br>

### Remarks
N/A </br>

Question 5
----------
Is it easier to import rectangular or non-rectangular data into R? </br>

### Answer
- [ ] Non-Rectangular
- [x] Rectangular
</br>

### Remarks
Rectangular data like a .csv file is the easiest kind of data to work with in R. </br>
