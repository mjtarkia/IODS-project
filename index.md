---
title: "IODS course project"
Author: Maarit Tarkiainen
output:
  html_document:
    theme: cosmo
    toc: true
    toc_depth: 2
    fig_caption: true
    fig_width: 6
    fig_height: 4
---

***
  


# About the project

*Write a short description about the course and add a link to your GitHub repository here. This is an R Markdown (.Rmd) file so you can use R Markdown syntax.*

# My expectations 
On this course I hope to learn how to use R to produce statistical analysis for my PhD thesis. I hope R could be a tool to produce good figures as well. I have no previous experience in writing code, so I assume I need to work a lot on this course. I hearf of this course from my colleagues.#
https://github.com/mjtarkia/IODS-project
  
***
  

<<<<<<< HEAD
# Maarit Tarkiainen 11 Nov Linear regression analyses
```{r child = "chapter2.Rmd"}```


install.packages("ggplot2")
This library is needed to produce good sophisticated pictures

```r
library(ggplot2)
```
This will read the data and name it "learning2014"

```r
learning2014<-read.table("/Users/maarit/IODS-project/data/learning2014")
```
This will show the structure of the data "learning2014"


```r
str(learning2014) 
```

```
## 'data.frame':	166 obs. of  7 variables:
##  $ gender  : Factor w/ 2 levels "F","M": 1 2 1 2 2 1 2 1 2 1 ...
##  $ Age     : int  53 55 49 53 49 38 50 37 37 42 ...
##  $ Attitude: int  37 31 25 35 37 38 35 29 38 21 ...
##  $ deep    : num  3.58 2.92 3.5 3.5 3.67 ...
##  $ stra    : num  3.38 2.75 3.62 3.12 3.62 ...
##  $ surf    : num  2.58 3.17 2.25 2.25 2.83 ...
##  $ Points  : int  25 12 24 10 22 21 21 31 24 26 ...
```
To see a summery of the variables in "learning2014"

summary (learning2014)
```
To access the GGally and ggplot2 libraries needed in sophisticated plots
install.packages("GGally")

```r
library(GGally)
library(ggplot2)
```
To explore the relationship of variables to one another, the following codes will produce a plot matrix

```r
pairs (learning2014)
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-9-1.png)




```r
p <- ggpairs(learning2014, mapping = aes(col=gender, alpha=0.3), lower = list(combo = wrap("facethist", bins = 20)))
p
```

```
## plot: [1,1] [>--------------------------------------------] 2% est: 0s
## plot: [1,2] [=>-------------------------------------------] 4% est: 4s
## plot: [1,3] [==>------------------------------------------] 6% est: 8s
## plot: [1,4] [===>-----------------------------------------] 8% est: 8s
## plot: [1,5] [====>----------------------------------------] 10% est: 7s
## plot: [1,6] [=====>---------------------------------------] 12% est: 7s
## plot: [1,7] [=====>---------------------------------------] 14% est: 7s
## plot: [2,1] [======>--------------------------------------] 16% est: 6s
## plot: [2,2] [=======>-------------------------------------] 18% est: 7s
## plot: [2,3] [========>------------------------------------] 20% est: 7s
## plot: [2,4] [=========>-----------------------------------] 22% est: 6s
## plot: [2,5] [==========>----------------------------------] 24% est: 6s
## plot: [2,6] [===========>---------------------------------] 27% est: 5s
## plot: [2,7] [============>--------------------------------] 29% est: 5s
## plot: [3,1] [=============>-------------------------------] 31% est: 5s
## plot: [3,2] [==============>------------------------------] 33% est: 5s
## plot: [3,3] [===============>-----------------------------] 35% est: 4s
## plot: [3,4] [================>----------------------------] 37% est: 4s
## plot: [3,5] [================>----------------------------] 39% est: 4s
## plot: [3,6] [=================>---------------------------] 41% est: 4s
## plot: [3,7] [==================>--------------------------] 43% est: 4s
## plot: [4,1] [===================>-------------------------] 45% est: 3s
## plot: [4,2] [====================>------------------------] 47% est: 3s
## plot: [4,3] [=====================>-----------------------] 49% est: 3s
## plot: [4,4] [======================>----------------------] 51% est: 3s
## plot: [4,5] [=======================>---------------------] 53% est: 3s
## plot: [4,6] [========================>--------------------] 55% est: 3s
## plot: [4,7] [=========================>-------------------] 57% est: 3s
## plot: [5,1] [==========================>------------------] 59% est: 2s
## plot: [5,2] [===========================>-----------------] 61% est: 2s
## plot: [5,3] [===========================>-----------------] 63% est: 2s
## plot: [5,4] [============================>----------------] 65% est: 2s
## plot: [5,5] [=============================>---------------] 67% est: 2s
## plot: [5,6] [==============================>--------------] 69% est: 2s
## plot: [5,7] [===============================>-------------] 71% est: 2s
## plot: [6,1] [================================>------------] 73% est: 2s
## plot: [6,2] [=================================>-----------] 76% est: 2s
## plot: [6,3] [==================================>----------] 78% est: 1s
## plot: [6,4] [===================================>---------] 80% est: 1s
## plot: [6,5] [====================================>--------] 82% est: 1s
## plot: [6,6] [=====================================>-------] 84% est: 1s
## plot: [6,7] [======================================>------] 86% est: 1s
## plot: [7,1] [======================================>------] 88% est: 1s
## plot: [7,2] [=======================================>-----] 90% est: 1s
## plot: [7,3] [========================================>----] 92% est: 1s
## plot: [7,4] [=========================================>---] 94% est: 0s
## plot: [7,5] [==========================================>--] 96% est: 0s
## plot: [7,6] [===========================================>-] 98% est: 0s
## plot: [7,7] [=============================================]100% est: 0s
```

