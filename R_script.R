#variable creation
num1<-12
num2<-20

calc<-num1+num2
calc

typeof(num1)
#double-precision floating-point numbers
#higher precision that numeric data types

name<-'jessica'

typeof(name)

num1<-as.integer(num1)

typeof(num1)

#to convert dataypes:
as.integer()
as.character()
as.numeric()

#logical datatype 
bool1<- TRUE
typeof(bool1)

bool2<-F
typeof(bool2)

#vectors
v1<- c(12, 12, 34, 32)
v1

v2<- c('hello', 'pen', 'mug')

is.vector(v2)

v3<- c('hello', 23)
is.vector(v3)

v3

#matrix

m1<- matrix(c(12, 34, 32))
m1
is.matrix(m1)
m2<- matrix(c('hi', 23))
m2

m3<- matrix(c('a', 'b', 'c', 'd'), nrow=2, byrow=TRUE)
m3
nrow(m3) #give number of rows
ncol(m3) #give number of columns 

#list
list1<- list(12,34,54,56,-45, 'jess')
list1

list[1] #start index at 1 in R 
list1[1:3]

v1[3]

seq1<- seq(10, 20, 2)  #from, to, step
seq1

seq(10)  #sequence of number ranging from 1 to 10 

typeof(seq1)

#dataframe

df<-as.data.frame(list1)
df

list_name<- list('jessica', 'Qifang', 'Noelli')
list_colour<- list('purple', 'orange', 'blue')

df2<-data.frame(list_name,list_colour)
df2

df2[1:3]

#importing a dataset as dataframe
df<- read.csv("/Users/pc/Desktop/Dataset_R.csv")

#exploratory commands

head(df)

df_summary  # equivalent to the describe() in python but also gives # of NA
#NA's:3 for the worker column
# NA's:5 for the revenue column
# we have a total of 8 missing values in the dataset

colSums(is.na(df)) #to get the sum of missing values for each columns 

df_summary2<- as.data.frame(df_summary)

str(df) #STRUCTure of the dataframe, equivalent to info() in python 

View(df) #open the dataframe in a new window 

nrow(df) #number of rows
ncol(df) #number of columns

#Data selection
df$revenue #column selection
df['revenue']

#Data modification
df$widgetName <-NULL #removing a column
View(df)

#removing missing values
clean_data <- na.omit(df)
colSums(is.na(clean_data))

#grouping data with dplyer
install.packages("dplyr")

library(dplyr)

?dplyr #documentation 

df_indutry<- df %>%  # pipe operator to pass data to the next line
  group_by(industry) %>%
  summarise(summary = mean(revenue))%>%
  arrange(desc(summary))

View(df_indutry)

#Plotting

#install.packages("ggplot2")

library(ggplot2)

?ggplot2 #documentation
# check this cheatsheet to help for plotting: https://github.com/rstudio/cheatsheets/blob/main/data-visualization.pdf

#mtcars dataset analysis and plotting
?mtcars

mtcars

#exploratory commands
summary(mtcars)
str(mtcars)

typeof(mtcars)

#convert the dataset to a dataframe
df_cars<- as.data.frame(mtcars)

typeof(df_cars)
class(df_cars)
class(mtcars)

#basic plot with R to look at the correlation between car's horsepower and weight

names(df_cars)

plot(df_cars$hp, df_cars$wt, main='car weight against horsepower')

#box plot with ggplot 2 (more high end visualisation)
plot1<-ggplot(df_cars, aes(x=df_cars$hp, y=df_cars$wt))+
  geom_boxplot()

plot1

#alternative writing
a<-ggplot(df_cars, aes(x=df_cars$hp, y=df_cars$wt))
a+geom_boxplot()

#histogram
ggplot(df_cars, aes(x=df_cars$mpg))+
  geom_histogram()

mean(df_cars$mpg)

#bar plot
ggplot(df_cars, aes(x=as.factor(hp)))+
  geom_bar()

#scatter plot to llok at the linear correlation between horespower and car weight
ggplot(df_cars, aes(x=df_cars$hp, y=df_cars$wt, color='red'))+
  geom_point()+
  labs(
    title='Car weight against hoursepower',
    x='car weight',
    y='hoursepower'
  )+
  geom_smooth(method='lm', color='purple')

#it seems we have a moderate positive correlation between
#the horsepower and car weight.

?mtcars

#Activity: explore other variables using the same plot as above 
#to look for potential correlations between variuables. 
#Which variable combinations display some type of linear correlation and does it makes sense in the car point of view?

figure1<-ggplot(df_cars, aes(x=df_cars$hp, y=df_cars$wt))
figure1+geom_point()


ggplot(df_cars, aes(x=df_cars$mpg, y=df_cars$wt, color='red'))+
  geom_point()+
  labs(
    title='Car weight against hoursepower',
    x='fuel efficiently',
    y='car weight'
  )+
  geom_smooth(method='lm', color='purple')


#List of other datasets
library(help = "datasets")
