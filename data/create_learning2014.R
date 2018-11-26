# load libraries
library(haven) # library haven for importing exporting data
library(dplyr)
learning2014<-read.delim("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", 
                         header = TRUE, sep = "\t")
# Explore the dimensions and structure of the data
dim(learning2014) 
# The data frame has 183 rows and 60 columns

str(learning2014) # Look at the structure
# 59 of the variables are integer vectors, i.e. whole numbers
# The variable gender is a factor with two levels "F" and "M"

# Create new variables according to the instructions
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")
attitude_questions<- c("Da" ,"Db" , "Dc" ,"Dd","De" ,"Df" , "Dg" , "Dh" ,"Di","Dj")
# select the columns related to deep learning and create column 'deep' by averaging
deep_columns <- select(learning2014, one_of(deep_questions))
learning2014$deep <- rowMeans(deep_columns)

# select the columns related to surface learning and create column 'surf' by averaging
surface_columns <- select(learning2014, one_of(surface_questions))
learning2014$surf <- rowMeans(surface_columns)

# select the columns related to strategic learning and create column 'stra' by averaging
strategic_columns <- select(learning2014, one_of(strategic_questions))
learning2014$stra<- rowMeans(strategic_columns)


# select the columns related to attitude and create column att by taking the mean
att_columns<-select(learning2014, one_of(attitude_questions))
learning2014$att<- rowMeans(att_columns)
learning2014$attitude<-learning2014$att
learning2014$age<-learning2014$Age
learning2014$points<-learning2014$Points
# Now make a working data.frame with the needed variables
keep_columns <- c("gender","age","attitude", "deep", "stra", "surf", "points")
learn <- select(learning2014,one_of(keep_columns))

# subset learn data.frame with Points over 0
learnNoZero<-subset(learn, points>0)
# Revise the structure of the new dataframe learnNoZero
str(learnNoZero)
head(learnNoZero)
# data frame with 166 observations and 7 variables,
# gender is a factor with two levels, Age and Points are integer vectors and
# the other variables are numeric

# 4
# set working directory
setwd("~/Dokumente/UniversitätHelsinki/Kurse/IODS-project")
# write dataframe to csv file
write.csv(learnNoZero, file = "learning2014.csv")
# read the file
students2014<-read.csv("learning2014.csv",row.names = 1)
str(students2014)
head(students2014)
# File is readable and writable and structure and data is correct.
# Check if the data is the same as provided by the course

df1<-read.csv("https://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/learning2014.txt", 
                         header = TRUE, sep = ",")
str(df1)
head(df1)
## Data seems to be the same 
