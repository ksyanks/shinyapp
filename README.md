### Welcome to the Automobile Exploratory Data Analysis

This application is built based on the data of 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973 - 74 models).

The dataset mtcars has been obtained from the R datasets package in R, Source:


This shinyapp produce a ggplot2, point plot, x-y graph. 
y axis is fixed to mpg (miles per gallon)

### How to use this Web Application
From the side panel, you can change the variables (input) that are injected to the plot, ggplot2.

- Check Box: Checked to analyse both auto and manual transmission data,
- Variable: To choose the different variables of the dataset for x axis.     
- Color: To choose the plotting color.      
- Distribution Type: Radio Botton to choose either auto or manual transmission data. This function will have no effect if the above check box was checked.   
- Numeric input: To change the plotting point size.  

### Code description
- The ggplot2 functions are used to display reactive parts of the output graph:
- Depending on the input Variables ggplot2 graph is plot accordingy against the mpg (Miles Per Gallon).
- If Check Box is checked, both Auto and Manual Transmission data will be included for analysis. When Check Box is checked Radio Button value will be ignore.
- If Check Box is not check, Depending which Radio Button is checked, either manual or auto tranmission data is used for analysis.
- Color, will change the color of plotting point.
- Plot size, will change the size of the plotting point.


    


   






