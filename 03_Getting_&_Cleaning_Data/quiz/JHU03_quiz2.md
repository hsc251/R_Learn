# (JHU Coursera) Getting and Cleaning Data Quiz 2 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Data Science's coursera courses.</br>

Question 1
----------
Register an application with the Github API [here](https://github.com/settings/applications). Access the API to get information on your instructors repositories (hint: this is the [url](https://api.github.com/users/jtleek/repos) you want). Use this data to find the time that the datasharing repo was created. What time was it created? </br>

### Answer
- [ ] 2013-08-28T18:18:50Z
- [ ] 2012-06-21T17:28:38Z
- [x] 2013-11-07T13:25:07Z
- [ ] 2012-06-20T18:39:06Z
</br>

### Remarks
Refer to the following process steps to obtain API process steps.</br>

To make your own application, register at [here](https://github.com/settings/developers), and use any URL for the homepage URL like http://github.com and  http://localhost:1410 as the callback url </br>

```R
#install.packages("jsonlite")
#install.packages("httpuv")
#install.packages("httr")

library(jsonlite)
library(httpuv)
library(httr)

# Can be github, linkedin etc depending on application
oauth_endpoints("github")

# Change based on your appname, key, and secret 
myapp <- oauth_app(appname = "hsc251",
                   key = "your own ID in the GitHub API app",
                   secret = "your own Token in the GitHub API app")

# Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)

# Take action on http error
stop_for_status(req)

# Extract content from a request
json1 = content(req)

# Convert to a data.frame
gitDF = jsonlite::fromJSON(jsonlite::toJSON(json1))

# Subset data.frame
gitDF[gitDF$full_name == "jtleek/datasharing", "created_at"] 
```

Question 2
----------
The sqldf package allows for execution of SQL commands on R data frames. We will use the sqldf package to practice the queries we might send with the dbSendQuery command in RMySQL. </br>

Download the American Community Survey [data](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv) and load it into an R object called `acs` </br>

Which of the following commands will select only the data for the probability weights pwgtp1 with ages less than 50? </br>

### Answer
- [ ] sqldf("select pwgtp1 from acs")
- [ ] sqldf("select * from acs")
- [x] sqldf("select pwgtp1 from acs where AGEP < 50") 
- [ ] sqldf("select * from acs where AGEP < 50")
</br>

### Remarks
Refer to the following process steps to obtain sqldf package & read off data.</br>

```R
# install.packages('sqldf')
library('sqldf')

URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
path <- file.path(getwd(), "pid.csv")
download.file(URL, path)
acs <- read.csv(f)
```
</br>

Based on the  sql query, the general information will be select pwgtp1 from source while add the condition) </br>

Question 3
----------
Using the same data frame you created in the previous problem, what is the equivalent function to unique(acs$AGEP) </br>

### Answer
- [ ] sqldf("select distinct pwgtp1 from acs")
- [ ] sqldf("select AGEP where unique from acs")
- [x] sqldf("select distinct AGEP from acs")
- [ ] sqldf("select unique * from acs")
</br>

### Remarks
Since the unique values within the SQL language is using distinct function to select unique value from the category</br>


Question 4
----------
How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this [page](http://biostat.jhsph.edu/~jleek/contact.html): </br>

(Hint: the nchar() function in R may be helpful)</br>

### Answer
- [ ] 45 31  7 31
- [ ] 45  0  2  2
- [x] 45 31  7 25
- [ ] 45 31  2 25
- [ ] 45 92  7  2
- [ ] 43 99 7 25
- [ ] 43 99 8 6
</br>

### Remarks
Use the following code to evaluate the number of characters within each sentence. </br>
```R

# define URL for HTML file
q4url <- "http://biostat.jhsph.edu/~jleek/contact.html"

# use readlines to pour the webpage data text in and close connection.
q4setup <- readLines (q4url)
close(q4url)

# use nchar to read the characters with associated lines
c(nchar(q4setup[10]), nchar(q4setup[20]), nchar(q4setup[30]), nchar(q4setup[100]))
```
</br>

Question 5
----------
Read this [data set](https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for) into R and report the sum of the numbers in the fourth of the nine columns. </br>

[Original source of the data](http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for)


### Answer
- [ ] 101.83
- [ ] 36.5
- [x] 32426.7
- [ ] 222243.1
- [ ] 28893.3
- [ ] 35824.9
</br>

### Remarks
Use the following code to evaluate the summarized setup. </br>
```R

# define URL for HTML file
q5url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"

# use read.fwf to read the file location with associated widths and skips of column for reading data
w2q5 <- read.fwf(file=q5url, widths = c(12,7,4,9,4,9,4,9,4), skip = 4)

# use sum function to calculate the sum of 4th column of the data set
sum(w2q5[, 4])
