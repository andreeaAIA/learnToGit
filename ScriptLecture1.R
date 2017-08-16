#Lecture 1 

# Opening a script

# Using the button resembling a sheet of paper with a plus sign we can choose to 
# either open a script (R Script; shortcut on Windows: Cntrl+Shit+N) or any 
# other type of file - for example a R Markdown - which can aslo compile
# into a text document, with R code. 


#Creating a project
# Using the button in the upper right corner we can create a new project and
# associate it with an existing directory or folder. In this way, we can easily
# load all our work when we open R, and switch between projects when needed. 

# Setting the working directory: 
#Before starting work a new project, it is good to assign it to a specific 
#folder. In this way we can save all our data, files, and scripts in one location.

# This can be done by using the menu:
#   Session > Set Working Directory > Choose Directory 
#   Shortcut on Windows: Shift + Cntrl + H 


# In code we can do it: 

##### Setting working directory #####
setwd("C:/Users/alecu/Dropbox/!Jobb/Teaching/R kurs H2017")

#NB: Make sure you have the correct slash "/" when you write the path to the folder.

#NB2: If you use 4 hashtags or more before and after a title you can navigate in your 
# document more easily. 



##### Importing a dataset in R ########

#We can import the dataset by using the "Import dataset" button, selecting
#the appropriate format, and adjusting the settings. 


# if we are do to this with code we first need to install and load the 
# libraries. Libraries, or packages are additions to R that extend its
# capacities. In the simplest form R is a calculator, when we load
# librarties, we get additional features which may prove very useful. 

# There are over 6760 packages on CRAN. 

#If we are to read data from excel we can use the readxl package
install.packages("readxl") # We only do this once

library(readxl) #Here we load the library
#WE HAVE TO DO THIS EVERY TIME WE OPEN R


#How do we use this command? Question mark before asks for help
?read_excel
#To run code from the scrip we use Ctrl+Enter

#From the usage section we see that the first argument is the path
#of the dataset. We can find this. 
#The second one is the sheet, this is useful when you have multiple sheets.
#We just have one. The remainder of the paramters already have some default 
#values. As long as we agree with them, we do not have to change them, or 
#specify these paramters. 


#Reading the data into R
data <- read_excel("wage1.xls")

#Making it a data frame
data <- as.data.frame(data)

#We can also do this using the buttons in RStudio. 
#Click on the "Import dataset" button in the upper right part. 

library(readr)
dataset <- read_delim("wage1_csv.csv", 
                      ";", escape_double = FALSE, trim_ws = TRUE)
View(dataset)

#Now that we imported another format, R suggested for us a new library 
# If library readr is not installed, we should install it first. 

#Now let's read the text file, there's no option in the menu for that. 
#We can use the inbuilt function in R - read.table 
?read.table

wage1 <- read.table("wage1.txt", header = T, sep = "\t")

#### Looking at the data ####

View(data)
#In the viewer we can sort, and filter the columns. We can use multiple
#filters. 
#NB: THIS DOES NOT ALTER THE DATASET; IT ONLY LETS US SEE HOW IT WOULD LOOK

#### What is a dataset #### 


#### Describing the data #### 

summary(data)

#A lot of information is printed out. We often only need info on some
#of the variables. To do this we need to refer to a variable. 
#We can refer to variables using: nameOfDataset$variableName

data$wage

#To see the summary 
summary(data$wage)

#Now print the summary for the variable educ

# more general information data frames:
# They are made up of rows and columns
# Every variables is usually a column. Every unit a row
# Thus to look at the shape of a data frame we can use: 
str(data)

#It shows us that our data fram has 526 obs and 25 cols
#By using [] we refer to things within an object, first rows than cols
# data[ROWnr, COLnr] thus row 5 on column 2 is 
data[5,2]

#if we want to refer to multiple rows or cols 

### Plotting education against wage ####

#To plot we use the plot commando
?plot

plot(data$educ, #variable on the X-axis
     data$wage) # variable on the Y-axis
#Adding a regression line
abline(lm(wage~educ, data=data))


#### Histogram #### 
hist(data$exper)

#### Descriptives #### 
str(data)

library(stargazer)

stargazer(data, type="text")

stargazer(data[,c(2:5)], type="text",
          title = "Descriptive statistics",
          covariate.labels = c("Wage", "Education",
                               "Experience", "Tenure"))



#We can either copy it to word, or we can import it as html
stargazer(data[,c(2:5)], type="html",
          title = "Descriptive statistics",
          covariate.labels = c("Wage", "Education",
                               "Experience", "Tenure"))
