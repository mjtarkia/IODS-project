#Maarit Tarkiainen
#Starting with reading data sets:
hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")
#structure and dimensions of both data sets:
str(hd)
dim(hd)
str(gii)
dim(gii)
#summary for the datasets
summary(hd)
summary(gii)
#see the column names in the original "hd" data
colnames(hd)
#change the long column names of "hd" to shorter ones
colnames(hd)[1] <- "HDI.Rank"
colnames(hd)[3] <- "HDI"
colnames(hd)[4] <- "Life.Exp"
colnames(hd)[5] <- "Edu.Exp"
colnames(hd)[6] <- "Edu.Mean"
colnames(hd)[7] <- "GNI"
colnames(hd)[8] <- "GNI.Minus.Rank"
#see the column names in the original "gii" data
colnames(gii)
colnames(gii)[1] <- "GII.rank"
colnames(gii)[3] <- "GII"
colnames(gii)[4] <-"Mat.Mor" 
colnames(gii)[5] <- "Ado.Birth"  
colnames(gii)[6] <- "Parli.F"
colnames(gii)[7] <- "Edu2.F"
colnames(gii)[8] <- "Edu2.M"
colnames(gii)[9] <- "Labo.F"
colnames(gii)[10] <- "Labo.M"

#next, create a new variable to "gii":
library(dplyr)
gii <- mutate (gii, "Edu2.FM" = (gii$Edu2.F/gii$Edu2.M))
Edu2.FM
gii <- mutate (gii,"Labo.FM"  = (gii$Labo.F/gii$Labo.M))
Labo.FM
#Let's join the two data sets using country as identifier
hd_gii <- inner_join(hd, gii, by="Country")
str(hd_gii)
#poista tämä kun tsekkasit että hd_gii rakenne on oikea:
keep_col<-c( "GII.rank", "Country", "GII", "Edu.Exp", "Life.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F", "Edu2.F", "Edu2.M", "Labo.F", "Labo.M")

#To continue with data "human", let's down load it:
human<-read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", header=TRUE, sep= ",")
str(human)
dim(human)

#human data has 19 variables describing percentage of secondary education of males and females,
# labour participation, expected years of Education, Lifetime expectations, maternal mortality, adolesence births, 
#gross national income per capita, female participation in parliament in different countries and regions.

#to keep certain columns, namely  "Country", "Edu2.FM", "Labo.FM", "Edu.Exp", 
#"Life.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F", we'll create a vector "keep", then use select-function to discard other variables:

keep<-c( "Country", "Edu2.FM", "Labo.FM", "Edu.Exp", "Life.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")
human<-select(human, one_of(keep))
str(human)
#To select rows with complete data, we'll first form an indicator of completeness:
complete.cases(human)
data.frame(human[-1], comp=complete.cases(human))
#Then use Filter to include only rows with complete cases:
human<-filter(human, complete.cases(human))
str(human)
#To remove observation that refer to regions, not countries, first let's see the column "Country":
human$Country
# From the list we can see that the last 7 observations are regions, starting from row 156 "Arab States".
#first, let's define "last", which is the last row that will be kept, then select all rows until last:
last <- nrow(human) - 7
human_ <- human[1:last, ]
# Then will change countries as rownames and remove the column "Country"
rownames(human) <- human$Country




