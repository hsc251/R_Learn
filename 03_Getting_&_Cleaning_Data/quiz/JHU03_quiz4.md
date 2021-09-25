# (JHU Coursera) Getting and Cleaning Data Quiz 4 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Data Science's coursera courses.</br>

Question 1
----------
The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv).</br>

and load the data into R. The code book, describing the variable names is [here](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf): </br>

Apply strsplit() to split all the names of the data frame on the characters "wgtp". What is the value of the 123 element of the resulting list? </br>

### Answer
- [x] "" "15"
- [ ] "wgt" "15"
- [ ] "wgtp" "15"
- [ ] "w" "15"
</br>

### Remarks
Refer to the following code to generate selection factor.</br>

```R
# read data.table package
library("data.table")

# load data via fread while use strsplit to obtain.
commu <- data.table::fread("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")
varSplit <- strsplit(names(commun), "wgtp")

# callout the split item accordingly
varSplit[[123]]
```

Question 2
----------
Load the Gross Domestic Product data for the 190 ranked countries in this data set from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv) </br>

Remove the commas from the GDP numbers in millions of dollars and average them. What is the average? </br>

[Original data sources](http://data.worldbank.org/data-catalog/GDP-ranking-table): </br>


### Answer
- [x] 377652.4
- [ ] 381615.4
- [ ] 381668.9
- [ ] 387854.4
</br>

### Remarks
Refer to the following process steps to obtain sqldf package & read off data.</br>

```R
# Removed the s from https to be compatible with windows computer for download.
 
# Obtain the data via fread function while specify the nrow is 190 and skip 1st 5 rows for data reading.
# Then select the respective information column while giving the column names via col.names
GDPrank <- data.table::fread('http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
                    , skip=5
                    , nrows=190
                    , select = c(1, 2, 4, 5)
                    , col.names=c("CountryCode", "Rank", "Country", "GDP")
)

# Remove the commas using gsub and convert to integer by as.integer function. 
# Take mean of GDP column after modifying the data inside as described above.
GDPrank[, mean(as.integer(gsub(pattern = ',', replacement = '', x = GDP )))]
```
</br>

Question 3
----------
In the data set from Question 2 what is a regular expression that would allow you to count the number of countries whose name begins with "United"? Assume that the variable with the country names in it is named countryNames. How many countries begin with United?  </br>

### Answer
- [ ] grep("*United",countryNames), 2
- [ ] grep("*United",countryNames), 5
- [x] grep("^United",countryNames), 3
- [ ] grep("United$",countryNames), 3
</br>

### Remarks
Refer to the following R code to obtain the data</br>

```R
# use grep to obtain the GDP rank's data while select the country column, and specify strings which starts with United (^ operator)
grep("^United",GDPrank[, Country])
```
</br>

Question 4
----------
Load the Gross Domestic Product data for the 190 ranked countries in this data set [from here](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv): </br>

Load the educational data from this data set in [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv): </br>

Match the data based on the country shortcode. Of the countries for which the end of the fiscal year is available, how many end in June? </br>

Original [data sources](http://data.worldbank.org/data-catalog/GDP-ranking-table http://data.worldbank.org/data-catalog/ed-stats):  </br>

### Answer
- [ ] 8
- [ ] 7
- [ ] 16
- [x] 13
</br>

### Remarks
Use the following code to calculate both rank and income </br>
```R
# Obtain the data via fread function while specify the nrow is 190 and skip 1st 5 rows for data reading.
# Then select the respective information column while giving the column names via col.names
GDPrank <- data.table::fread('http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
                             , skip=5
                             , nrows=190
                             , select = c(1, 2, 4, 5)
                             , col.names=c("CountryCode", "Rank", "Country", "GDP")
)

# Obtain the data via fread function in and stored as education data
eduDT <- data.table::fread('http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv')

# merge the data table by the joining set of Country Code
mergeDT <- merge(GDPrank, eduDT, by = 'CountryCode')

# Use grepl to filter the end condition while extracting the columns
mergeDT[grepl(pattern = "Fiscal year end: June 30;", mergeDT[, `Special Notes`]), .N]
```
</br>

Question 5
----------
You can use the [quantmod](http://www.quantmod.com/) package to get historical stock prices for publicly traded companies on the NASDAQ and NYSE. Use the following code to download data on Amazon's stock price and get the times the data was sampled.</br>

```R
library(quantmod) 
amzn = getSymbols("AMZN",auto.assign=FALSE) 
sampleTimes = index(amzn)
```

How many values were collected in 2012? How many values were collected on Mondays in 2012? </br>

### Answer
- [ ] 252, 50
- [x] 250, 47
- [ ] 250, 51
- [ ] 251, 47
</br>

### Remarks
Use the following code to obtain the data </br>
```R
# After the above R code, use data.table function load time Data table.
timeDT <- data.table::data.table(timeCol = sampleTimes)

# Use Filter Condition to obtain the counts within 2012
timeDT[(timeCol >= "2012-01-01") & (timeCol) < "2013-01-01", .N ]
# Answer: 
# 250

# Use Filter Condition to obtain the counts within 2012while consider the weekdays as Monday in string filtering.
timeDT[((timeCol >= "2012-01-01") & (timeCol < "2013-01-01")) & (weekdays(timeCol) == "Monday"), .N ]
# Answer:
# 47
```
