# Maarit Tarkiainen 11 Nov Linear regression analyses
install.packages("ggplot2")
library(ggplot2)
learning2014<-read.table("/Users/maarit/IODS-project/data/learning2014") #read the data and name it "m"
str(learning2014) #See the structure of the data "m"

summary (m) #Shows summary of the variables in the data
#
# to access the GGally and ggplot2 libraries needed in sophisticated plots
install.packages("GGally")
library(GGally)
library(ggplot2)
#To explore the relationship of variables to one another, the following codes will produce a plot matrix
p <- ggpairs(learning2014, mapping = aes(col=gender, alpha=0.3), lower = list(combo = wrap("facethist", bins = 20)))
print(p)
#This picture shows correlations of all variables to each other, one by one. Both genders have been presented separately. 
#Age has the most non-normal distribution, with skewness to right.Attitude, surf and strategic questions show biggest difference between genders.
my_model <- lm(Points ~ Attitude + stra + surf, data = learning2014)
summary(my_model)
#The only factor in this model that has a significant p-value is Attitude. Thus, the exploration continues.
my_model2 <- lm(Points ~ Attitude + Age + deep, data = learning2014)
summary(my_model2)
# Also in this model, only Attitude is significant
my_model3 <- lm(Points ~ Attitude + gender + stra, data = learning2014)
summary(my_model3)
#Still, only attitude has a significant p value. Let's test it as the only factor
my_model4 <- lm(Points ~ Attitude, data = learning2014)
summary(my_model4)

my_model5 <- lm(Points ~ Attitude + stra, data = learning2014)
summary(my_model5)
#The adjusted R square of this model is 0.1951, meaning that 19.5% of the change in points is explained by the variables in the model.
# Coefficient estimate 0.34658 shows the change in Points when Attitude changes 1 unit.

par(mfrow = c(2, 2), oma = c(0, 0, 2, 0)) # this code will allow to print 4 different plot on same page
plot(my_model5, which = c(1,2,5)) # this code will print residuals vs fitted, Normal QQ-plot, and Residuals vs Leverage to test the assumptions of the model

getwd()
