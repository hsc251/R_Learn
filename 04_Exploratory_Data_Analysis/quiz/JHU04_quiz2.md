# (JHU Coursera) Exploatory Data Analysis Quiz 2 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Data Science's coursera courses.</br>

Question 1
----------
Under the lattice graphics system, what do the primary plotting functions like xyplot() and bwplot() return? </br>

### Answer
- [ ] an object of class "plot"
- [ ] nothing; only a plot is made
- [ ] an object of class "lattice"
- [x] an object of class "trellis"
</br>

### Remarks
Refer to the following R code to validate </br>
```R
# install.packages("nlme")
# install.packages("lattice")

library(nlme)
library(lattice)

plot <- xyplot(weight ~ Time | Diet, BodyWeight)
class(plot)
# "trellis"
```
</br>

Question 2
----------
What is produced by the following code? </br>

```R
library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)
```
</br>

### Answer
- [ ] A set of 3 panels showing the relationship between weight and time for each rat.
- [ ] A set of 11 panels showing the relationship between weight and diet for each time.
- [ ] A set of 16 panels showing the relationship between weight and time for each rat.
- [x] A set of 3 panels showing the relationship between weight and time for each diet.
</br>

### Remarks
N/A. </br>

Question 3
----------
Annotation of plots in any plotting system involves adding points, lines, or text to the plot, in addition to customizing axis labels or adding titles. Different plotting systems have different sets of functions for annotating plots in this way. </br>

Which of the following functions can be used to annotate the panels in a multi-panel lattice plot? </br>

### Answer
- [ ] `points()`
- [ ] `axis()`
- [ ] `text()`
- [x] `panel.abline()`
- [ ] `lines()`
</br>

### Remarks
Can select between `panel.abline()` or `panel.lmline()` to annotate the panels in lattice plot </br>

Question 4
----------
The following code does NOT result in a plot appearing on the screen device. </br>

```R
library(lattice)
library(datasets)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)
```
</br>

Which of the following is an explanation for why no plot appears? </br>

### Answer
- [ ] The xyplot() function, by default, sends plots to the PDF device.
- [x] The object 'p' has not yet been printed with the appropriate print method.
- [ ] The variables being plotted are not found in that dataset.
- [ ] There is a syntax error in the call to xyplot().
</br>

### Remarks
N/A </br>

Question 5
----------
In the lattice system, which of the following functions can be used to finely control the appearance of all lattice plots? </br>

### Answer
- [ ] par()
- [x] trellis.par.set()
- [ ] print.trellis()
- [ ] splom()
</br>

### Remarks
N/A </br>

Question 6
----------
What is ggplot2 an implementation of? </br>

### Answer
- [ ] a 3D visualization system
- [ ] the S language originally developed by Bell Labs
- [x] the Grammar of Graphics developed by Leland Wilkinson
- [ ] the base plotting system in R
</br>

### Remarks
N/A </br>

Question 7
----------
Load the `airquality' dataset form the datasets package in R </br>

```R
library(datasets)
data(airquality)
```
</br>

I am interested in examining how the relationship between ozone and wind speed varies across each month. What would be the appropriate code to visualize that using ggplot2? </br>

### Answer
- [ ] ```
      qplot(Wind, Ozone, data = airquality, facets = . ~ factor(Month))
      ```
- [x] ```
      airquality = transform(airquality, Month = factor(Month))
      ```
      ```
      qplot(Wind, Ozone, data = airquality, facets = . ~ Month)
      ```
- [ ] ```
      qplot(Wind, Ozone, data = airquality)
      ```
- [ ] ```
      qplot(Wind, Ozone, data = airquality, geom = "smooth")
      ```
</br>

### Remarks
Either `text()` or `points()` are considered for adding elements in base graphic system plots </br>

Question 8
----------
What is a **geom** in the ggplot2 system? </br>

### Answer
- [ ] a statistical transformation
- [x] a plotting object like point, line, or other shape
- [ ] a method for mapping data to attributes like color and size
- [ ] a method for making conditioning plots
</br>

### Remarks
N/A </br>

Question 9
----------
When I run the following code I get an error: </br>

```R
library(ggplot2)
library(ggplot2movies)
g <- ggplot(movies, aes(votes, rating))
print(g)
```
</br>

I was expecting a scatterplot of 'votes' and 'rating' to appear. What's the problem? </br>

### Answer
- [ ] There is a syntax error in the call to ggplot.
- [ ] The object 'g' does not have a print method.
- [x] ggplot does not yet know what type of layer to add to the plot.
- [ ] The dataset is too large and hence cannot be plotted to the screen.
</br>

### Remarks
N/A </br>

Question 10
----------
The following code creates a scatterplot of 'votes' and 'rating' from the movies dataset in the ggplot2 package. After loading the ggplot2 package with the library() function, I can run </br>

```R
qplot(votes, rating, data = movies)
```
</br>

How can I modify the the code above to add a smoother to the scatterplot? </br>

### Answer
- [x] ```
      qplot(votes, rating, data = movies) + geom_smooth()
      ```
- [ ]  ```
      qplot(votes, rating, data = movies, smooth = "loess")
      ```
- [ ] ```
      qplot(votes, rating, data = movies, panel = panel.loess)
      ```
- [ ] ```
      qplot(votes, rating, data = movies) + stats_smooth("loess")
      ```
</br>

### Remarks
N/A </br>
