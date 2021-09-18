# (JHU Coursera) Getting and Cleaning Data Quiz 1 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Data Science's coursera courses.</br>

Question 1
----------
The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from [the link](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv): </br>

and load the data into R. The code book, describing the variable names is [here](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf ): </br>

How many properties are worth $1,000,000 or more? </br>

### Answer
- [x] 53
- [ ] 164
- [ ] 25
- [ ] 2076
</br>

### Remarks
Refer to the following code to obtain the data.</br>

```R
download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv","c3q1.csv", method = "curl")
data1 <- read.csv("c3q1.csv") # read in values for the data table
dim(data1[which(data1$VAL==24),]) # use matrix table to find the rows in the matrix where VAL = 24 ($1,000,000 more)

[1]  53 188
```

Question 2
----------
Use the data you loaded from Question 1. Consider the variable FES in the code book. Which of the "tidy data" principles does this variable violate? </br>

### Answer
- [ ] Each variable in a tidy data set has been transformed to be interpretable. 
- [ ] Each tidy data table contains information about only one type of observation. 
- [x] Tidy data has one variable per column. 
- [ ] Tidy data has one observation per row. 
</br>

### Remarks
In this section, the FES variable has more than 1 variable defined in the respective column. </br>

Question 3
----------
Download the Excel spreadsheet on Natural Gas Aquisition Program [here](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx ):  </br>

Read rows 18-23 and columns 7-15 into R and assign the result to a variable called `dat` </br>

What is the value of `sum(dat$Zip*dat$Ext. na.rm=T)`? </br>
### Answer
- [ ] 154339
- [x] 36534720
- [ ] NA
- [ ] 33544718
</br>

### Remarks
Refer to the following code to obtain the data.</br>

```R
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx","NGAP.xlsx", method = "curl")

# for excel file reading
library(xlsx) 

# Define vectors for the desired row and column section
excelc = c(7:15) 
excelr = c(18:23) 

# read data and summarize the data
dat = read.xlsx("NGAP.xlsx", sheetIndex = 1, rowIndex = excelr, colIndex = excelc)
sum(dat$Zip*dat$Ext. na.rm=T)

[1]  36534720
```
</br>

Question 4
----------
Read the XML data on Baltimore restaurants from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml): </br>

How many restaurants have zipcode 21231? </br>
### Answer
- [ ] 28
- [ ] 130
- [x] 127
- [ ] 100
</br>

### Remarks
Use the following code to evaluate class of variable </br>
```R

# define URL for XML file
URL3 = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

# use xml read tool by accessing the URL and store data in
doc = xmlTreeParse(URL3, useInternal = TRUE) 
rootNode <- XML::xmlRoot(doc)

# use xpathSApply to get rootNode and find designated strings and xmlValue for zipcode extraction
zipcode = xpathSApply(rootNode, "//zipcode" ,xmlValue)

# Extract the zipcode where the xml has value 21231
length(zipcode[zipcode == "21231"])

[1]  127
```
</br>

Question 5
----------
The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv):  </br>

using the `fread` command to load the data into an R object named `DT`, and calculate the average value of the variable `pwgtp15` broken down by sex. Using the data.table package, which will deliver the fastest user time? </br>

### Answer
- [ ] tapply(DT$pwgtp15,DT$SEX,mean)
- [ ] sapply(split(DT$pwgtp15,DT$SEX),mean)
- [x] DT[,mean(pwgtp15),by=SEX]
- [ ] mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
- [ ] rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
- [ ] mean(DT$pwgtp15,by=DT$SEX)
</br>

### Remarks
Use the system.time to calculate all the equation, data table extracted from fread will be the fastest way to calculate. </br>
