# Data wrangling Exercise using student performance 
# and alcohol consumption dataset 
# from https://archive.ics.uci.edu/ml/machine-learning-databases/00320/
# Predict student performance in secondary education (high school) in
# two schools in Portugal
# Source:
# Paulo Cortez, University of Minho, GuimarÃ£es, Portugal, 
# http://www3.dsi.uminho.pt/pcortez
##########################################
# Paul L K
Sys.Date()
#"2018-11-14"
##########################################

#Load libraries
library(curl)

#  Make a tmp objectfile
tmp <- tempfile()
# Download zipfile with curl to tmp
curl_download("https://archive.ics.uci.edu/ml/machine-learning-databases/00320/student.zip",tmp)
# set working directory to data
setwd(dir = "~/Dokumente/UniversitätHelsinki/Kurse/IODS-project/data")
# Now unzip the temporary file
unzip(tmp)
############
student.mat <- read.csv("student-mat.csv", sep = ";",  header = TRUE)
student.por <- read.csv("student-por.csv", sep = ";",  header = TRUE)
# Observe the structure and head and dimensions
str(student.mat)#'data.frame':	395 obs. of  33 variables
str(student.por)# 'data.frame': 649 obs. of  33 variables
head(student.mat)
head(student.por)
