# (Wrangling Data in the Tidyverse Course Project) Wrangling Data in the Tidyverse Quiz 7 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Tidyverse Skills for Data Science in R Specialization.</br>

Question 1
----------
Before you begin, you will need to download the following file: </br>

Load data_complaints.csv file in R. </br>

**Please consider the following before loading the data into R**:  The data set has 191,096 rows and 18 columns. First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. Make sure your computer has enough memory (most modern computer should be fine).  </br>

Consider the column titled `Date received` and filter rows for all **Student loan** complaints received after January 1, 2018.  Count the number of student loan complaints received by each US state and rank in a decreasing order with the state with the most complaints at the top and the states with the least complaints at the bottom. </br>

How many student loan complaints did the US state with second most complaints have?  </br>

### Answer
1374
</br>

### Remarks
California has the the most complaints with 2039 complaints. New York has the second largest amount of complaints with 1374 complaints. </br>

For the Data Obtainment, check the R-code below: </br>
```{r}
# Data Obtainment
library(tidyverse) # to manipulate df
library(tidymodels) # for machine learning build up
library(tm) # to manipulate text
library(lubridate)
library(stringr)

URL <- c("https://d3c33hcgiwev3.cloudfront.net/Rj3GCXMzSNW9xglzM1jVpg_f5aa2a757a614dfabb12d4b73705cd65_data_complaints.csv?Expires=1645401600&Signature=EnQR4I3yzKEO2ozBLeVeAqg4mHZWvY5QJjgFwtt7~2N2ZXtF0lzqZZyo2B6781FQu22fyIUxSQLqw3FnHU3-0Kf847XJLvvZBFCPJ3tvzBz7w449W7-960sM1N681ivG2y2gZ-itoAsL4~aNNbnHICmMBD7g8474ofDrYXkgRBs_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A")

download.file(URL, "complaints.csv")
complaints <- read_csv("complaints.csv")

names(complaints) <- c("Date_Received", "Product", "Sub-Product", "Issue", "Sub-issue", "Consumer_Complaint_Narrative", "Company_Public_Response", "Company", "State", "Zip_Code", "Tags", "Consumer_Consent_Provided?", "Submitted_Via", "Date_Sent_to_Company", "Company_Response_to_Consumer", "Timely_Response?","Consumer_Disputed?", "Complaint_ID")

complaints$Date_Received <- mdy(complaints$Date_Received)
complaints$Date_Sent_to_Company <- mdy(complaints$Date_Sent_to_Company)

#Filter

Q1 <- complaints %>%
  filter(Date_Received >= "2018-01-01" & Product == "Student loan") %>%
  count(State, Product) %>%
  arrange(desc(n))
```
</br>

Question 2
----------
Complaints can be submitted in different ways to the CFPB. For example, someone can submit a complaint on the web, but they can also submit a complaint by phone. </br>

Consider all complaints that were **submitted by email.** </br>

For this subset of complaints, what is the average amount of time between the complaint being received by CFPB (`Date received`) and the CFPB sending the complaint to the company (`Date sent to company`) ?</br>  

Round to the nearest tenths digit. </br>

### Answer
1.6
</br>

### Remarks
The average amount of time is 1.550 days, which rounds to 1.6 days using the nearest tenths digit. </br>

For the Data Obtainment, check the R-code below: </br>

```{r}
Q2 <- complaints %>%
  filter(Submitted_Via == "Email") %>%
  mutate(Process_Time = Date_Received - Date_Sent_to_Company) %>%
  summarize(Process_Time_Avg = mean(Process_Time))
```
</br>


Question 3
----------
Consider all **Vehicle loan or lease** complaints. </br>  

How many times does the string "student" appear in the string of text in the `Consumer complaint narrative` column? </br>

### Answer
49
</br>

### Remarks
For the Data Obtainment, check the R-code below: </br>

```{r}
Q3 <- complaints %>%
  filter(Product == "Vehicle loan or lease") %>%
  na.omit()
  
sum(str_count(Q3$Consumer_Complaint_Narrative, "student"))
```
</br>

Question 4
----------
Question 4
Consider only **Vehicle loan or lease** complaints. </br>

The `Issue` column contains a set of plain text categorical variables that the consumer identified in the complaint. For example, one type of issue is "Trouble during payment process" for **Mortgage complaints**.  </br>

For each `Issue`, calculate what is the average length of characters in the string text in the `Consumer complaint narrative` column. </br>

Which `Issue` has the longest complaint length on average? </br>

### Answer
- [ ] Struggle to pay your loan
- [ ] Problem with fraud alerts or security freezes
- [x] Getting a loan or lease
- [ ] Problems at the end of the loan or lease
- [ ] Managing the loan or lease
</br>

### Remarks
For the Data Obtainment, check the R-code below: </br>

```{r}
Q4 <- complaints %>%
  filter(Product == "Vehicle loan or lease") %>%
  na.omit() %>%
  mutate(complaint_length = str_length(Consumer_Complaint_Narrative)) %>%
  group_by(Issue) %>%
  summarize(avg_length = mean(complaint_length)) %>%
  arrange(desc(avg_length))
```
</br>


Question 5
----------
Consider only **Credit card or prepaid card** complaints. Consider the two columns `Product` and `Consumer complaint narrative`. </br>

For the string text in the `Consumer complaint narrative` column, drop any rows with `NA` in the column and remove any strings such as "XX", "XXX", "XXXX" in the complaint. </br>

Transform this data frame with two columns into a data frame with three columns (`Product`, `id_number`, and `word`)  where the text in the `Consumer complaint narrative` column gets converted into a format where each row corresponds to one word of the complaint (`word`) while also keeping track of which complaint we are working with (`id_number)`. </br>

Remove any stop words.  </br>

What are the top three most frequently used words for this type of complaint?  </br>

### Answer
- [ ] payment
- [x] credit
- [x] card
- [x] account
- [ ] bank
</br>

### Remarks
For the Data Obtainment, check the R-code below: </br>

```{r}
Q5 <- complaints %>%
  filter(Product == "Credit card or prepaid card") %>%
  select(Product, Consumer_Complaint_Narrative) %>%
  filter(Consumer_Complaint_Narrative!=is.na(.)) %>%
  mutate(Consumer_Complaint_Narrative=gsub("[XX]+", "", Consumer_Complaint_Narrative)) %>%
  mutate(Consumer_Complaint_Narrative=str_to_lower(Consumer_Complaint_Narrative)) %>%
  mutate(Consumer_Complaint_Narrative=gsub("[0-9]", "", Consumer_Complaint_Narrative)) %>%
  mutate(Consumer_Complaint_Narrative=removePunctuation(Consumer_Complaint_Narrative)) %>%
  mutate(Consumer_Complaint_Narrative=gsub("\n", "", Consumer_Complaint_Narrative)) %>%
  mutate(Consumer_Complaint_Narrative=gsub("\t", "", Consumer_Complaint_Narrative)) %>%
  mutate(Consumer_Complaint_Narrative=stripWhitespace(Consumer_Complaint_Narrative))

Q5_Corpus <- Corpus(VectorSource(Q5))

Q5_tdm <- TermDocumentMatrix(Q5_Corpus) %>%
  removeSparseTerms(sparse = 0.995)

freq <- sort(rowSums(as.matrix(Q5_tdm)), decreasing = TRUE)
Q5wordCount <- data.frame(word = names(freq), count = freq)
head(Q5wordCount,30)
```
</br>
