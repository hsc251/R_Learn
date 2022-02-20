# (Tidyverse Introduction) Getting Started with Data Visualization in R Quiz 5 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Data Visualization & Dashboarding with R Specialization.</br>

Question 1
----------
What do you need to do to use tidyverse commands in R? </br>

### Answer
- [ ] Run install.packages("tidyverse") every time you want to use the tidyverse commands.
- [x] Use the library(tidyverse) command in your R script or R console, after you have installed the tidyverse.
- [ ] Go to tidyverse.org and download the tidyverse package
</br>

### Remarks
After you have installed the tidyverse the first time you use it, from that point on you load the tidyverse functions using library(tidyverse).</br>

Question 2
----------
When you the run the line: </br>

```{R}
dat <- read_csv("my_data.csv") </br>
```

what kind of object is dat? </br>

### Answer
- [ ] Data frame
- [x] Tibble
- [ ] Matrix
- [ ] tidyframe
</br>

### Remarks
The tidyverse uses tibbles. read_csv is a tidyverse command, so it creates tibbles. </br>

Question 3
----------
Which is NOT a principle of tidy data? </br>

### Answer
- [ ] Each observation forms a row.
- [ ] Each variable forms a column.
- [x] There is no missing data.
- [ ] Each type of observational unit forms a table
</br>

### Remarks
Although it is not ideal, having missing data does NOT violate a princple of tidy data. </br>

Question 4
----------
If there is missing data in a .csv file that you import, what should you do? </br>

### Answer
- [ ] You can ignore it and use drop_na().
- [x] Assess whether you can collect new data to fill in the gaps.
- [ ] Abandon your project.
</br>

### Remarks
When you have missing data, you have to carefully evaluate how much data is missing and try to assess whether you can fill in those gaps. Sometimes, you can proceed with your analysis - but always be transparent about how you are addressing the missing data. </br>

Question 5
----------
The tidyverse replaces the techniques for manipulating data with base R. </br>

### Answer
- [ ] TRUE
- [x] FALSE
</br>

### Remarks
The tidyverse contains many valuable tools that expand on base R's capabilities, but it is best viewed as a complement to base R. You will want use many different functions to manipulate data in R, and keep in mind that there are many equivalent ways of accomplishing the same tasks. </br>

Question 6
----------
According to Wickham, which of these are steps in the data wrangling process? </br>

### Answer
- [ ] Model
- [x] Import
- [ ] Understand
- [x] Transform
- [x] Tidy
</br>

### Remarks
N/A </br>

Question 7
----------
Which of these are advantages of tibbles over data frames? </br>

### Answer
- [ ] You cannot change a tibble into a data frame.
- [x] Tibbles work well with other tidyverse functions.
- [x] When you run a tibble in the R console, it will only show you a preview of the data.
</br>

### Remarks
N/A </br>

Question 8
----------
Looking at tidyverse.org, how many core packages are included in the tidyverse? </br>

### Answer
8

### Remarks
The tidyverse is composed of eight different packages that help with various data wrangling functions. We will cover commands from several of these packages, but not all of them. </br>
