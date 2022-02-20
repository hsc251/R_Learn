# (Manipulating Variables and Creating Summaries) Getting Started with Data Visualization in R Quiz 6 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Data Visualization & Dashboarding with R Specialization.</br>

Question 1
----------
Say I have an tibble called "cities" with columns including population ("population"), a measure of economic activity ("gdp"), and the state in which the city is located ("state"). </br>

Which of these commands would select rows from the dataset where the value for population is more than 3,000, the value for economic activity is less than 120,000 and where the city is not located in Alabama? </br>

### Answer
- [x] filter(cities,population>3000 & gdp<120000 & state!="Alabama")
- [ ] filter(cities,population>3000 & gdp<120000 | state!="Alabama")  
- [ ] filter(cities,population>3000, gdp<120000, state!="Alabama") 
- [ ] select(cities,population>3000 & gdp<120000 & state!="Alabama")
</br>

### Remarks
N/A </br>

Question 2
----------
Let's say you have a dataset that looks like this: </br>

```{R}
colors <- c("red","green","yellow")
speeds <- c("slow","fast","medium")
my_dat <- data.frame(colors,speeds)
```
</br>

What is the correct code to recode the "colors" column so that red equals 0, green equals 2, and yellow equals 1? </br>

### Answer
- [ ] my_dat$colors<-recode(my_dat$colors,"red"==0,"green"==2,"yellow"==1)
- [ ] my_dat$colors<-recode(my_dat$colors,0=red,2=green,1=yellow)
- [x] my_dat$colors<-recode(my_dat$colors,"red"=0,"green"=2,"yellow"=1)
</br>

### Remarks
N/A </br>

Question 3
----------
Let's say you have a tibble named "dat" that has a time, date, employee, and sales column. </br>

You are reviewing someone's R code and see the following lines: </br>

```{R}
my_time <- filter(dat,time==1)

my_time_and_date <- filter(my_time,date>5)

group_by_employee_my_time_and_date <- group_by(my_time_and_date,employee)

summarise(group_by_employee_my_time_and_date ,average=mean(sales))
```

Which of these would do the same thing using piping? </br>

### Answer
- [ ] dat %>% filter(time==1 & date >5) %>% group_by(employee) %>% summary(average=mean(sales))
- [ ] summarise(average=mean(sales)%>%dat %>% filter(time==1 & date >5) %>% group_by(employee)
- [x] dat %>% filter(time==1 & date >5) %>% group_by(employee) %>% summarise(average=mean(sales))
- [ ] dat %>% filter(time=1 & date >5) %>% group_by(employee) %>% summarise(average=mean(sales))
</br>

### Remarks
N/A. </br>

Question 4
----------
You have a data frame named "dat" with two numeric columns, value1 and value2. You want to add a third column called my_value where the value in each row is the product of multiplying the other two values in the row by one another. Which is the correct line of code? </br>

### Answer
- [ ] `add_column(dat,my_value=value1*value2)`
- [x] `dat<- mutate(dat,my_value=value1*value2)`
- [ ] `new_column(dat,my_value=value1*value2)`
- [ ] `mutate(dat,my_value=value1*value2)`
</br>

### Remarks
N/A. </br>

Question 5
----------
Say you have a tibble saved into your R environment as "my_dat" with two columns named "alpha" and "beta". You want to rename the "beta" column and call it "gamma". Which of these will create a new tibble with the renamed column? </br>

### Answer
- [ ] mutate(my_dat,gamma=beta)  
- [ ] rename(my_dat,beta=gamma)
- [x] rename(my_dat,gamma=beta)  
- [ ] recode(my_dat,gamma=beta) 
</br>

### Remarks
N/A. </br>

Question 6
----------
Say you have a tibble saved to the object my_dat with two columns, alpha and beta. These are filled with numeric data. Which of these will arrange the data in descending order by alpha?</br>

### Answer
- [x] arrange(my_dat,desc(alpha))
- [x] my_dat %>% arrange(desc(alpha))
- [ ] desc(arrange(alpha,my_dat))
- [ ] my_dat %>% arrange(alpha)
</br>

### Remarks
N/A. </br>

Question 7
----------
Which of these accurately describes piping? </br>

### Answer
- [x] Piping allows you to write cleaner, more readable code.
- [x] Piping will pass data on the left hand side of the pipe to the function on the right hand side of the pipe.
- [ ] Piping will pass data on the right hand side of the pipe to the function on the left hand side of the pipe.
- [ ] Piping is an advanced technique that only experience programmers should use.
</br>

Question 8
----------
What's the point of using group_by()? </br>

### Answer
- [ ] Grouping your data create several new tibbles by group.
- [x] Grouping your data allows you to use those groups when summarizing data.
- [ ] Grouping your data allows you to keep track of large data sets in the R environment.
- [ ] Grouping your data will create a new column in the data that allows you to manage groups.
</br>

### Remarks
N/A. </br>
