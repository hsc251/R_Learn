# Pre-Load Library
library(tidyverse)
library(dplyr)


# Data Importing

coverage <- read.csv("C:/Users/Colin Chen/Documents/HCC_HealthCare/data/healthcare-coverage.csv", sep = ",", header = TRUE, skip = 2)
spending <- read.csv("C:/Users/Colin Chen/Documents/HCC_HealthCare/data/healthcare-spending.csv", sep = ",", header = TRUE, skip = 2)

# Remove Unnecessary Rows for Data

coverage <- coverage[1:52,]
spending <- spending[1:52,]

# Select Column Contains Coverage Total
coverage <- coverage[,c(1,8,15,22,29)]
colnames(coverage) <- c("Location","2013_Total_Cover", "2014_Total_Cover","2015_Total_Cover","2016_Total_Cover")

# Rearrange the Column Names for Spending
colnames(spending) <- c("Location","1991_Total_Spent","1992_Total_Spent","1993_Total_Spent"
                        ,"1994_Total_Spent","1995_Total_Spent", "1996_Total_Spent","1997_Total_Spent"
                        ,"1998_Total_Spent","1999_Total_Spent","2000_Total_Spent"
                        ,"2001_Total_Spent","2002_Total_Spent","2003_Total_Spent","2004_Total_Spent"
                        ,"2005_Total_Spent","2006_Total_Spent","2007_Total_Spent","2008_Total_Spent"
                        ,"2009_Total_Spent","2010_Total_Spent","2011_Total_Spent","2012_Total_Spent"
                        ,"2013_Total_Spent","2014_Total_Spent")

# Reshape Data Frame for Spending & Coverage
cover <- data.frame(t(coverage[-1]))
colnames(cover) <- coverage[,1]

spent <- data.frame(t(spending[-1]))
colnames(spent) <- spending[,1]

spent <- spent %>%
  mutate(year_spent = c("1991","1992","1993","1994","1995","1996","1997"
                        ,"1998","1999","2000","2001","2002","2003","2004"
                        ,"2005","2006","2007","2008","2009","2010","2011"
                        ,"2012","2013","2014"))


cover <- cover %>%
  mutate(year_cover = c("2013","2014","2015","2016"))


# Plot Trends for Coverage & Spent

spent_graph <- spent %>%
  ggplot(aes(x = year_spent, y = `United States`)) +
  geom_bar(stat="identity",fill = '#56B4E9') +
  labs(title = "USA Health Care Spending by Years", x = "Years", y = "Spending")+
  theme(axis.text.x = element_text(size = 7),
        axis.text.y = element_text(size = 7),
        axis.title = element_text(size = 8.5),
        title = element_text(size = 9))

cover_graph <- cover %>%
  ggplot(aes(x = year_cover, y = `United States`)) +
  geom_bar(stat="identity",fill = '#F23470') +
  labs(title = "USA Health Care Coverage by Years", x = "Years", y = "Spending")+
  theme(axis.text.x = element_text(size = 7),
        axis.text.y = element_text(size = 7),
        axis.title = element_text(size = 8.5),
        title = element_text(size = 9))

# Detect Correlation with Spent vs Coverage
cor(spending$`2013_Total_Spent`,coverage$`2013_Total_Cover`)
cor(spending$`2014_Total_Spent`,coverage$`2014_Total_Cover`)
