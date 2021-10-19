# (JHU Coursera) Exploatory Data Analysis Quiz 1 Summary

Description: This is the summary quiz Colin took during his learning journey for JHU's Data Science's coursera courses.</br>

Question 1
----------
Which of the following is a principle of analytic graphics? </br>

### Answer
- [ ] Show box plots (univariate summaries) 
- [x] Integrate multiple mode of evidence
- [ ] Make judicious use of color in your scatterplots
- [ ] Don't plot more than two variables at at time 
- [ ] Only do what your tools allow you to do
</br>

### Remarks
The principle of analyitc graphics consist of *integrate multiple modes of evidence*, *show comparisons*, *show causality, mechanism, explanation* and *Describe and document the evidence* </br>

Question 2
----------
What is the role of exploratory graphs in data analysis? </br>

### Answer
- [x] They are typically made very quickly.
- [ ] Axes, legends, and other details are clean and exactly detailed.
- [ ] Only a few are constructed.
- [ ] They are made for formal presentations.
</br>

### Remarks
Roles of exploratory graphs in data analysis are *made very quickly* while serving for *personal understanding* of results. </br>

Question 3
----------
Which of the following is true about the base plotting system? </br>

### Answer
- [ ] Margins and spacings are adjusted automatically depending on the type of plot and the data
- [ ] The system is most useful for conditioning plots
- [ ] Plots are typically created with a single function call
- [x] Plots are created and annotated with separate functions
</br>

### Remarks
Functions like `plot` or `hist` typically create the plot on the graphics device and functions like `lines`, `text`, or `points` will annotate or add data to the plot. </br>

Question 4
----------
Which of the following is an example of a valid graphics device in R? </br>

### Answer
- [x] A PNG file
- [ ] A file folder
- [ ] A Microsoft Word document
- [ ] The keyboard
- [ ] A socket connection
</br>

### Remarks
Either A PNG file or a computer screen are considered as valid graphics device in R </br>

Question 5
----------
Which of the following is an example of a vector graphics device in R? </br>

### Answer
- [ ] GIF
- [x] Postscript
- [ ] JPEG
- [ ] TIFF
- [ ] PNG
</br>

### Remarks
Either postscript or SVG files are considered as vector graphics device in R </br>

Question 6
----------
Bitmapped file formats can be most useful for? </br>

### Answer
- [ ] Plots that are not scaled to a specific resolution
- [x] Scatterplots with many many points
- [ ] Plots that require animation or interactivity
- [ ] Plots that may need to be resized
</br>

### Remarks
N/A </br>

Question 7
----------
Which of the following functions is typically used to add elements to a plot in the base graphics system? </br>

### Answer
- [ ] `plot()`
- [ ] `hist()`
- [x] `lines()`
- [ ] `boxplot()`
</br>

### Remarks
Either `text()` or `points()` are considered for adding elements in base graphic system plots </br>

Question 8
----------
Which function opens the screen graphics device for the Mac?</br>

### Answer
- [x] quartz()
- [ ] pdf()
- [ ] png()
- [ ] bitmap()
</br>

### Remarks
N/A </br>

Question 9
----------
What does the 'pch' option to `par()` control? </br>

### Answer
- [ ] the line width in the base graphics system
- [ ] the size of the plotting symbol in a scatterplot
- [x] the plotting symbol/character in the base graphics system
- [ ] the orientation of the axis labels on the plot
</br>

### Remarks
N/A </br>

Question 10
----------
If I want to save a plot to a PDF file, which of the following is a correct way of doing that? </br>

### Answer
- [ ] Open the screen device with `quartz()`, construct the plot, and then close the device with `dev.off()`.
- [ ] Open the PostScript device with `postscript()`, construct the plot, then close the device with `dev.off()`.
- [ ] Construct the plot on the PNG device with `png()`, then copy it to a PDF with `dev.copy2pdf()`.
- [x] Construct the plot on the screen device and then copy it to a PDF file with `dev.copy2pdf()`
</br>

### Remarks
N/A </br>
