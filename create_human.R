# read the human data
#human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", sep  =",", header = T)
library(dplyr)
library(data.table)
hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

#Dimension and structure
str(hd)
dim(hd)
str(gii)
dim(gii)

# look at the (column) names of human
names(hd)

hd_new = c('HDI.Rank','Country','HDI','Life.Expec','Educ.Exp','Educ.Mean','GNI','GNI.Rank')
names(hd)[1:8]<-hd_new

# look at new names
names(hd)

#look at names of gii
names(gii)

gii_new = c('GII.Rank','Country','GII','Mat.Mor','Ado.Birth','Parli.F','Edu2.F','Edu2.M','Labo.F','Labo.M')
names(gii)[1:10]<-gii_new

# look at new names
names(gii)
# look at the structure of human
str(hd)
str(gii)


# print out summaries of the variables
summary(hd)
summary(gii)



# Mutate the “Gender inequality” data and create two new variables. 
# The first one should be the ratio of Female and Male populations with secondary education
# in each country. (i.e. edu2F / edu2M). The second new variable should be the ratio of labour force 
# participation of females and males in each country (i.e. labF / labM). (1 point)

gii <- mutate(gii, EduFM = Edu2F / Edu2M)
gii <- mutate(gii, LabFM = LabF / LabM)

# Join together the two datasets using the variable Country as the identifier.
# Keep only the countries in both data sets (Hint: inner join). 
# The joined data should have 195 observations and 19 variables. 
# Call the new joined data "human" and save it in your data folder. (1 point)
library(plyr)
human <- join(hd,gii,by="Country",type="inner")
setwd("~/Dokumente/UniversitätHelsinki/Kurse/IODS-project/data")

# write dataframe to csv file
write.csv(human, file = "create_human.csv")
# read the file
humanTEST<-read.csv("create_human.csv",row.names = 1)
str(humanTEST)
head(humanTEST)
# File is readable and writable and structure and data is correct.

#Verify if the data was saved/read correctly
verify <- read.csv("./data/human.csv")
str(verify)
head(verify)
