---
title: "Tidyverse_Visualize"
author: "Hsin Chih Chen"
date: "12/27/2021"
output: html_document
---

### Data Obtainment

This section helps to identify the file source and download respective CSV files. 

```{r Data Obtainment}
library(tidyverse)
library(ggrepel)
library(scales)

# Record URLs for data source
url1 <- c("https://d3c33hcgiwev3.cloudfront.net/ERgbPUSBTj2YGz1Egd49gA_64d91f329b334df59109113c3084708f_data_fastfood_sales.csv?Expires=1640908800&Signature=VTargrQ4JpJHLBj1yxV2Pb5KguzmoMxRKA2ExRc8jAqRNMMO3qvrrIGiFeXnFd52eSlqQlkj4QbuPQf1TkYvwcMUDKnJAdGK9bjfY0vpd2zM5CZ~rphwBL7FhKBI7IO~gWRSJkzbNLfx1lnMQLbPhG~oWSr4ANkWoNKykBGCBFk_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A")

url2 <- c("https://d3c33hcgiwev3.cloudfront.net/-LjVvbxIR5G41b28SMeReA_1a02baf08f0c4c479cbd944461c41ced_data_fastfood_calories.csv?Expires=1640908800&Signature=AKxkqEp49gOrsnV-rwelByW4Q7Uwr06U0AwRr1x06FkTkm7CKAIdahwpkz5usC8nTPCh3XUDJZRPCu-XfBY9qR5Ja9B7zXSyefIbGwQWTJSoA9blYZhTtVgr8vGnZJdUtaFUtcpHHDW6z2JmO4rcfmDy~E97Eh-p-p8g8uGLTZ8_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A")

# Download csv files
download.file(url1, "ffsales.csv")
download.file(url2, "ffcalories.csv")

# Read csv files accordingly
sales <- read_csv("ffsales.csv")
caloriess <- read_csv("ffcalories.csv")
```

### Problem 1 
```{r Graph 1}

# Add proportion towards the franchised store compare to total stores.

q1 <- sales %>%
  mutate(fran_prop = num_franchised_stores / unit_count)
  
# Draw aesthetics and color the continuous point segment
  ggplot(q1, aes(x = us_sales, y = unit_count))+
  geom_point(aes(color = fran_prop)) +

# Add necessary text, transform scales and axis labels
  geom_text_repel(aes(x = us_sales, y = unit_count, label = restaurant), size = 3) +
  scale_x_log10() +
  scale_y_log10() + 
  theme_bw() + 
  theme(legend.title = element_text(size = 8),
        legend.text = element_text(size = 8)) +
  labs( x = "U.S. sales in millions (log10 scale)", y = "Total number of stores (log10 scale)", col = "Proportion of stores franchised")
```

### Problem 2
```{r Graph 2}

# Draw Plot
sales %>%

# Reorder the restaurant based on average sales
  ggplot(aes(x = fct_reorder(restaurant, average_sales), y = average_sales))+
  geom_bar(stat = 'identity') +

# Flip the coordinate for reversal
  coord_flip() +
  theme_classic() + 
  
# Add additional labels for the money mark and axis name
  labs( x = "Restaurant", y = "Average sales per unit store (in thousands)")+
  scale_y_continuous(labels=dollar_format()) +
  geom_text(aes(label = paste0("$", round(average_sales,0)), hjust = -0.1), size = 2) 
```

### Problem 3
```{r Graph 3}
# Draw Plot 
caloriess %>%

# Plot the aesthetics while using geom_point to plot
  ggplot(aes(x = calories, y = sodium)) +
  geom_point(size = 1) +
  theme_bw() + 

# Add axis title and intercept lines  
  labs( x = "Calories", y = "Sodium (mg)")+
  geom_hline(yintercept = 2300) +

# Use facet wrap to separate the restaurant and label
  facet_wrap(~restaurant) +
  geom_text_repel(data = caloriess %>% filter(sodium > 2300),
                  aes(label = item),
                  direction = "y",
                  nudge_y = 900,
                  nudge_x = 900,
                  size = 2)
```

### Problem 4
```{r Graph 4}
# Filter the salad entrees
q4 <- caloriess %>%
  mutate(is_salad = str_detect(item, "[Ss]alad"))

# Plot with the reordered calories 
ggplot(q4, aes(x = fct_reorder(restaurant, calories),y = calories))+

# Add boxplot (exclude outlier) and use point setup for the position of points
  geom_boxplot(outlier.shape = NA) +
  geom_point(aes(color = is_salad), position = position_jitterdodge()) +
  scale_y_log10()+
  coord_flip() +
  theme_bw()+
  
# Add the axis description 
  labs(x = "Restaurant", y = "Calories (log10 scale)", color = "Is the entree\n a salad?") +
  scale_color_discrete(labels=c("Not Salad", "Salad"))
```

### Problem 5
```{r Graph 5}
# Filter Taco Bell restaurant
q5 <- caloriess %>%
      filter(restaurant != "Taco Bell") %>%
      group_by(restaurant) %>%
# Add median sugar as variable based on group
      summarise(med_sugar = median(sugar)) %>%
# Filter the restaurant in sales database while join the sales amount and name
      filter(restaurant %in% sales$restaurant) %>%
      inner_join(sales[,c(1,3)], by = "restaurant")

ggplot(q5, aes(x = fct_reorder(restaurant, us_sales), y = us_sales)) +
    scale_fill_gradient(low="#1CA695", high = "#F32A5B")+
    geom_bar(aes(fill = med_sugar), stat = "identity") +
    labs(x = "Restaurant", y = "U.S. sales (in millions)", 
         fill = "Median sugar (grams)\n in fast food entrees") + 
    theme_classic()
```
