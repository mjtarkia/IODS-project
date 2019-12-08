#meet and repeat - longitudinal data wrangling
#Maarit Tarkiainen
 # To start with, let's read the data into R
#https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt
#https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt
BPRS<-read.table ("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep=" ", header=TRUE)
rats<-read.table ("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep="", header=TRUE)
#The let's see the structure of BPRS and rats:

str(BPRS)
summary (BPRS)
# the data has altogether 40 observations and 11 variables, treatment, subject and  9 observations from same individuals from time points from week 0 to week 8. 

str(rats)
summary(rats)
#The data "rats" has 16 observations of 13 variables, first ID and treatment group, then Weight measurements from same individuals at 11 time points. 

library(dplyr)
library(tidyr)

#Let's change the categorical variables to factors:
BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)

rats$ID<-factor(rats$ID)
rats$Group<-factor(rats$Group)

#Now transforming tha data sets to a long form using "gather" -function and creating column "week" to BPRS and "time" to rats:
BPRSL <-  BPRS %>% gather(key = week, value = bprs, -treatment, -subject)
BPRSL <-  BPRSL %>% mutate(week = as.integer(substr(week,4,4)))
summary(BPRSL)
glimpse(BPRSL)
# The data RATSL has 360 rows, one for each time point of each subject. It has 4 variables:
# treatment, subject, week, and bprs (referring to the measurement)

#To save it:
write.table(BPRSL, file="BPRSL")

#Continue with ratsl:
ratsl<-rats %>% gather(key=time, value=rats, -ID, -Group)
ratsl <-  ratsl %>% mutate(time = as.integer(substr(time,4,4)))
summary(ratsl)
dim(ratsl)
glimpse(ratsl)

# The data "ratsl" has 176 rows and 4 columns. Each time point of a subject has a row of its own in the data.
# In addition to ID, the data has variables "Group", "time", and "rats", referring to the weight of the rat.

#Now let's save it:
write.table(ratsl, file="ratsl")


