# Reproducible Research 2nd Project

Author: Hsin Chih (Colin) Chen </br>

1: Data Introduction
-----------

This assignment's data source comes from the storm's impact towards fatalities, injuries and property damage coming from US National Oceanic and Atmospheric Administration's storm data. Listing when the storm occurs, and estimating of any fatalities, injuries nad property damage. </br>

The dataset is located in the [dataset link](https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2) to download.</br>

For detailed explanation, please refer to the [documentation link](https://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2Fpd01016005curr.pdf). </br>

2: Data Processing
------------------

### 2.1: Load the data

Obtain raw data file and extract the data into a data frame.Then convert to a data.table </br>

``` r
## load necessary packages
library("data.table")
library("ggplot2")

# Download the 
PA02 <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
download.file(PA02, "StormData.csv.bz2")
stormF <- read.csv("StormData.csv.bz2")

# Converting data.frame to data.table
stormT <- as.data.table(stormF)
```
</br>

### 2.2: Verify Data Structure & Column Names

```r
str(stormT)
```

### 2.3: Subset Data

Subset the data only for the interested parameters, in this case will only be occurred event, fatalities, injuries, prop and crop damages </br>

```r
# Find columns to remove
removeCols <- colnames(stormT[, !c("EVTYPE"
              ,"FATALITIES"
              ,"INJURIES"
              ,"PROPDMG"
              ,"PROPDMGEXP"
              ,"CROPDMG"
              ,"CROPDMGEXP")])
              
# Remove the columns
stormT[, c(removeCols) := NULL]

# Collect where fatalities occurred.
stormT <- stormT[(EVTYPE != "?" &
            (INJURIES > 0 | FATALITIES > 0 | PROPDMG > 0 | CROPDMG > 0)), c("EVTYPE"
              ,"FATALITIES"
              ,"INJURIES"
              ,"PROPDMG"
              ,"PROPDMGEXP"
              ,"CROPDMG"
              ,"CROPDMGEXP")]
```
</br>

### 2.4: Convert Exponent Columns from Characters into Numeric Values

Make sure the exponential factors are translated to numeric for calculation. </br>

```r
# Change all damaged exponents to upper case for correction.
exp <- c("PROPDMGEXP","CROPDMGEXP")
stormT[, (exp) := c(lapply(.SD, toupper)), .SDcols = exp]
              
# Map property damage alphanumeric exponents to numeric values.
propDmgExp <- c("\"\"" = 10^0,
                 "-" = 10^0, 
                 "+" = 10^0,
                 "0" = 10^0,
                 "1" = 10^1,
                 "2" = 10^2,
                 "3" = 10^3,
                 "4" = 10^4,
                 "5" = 10^5,
                 "6" = 10^6,
                 "7" = 10^7,
                 "8" = 10^8,
                 "9" = 10^9,
                 "H" = 10^2,
                 "K" = 10^3,
                 "M" = 10^6,
                 "B" = 10^9)

# Map crop damage alphanumeric exponents to numeric values.
cropDmgExp <-  c("\"\"" = 10^0,
                "?" = 10^0, 
                "0" = 10^0,
                "K" = 10^3,
                "M" = 10^6,
                "B" = 10^9)
                
# Replace the data set's value with characters before using the logical vector to convert to numeric.
stormT[, PROPDMGEXP := propDmgExp[as.character(stormT[, PROPDMGEXP])]]
stormT[, CROPDMGEXP := cropDmgExp[as.character(stormT[, CROPDMGEXP])]]               

# Convert the zero values to default numeric (which is 10^0)
stormT[is.na(PROPDMGEXP), PROPDMGEXP := 10^0]
stormT[is.na(CROPDMGEXP), CROPDMGEXP := 10^0]
```

### 2.5: Generate Economic Cost Columns by calculation

``` r
## Mutate data table by add extra columns for the calculation
stormT <- stormT[, .(EVTYPE, FATALITIES, INJURIES, PROPDMG, PROPDMGEXP, Cost_Prop = PROPDMG * PROPDMGEXP, CROPDMG, CROPDMGEXP, Cost_Crop = CROPDMG * CROPDMGEXP)]
```

### 2.6: Calculate Total Propert and Crop Cost

```r
## Perform the Total Cost summary by having the 3 data columns for Prop Cost, Crop Cost and Total Cost by Event Type Classification
Cost_Total <- stormT[, .(Cost_Prop = sum(Cost_Prop), Cost_Crop = sum(Cost_Crop), Cost_Total = sum(Cost_Prop + Cost_Crop)), by =.(EVTYPE)]

## Order by Reverse with Total Cost to see the top 10 EVTYPE failure
Cost_Total <- Cost_Total [order(-Cost_Total ), ]
Cost_Total <- Cost_Total [1:10, ]

## Check the structure by only showing the top 5 EVTYPE which caused high costs.
head(Cost_Total, 5)
```


The results are as follows </br>
No. | EVTYPE | Cost_Prop | Cost_Crop | Cost_Total 
--- | --- | --- | --- | ---
1 | TORNADO | 3214026.7 | 100018.5| 3314045
2 | FLASH FLOOD | 1424341.1 | 179200.5 | 1603542 
3 | TSTM WIND | 1336460.6 | 109202.6 | 1445663
4 | HAIL | 691327.7 | 579596.3 | 1270924 
5 | FLOOD | 900001.5 | 168037.9 | 1068039
 


### 2.7: Calculate Total Fatalities and Injuries

```r
## Perform the Total Injuries summary by having the 3 data columns for Injuries, Fatalities and Total Injuries by Event Type Classification
Inj_Tot <- stormT[, .(FATALITIES = sum(FATALITIES), INJURIES = sum(INJURIES), TOTAL_INJURIES = sum(FATALITIES + INJURIES)), by =.(EVTYPE)]

## Order by Reverse with Total Cost to see the top 10 EVTYPE failure
Inj_Tot <- Inj_Tot[order(-FATALITIES), ]
Inj_Tot <- Inj_Tot[1:10, ]

head(Inj_Tot, 5)
```

The results are as follows </br>
No. | EVTYPE | FATALITIES | INJURIES | TOTAL INJURIES 
--- | --- | --- | --- | ---
1 | TORNADO | 5633 | 91346| 96979
2 | EXCESSIVE HEAT | 1903 | 6525 | 8428 
3 | FLASH FLOOD | 978 | 1777 | 2755
4 | HEAT | 937 | 2100 | 3037 
5 | LIGHTNING | 816 | 5230 | 6046


3: Results
------------------

### 3.1: Display and rank events which are the most severe for population

Melt the data.table for bar graph format with sub levels </br>
```r
chaos <- melt(Inj_Tot, id.vars="EVTYPE", variable.name = "Chaos_Level")
head(chaos, 5)
```

The results are as follows </br>
No. | EVTYPE | Chaos_Level | Value
--- | --- | --- | ---
1 | TORNADO | FATALITIES | 5633
2 | EXCESSIVE HEAT | FATALITIES | 1903
3 | FLASH FLOOD | FATALITIES | 978
4 | HEAT | FATALITIES | 937
5 | LIGHTNING | FATALITIES | 816  

```r
# Generate Chart
InjuryChart <- ggplot(chaos, aes(x = reorder(EVTYPE, -value), y = value))

# Plot as Bar Chart
InjuryChart = InjuryChart + geom_bar(stat = "identity", aes(fill = Chaos_Level), position ="dodge")

# Format y axis scale and setup y-axis label
InjuryChart = InjuryChart + ylab("Frequency Count")

# Set x-axis label
InjuryChart = InjuryChart + xlab("Event Types")

# Rotate x-axis tick labels
InjuryChart = InjuryChart + theme(axis.text.x = element_text(angle=45, hjust=1))

# Set and centerlized the chart title
InjuryChart = InjuryChart + ggtitle("Top 10 US Fataility Events") + theme(plot.title = element_text(hjust = 0.5))

InjuryChart
```

### 3.2: Events which caused the Greatest Economic Consequences

Melt the data.table for bar graph format with sub levels </br>
```r
eimpact <- melt(Cost_Tot, id.vars="EVTYPE", variable.name = "Damage_Type")
head(eimpact, 5)
```

```r
# Generate Chart
econChart <- ggplot(eimpact, aes(x = reorder(EVTYPE, -value), y = value))

# Plot as Bar Chart
econChart = econChart + geom_bar(stat = "identity", aes(fill = Damage_Type), position ="dodge")

# Format y axis scale and setup y-axis label
econChart = econChart + ylab("Frequency Count")

# Set x-axis label
econChart = econChart + xlab("Event Types")

# Rotate x-axis tick labels
econChart = econChart + theme(axis.text.x = element_text(angle=45, hjust=1))

# Set and centerlized the chart title
econChart = econChart + ggtitle("Top 10 US Storm Events with Strong Economic Impact") + theme(plot.title = element_text(hjust = 0.5))

econChart
```
