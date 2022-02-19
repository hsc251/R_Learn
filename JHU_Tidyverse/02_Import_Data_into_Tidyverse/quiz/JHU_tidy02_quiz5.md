# (Importing Data into R Project) Import Data into Tidyverse Quiz 5 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Tidyverse Skills for Data Science in R Specialization.</br>

Question 1
----------
Question 1
For this question you will need to read the `excel_data.xlsx` file into R using the `readxl` package. There are two sheets in this spreadsheet file named "Sheet1" and "Sheet2". Use the `readxl` package to read in "Sheet2" from the spreadsheet file directly and answer the question below. Recall that the [[ operator can be used to subset a column of tibble or data frame.</br>

What is the mean of the column labeled "X12" in "Sheet2"? You can use the mean() function to compute the mean of a column. (Choose the closest answer.)</br>

### Answer
- [ ] 7.41
- [x] -4.03
- [ ] -8.32
- [ ] 2.75
</br>

### Remarks
See the following R-code chunk to calculate </br>
```{r}
library(readxl)
excel1 <- read_excel("excel_data.xlsx", sheet = "Sheet1")
excel2 <- read_excel("excel_data.xlsx", sheet = "Sheet2")
mean(excel2$X12)
```
</br>


Question 2
----------
Continuing from Question 1 above, use the `readxl` package to read in both "Sheet1" and "Sheet2" from the excel_data.xlsx file. </br>

What is the correlation between column "X5" in "Sheet1" and column "X8" in "Sheet2"? Use the cor() function to compute the correlation between two columns. (Choose the closest answer.)</br>

### Answer
- [ ] 0.356
- [ ] 0.073
- [x] -0.037
- [ ] -0.612
</br>

### Remarks
See the following R-code chunk to calculate </br>
```{r}
cor(excel1$X5, excel2$X8)
```
</br>

Question 3
----------
For this question you will need to read in the database file sqlite_data.db using the `RSQLite` package. In this database file there is table named "table1". You will need to read that table to answer this question. </br>

The "ID" column in "table1" serves as and identification number for elements in the database table. What is the correlation between columns "S2" and "S3" for rows with ID equal to 8 only? (Hint: There should be 100 rows where ID = 8.) </br>

### Answer
- [x] 0.219
- [ ] -0.478
- [ ] 0.912
- [ ] -0.332
</br>

### Remarks
See the following R-code chunk to calculate </br>
```{r}
library(RSQLite)
library(dplyr)
library(dbplyr)

con <- dbConnect(drv=RSQLite::SQLite(), dbname = "sqlite_data.db")
dbListTables(con)

## Read Table from Connection 
table1 <- dbReadTable(con, "table1")

## Request Query for the Selection Filtering
req <- dbSendQuery(con, "SELECT * FROM table1 WHERE ID = 8")

## Summarize data
table1_2 <- dbFetch(req)
cor(table1_2$S2, table1_2$S3)

## Clear Query
dbClearResult(req)

## Database Disconnect
dbDisconnect(con)
```

Question 4
----------
For this question you need to read in "Sheet2" from the excel_data.xlsx file using the readxl package and the data from the table2.json file using the jsonlite package. Then you need to inner join the two tables by their corresponding ID columns to create a new data frame. </br>

What is the mean of column "J2" in the joined data frame?</br>

### Answer
- [ ] -5.11
- [ ] -0.261
- [x] 6.936
- [ ] 0.017
</br>

### Remarks
See the following R-code chunk to calculate </br>
```{r}
library(jsonlite)
library(dplyr)
table2 <- fromJSON("table2.json")

# Regular Merge
q4table = merge(x = excel2 ,y = table2, by = "ID")

# dplyr Merge
q4table <- excel2 %>%
  inner_join(table2, by = "ID")

mean(q4table$J2)
```

Question 5
----------
Continuing from Question 4 above, what is the correlation between column "X2" and column "J4" in the joined data frame? </br>

### Answer
- [ ] -0.971
- [x] 0.091
- [ ] 0.023
- [ ] -0.112
</br>

### Remarks
See the following R-code chunk to calculate </br>
```{r}
cor(q4table$X2, q4table$J4)
```
