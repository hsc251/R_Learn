# (JHU Coursera) Getting and Cleaning Data Quiz 3 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Data Science's coursera courses.</br>

Question 1
----------
The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv).</br>

and load the data into R. The code book, describing the variable names is [here](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf): </br>

Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of agriculture products. Assign that logical vector to the variable agricultureLogical. Apply the which() function like this to identify the rows of the data frame where the logical vector is TRUE as `which(agricultureLogical)`. </br>

What are the first 3 values that result? </br>

### Answer
- [ ] 59, 460, 474
- [ ] 25, 36, 45
- [ ] 403, 756, 798
- [x] 125, 238, 262
</br>

### Remarks
Refer to the following code to generate selection factor.</br>

```R
# download the file from source link
q1url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(q1url,'acs.csv', method = 'curl')

# Read data into data frame
acs <- read.csv('acs.csv')

# generate the conditional statement 
# Acres condition would be ACR = 3 when the house has ten or more acres.
# Agriculture Products would be AGS = 6 when the products sells have $10,000 or more.

agricultureLogical <- acs$ACR == 3 & acs$AGS == 6

# obtain the 1st three value by using head function
head(which(agricultureLogical), 3)
```

Question 2
----------
Using the jpeg package read in the following picture [link](https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg) of your instructor into R. </br>

Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data? </br>

### Answer
- [ ] -10904118 -10575416
- [ ] 10904118   -594524 
- [x] -15259150 -10575416 
- [ ] -16776430 -15390165
</br>

### Remarks
Refer to the following process steps to obtain sqldf package & read off data.</br>

```R
# download the file from source link as a web format
q2url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(q2url,'jeff.jpg', mode = 'wb')

# Read the image with readJPEG
pic <- jpeg::readJPEG('jeff.jpg', native=TRUE)

# Obtain the sample quantiles corresponding with the given probability
quantile(pic, probs = c(0.3,0.8))
```
</br>

Based on the  sql query, the general information will be select pwgtp1 from source while add the condition) </br>

Question 3
----------
Load the Gross Domestic Product data for the 190 ranked countries in this [data set](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv): </br>


Load the educational data from this [data set](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv): </br>


Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in descending order by GDP rank. What is the 13th country in the resulting data frame? </br>

Original data sets are listed below: </br>

[GDP Ranking Table](http://data.worldbank.org/data-catalog/GDP-ranking-table) </br>
[Education Stats](http://data.worldbank.org/data-catalog/ed-stats) </br>

### Answer
- [ ] 190 matches, 13th country is Spain
- [ ] 234 matches, 13th country is St. Kitts and Nevis
- [x] 189 matches, 13th country is St. Kitts and Nevis
- [ ] 189 matches, 13th country is Spain
- [ ] 190 matches, 13th country is St. Kitts and Nevis
- [ ] 234 matches, 13th country is Spain
</br>

### Remarks
Refer to the following R code to obtain the data</br>

```R
# install.packages("data.table)
library("data.table")


# Download data and read FGDP data into data.table while select the necessary columns for extracts.
gdpurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
GDP <- data.table::fread(gdpurl
                          , skip=4
                          , nrows = 190
                          , select = c(1, 2, 4, 5)
                          , col.names=c("CountryCode", "Rank", "Economy", "Total")
                          )

# Download data and read educational stats data into data.table
edurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
fed <- data.table::fread(edurl)

# Combine the data sets by merging associated with the joint option, in this case it's country code
combo <- merge(GDP, fed, by = 'CountryCode')

# How many of the IDs match? Use nrow to see the combined row numbers
nrow(combo)


# Sort the data frame in descending order by GDP rank (so United States is last). 
# What is the 13th country in the resulting data frame? Use order function while getting the 13th entries by economy stats
combo[order(-Rank)][13,.(Economy)]
```
</br>

Since the new data was updated, so when re-run the data the matched rows are only 188 rows while and the actual country is Vanuatu instead of St. Kitts and Nevis. </br>

Question 4
----------
What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group? </br>

### Answer
- [x] 32.96667, 91.91304
- [ ] 30, 37
- [ ] 133.72973, 32.96667 
- [ ] 23, 45
- [ ] 23.966667, 30.91304
- [ ] 23, 30
</br>

### Remarks
Use the following code to calculate both rank and income </br>
```R

# use the merged data.table from previous question, then select the category group, use lapply to evaluate the mean for the respective rank and income for both OECD and non-OECD group.

combo[`Income Group` == "High income: OECD"
      ,lapply(.SD, mean)
      ,.SDcols = c('Rank')
      , by = 'Income Group']

combo[`Income Group` == "High income: nonOECD"
      ,lapply(.SD, mean)
      ,.SDcols = c('Rank')
      , by = 'Income Group']
```
</br>

Question 5
----------
Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. How many countries are Lower middle income but among the 38 nations with highest GDP? </br>


### Answer
- [ ] 18
- [x] 5
- [ ] 0
- [ ] 3
</br>

### Remarks
Use the following code to obtain the data </br>
```R

# install the dplyr package before evaluating it.
# install.packages('dplyr')
library('dplyr')

# disect with dplyr's quantile function with the 5 equivalent section while ensure no NA values are within the crossover.
disec <- quantile(combo[, Rank], probs = seq(0, 1, 0.2), na.rm = TRUE)

# Split the GDP by applying the breaks argument for splitting the original GDP data, and then subsetting the income group for the desired information.
combo$quantileGDP <- cut(combo[, Rank], breaks = disec)
combo[`Income Group` == "Lower middle income", .N, by = c("Income Group","quantileGDP")]

# Results:
          Income Group quantileGDP  N
1: Lower middle income (38.4,75.8] 13
2: Lower middle income   (113,152]  9
3: Lower middle income   (152,189] 15
4: Lower middle income  (75.8,113] 11
5: Lower middle income    (1,38.4]  5
```
