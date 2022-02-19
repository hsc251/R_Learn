# (Working with Dates) Wrangling Data in the Tidyverse Quiz 4 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Tidyverse Skills for Data Science in R Specialization.</br>

Question 1
----------
To obtain the day of the week of your birthday, which function would you use?</br>

### Answer
- [ ] `date()`
- [ ] `weekday()`
- [ ] `day_week()`
- [x] `wday()`
</br>

### Remarks
N/A </br>

Question 2
----------
To obtain the date of the month of your birthday, which function could you use? </br>

### Answer
- [ ] `month_day()`
- [x] `mday()`
- [ ] `day_month()`
- [ ] `day_m()`
</br>

### Remarks
N/A.</br>

Question 3
----------
What information does year("1985-05-04") - year("1988-09-29") give you? </br>

### Answer
- [x] the number of years difference between the two dates
- [ ] the number of seconds difference between the two dates
- [ ] the number of minutes difference between the two dates
- [ ] the number of days difference between the two dates
</br>

### Remarks
N/A </br>

Question 4
----------
What code would you use to tell you what day of the week December 28th, 1992 was? </br>

### Answer
- [ ] wday(ydm("1992-12-28"))
- [ ] mday(ydm("1992-28-12"))
- [ ] mday(ymd("1992-12-28"))
- [x] wday(ymd("1992-12-28"))
</br>

### Remarks
N/A </br>


Question 5
----------
What code would you use to tell you what day of the week May 4th, 1985 was?</br>

### Answer
- [x] wday(ydm("1985-04-05"))
- [ ] wday(ydm("1985-05-04"))
- [ ] mday(ymd("1985-04-05"))
- [ ] mday(ydm("1985-04-05")
</br>

### Remarks
N/A </br>

Question 6
----------
What day of the week was December 28th, 1992? </br>

### Answer
- [x] Monday
- [ ] Sunday
- [ ] Tuesday
- [ ] Saturday
</br>

### Remarks
recall that the values from wday() start with Sunday as 1 </br>

Question 7
----------
What day of the week was May 4th 1985? </br>

### Answer
- [ ] Friday
- [x] Saturday
- [ ] Wednesday
- [ ] Sunday
</br>

### Remarks
the days of the week start numerically on Sunday for the output of wday() </br>
