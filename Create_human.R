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
colnames(hd)[1] <- "HDIR"
colnames(hd)[3] <- "HDI"
colnames(hd)[4] <- "Life_exp"
colnames(hd)[5] <- "Edu_exp"
colnames(hd)[6] <- "Edu_mean"
colnames(hd)[7] <- "GNI_capita"
colnames(hd)[8] <- "GNI_HDI_rank"
#see the column names in the original "gii" data
colnames(gii)
colnames(gii)[1] <- "GII_rank"
colnames(gii)[3] <- "GII"
colnames(gii)[4] <-"mat_mortality_ratio" 
colnames(gii)[5] <- "adol_birth_rate"  
colnames(gii)[6] <- "parlament_repr_percent"
colnames(gii)[7] <- "second_edu_female"
colnames(gii)[8] <- "second_edu_male"
colnames(gii)[9] <- "labour_part_female"
colnames(gii)[10] <- "labour_part_male"

#next, create a new variable to "gii":
library(dplyr)
gii <- mutate (gii, sec_edu_ratiofm = (gii$second_edu_female/gii$second_edu_male))
sec_edu_ratiofm
gii <- mutate (gii, labour_part_ratiofm  = (gii$labour_part_female/gii$labour_part_male))
labour_part_ratiofm
#Let's join the two data sets using country as identifier
hd_gii <- inner_join(hd, gii, by="Country")
str(hd_gii)                         