![plot of chunk unnamed-chunk-10](figure/unnamed-chunk-10-1.png)
This picture shows correlations of all variables to each other, one by one. Both genders have been presented separately. #Age has the most non-normal distribution, with skewness to right.Attitude, surf and strategic questions show biggest difference between genders.

```r
my_model <- lm(Points ~ Attitude + stra + surf, data = learning2014)
summary(my_model)
```

```
## 
## Call:
## lm(formula = Points ~ Attitude + stra + surf, data = learning2014)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -17.1550  -3.4346   0.5156   3.6401  10.8952 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 11.01711    3.68375   2.991  0.00322 ** 
## Attitude     0.33952    0.05741   5.913 1.93e-08 ***
## stra         0.85313    0.54159   1.575  0.11716    
## surf        -0.58607    0.80138  -0.731  0.46563    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 5.296 on 162 degrees of freedom
## Multiple R-squared:  0.2074,	Adjusted R-squared:  0.1927 
## F-statistic: 14.13 on 3 and 162 DF,  p-value: 3.156e-08
```
The only factor in this model that has a significant p-value is Attitude. Thus, the exploration continues.

```r
my_model2 <- lm(Points ~ Attitude + Age + deep, data = learning2014)
summary(my_model2)
```

```
## 
## Call:
## lm(formula = Points ~ Attitude + Age + deep, data = learning2014)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -17.206  -3.430   0.204   3.979  10.950 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) 15.60773    3.38966   4.605 8.32e-06 ***
## Attitude     0.35941    0.05696   6.310 2.56e-09 ***
## Age         -0.07716    0.05322  -1.450    0.149    
## deep        -0.60275    0.75031  -0.803    0.423    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 5.307 on 162 degrees of freedom
## Multiple R-squared:  0.2043,	Adjusted R-squared:  0.1896 
## F-statistic: 13.87 on 3 and 162 DF,  p-value: 4.305e-08
```
Also in this model, only Attitude is significant


```r
my_model5 <- lm(Points ~ Attitude + stra, data = learning2014)
summary(my_model5)
```

```
## 
## Call:
## lm(formula = Points ~ Attitude + stra, data = learning2014)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -17.6436  -3.3113   0.5575   3.7928  10.9295 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  8.97290    2.39591   3.745  0.00025 ***
## Attitude     0.34658    0.05652   6.132 6.31e-09 ***
## stra         0.91365    0.53447   1.709  0.08927 .  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 5.289 on 163 degrees of freedom
## Multiple R-squared:  0.2048,	Adjusted R-squared:  0.1951 
## F-statistic: 20.99 on 2 and 163 DF,  p-value: 7.734e-09
```
The adjusted R square of this model is 0.1951, meaning that 19.5% of the change in points is explained by the variables in the model. It means that the model is not very good in explaning the variation in the test variable points.
Coefficient estimate 0.34658 shows the change in Points when Attitude changes 1 unit.
Let's allow R print 4 different plot on same page
And print residuals vs fitted, Normal QQ-plot, and Residuals vs Leverage to test the assumptions of the model:

```r
par(mfrow = c(2, 2), oma = c(0, 0, 2, 0))
plot(my_model5, which = c(1,2,5)) 
```

![plot of chunk unnamed-chunk-14](figure/unnamed-chunk-14-1.png)
The plots show that the residuals of the model are close to normally distributed.

***



