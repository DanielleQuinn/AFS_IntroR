# ---- Running Code ----
# On windows, Ctrl - Enter to run a line of code
# On Mac Cmd-Enter

# You should see > in the lower left hand corner of the Console window
# If you see + you have missed a piece of code and R is waiting
## Click in the Console and hit Escape to reset
# If you see     R is running a process in the background

# ---- Mathematical Operators ----
5 + 6
5 - 9
6 * 7
7/13
(4 + 5)/6

# ---- Conditional Operators ----
# Logical statements, return TRUE or FALSE

# 5 is equal to 5
5 == 5

# 5 is equal to 6
5 == 6

# 5 is greater than 6
5 > 6

# 5 is greater than or equal to 6
5 >= 6

# 5 is not equal to 6
!5 == 6
5 != 6

# 5 is equal to 5 AND 7 is greater than 6
5 == 5 & 7 > 6

# 5 is equal to 5 OR 7 is greater than 10
5 == 5 | 7 > 10

## Complete each conditional statement so that it returns TRUE
3 * 5 == 15
1/2 != 1/4
30 == 10 * 3 & 40 * 10 < 405

# ---- Functions ----
# Functions "do things"
# Recognizable by the function name followed by (
# Every ( needs a )
# The information inside the () is called the argument

# FunctionName(argument)

# Goal: Find the square root of 81
# Function name: sqrt
# Argument: 81
sqrt(81)

# Goal: Find the absolute value of 6 - 14
# Function name: abs
# Argument: 6 - 14
abs(6 - 14)

# Goal: Find the square root of the absolute value of 4 - 20
# Option 1: Evaluate in two steps
abs(4 - 20) # returns 16
sqrt(16)

# Option 2: Nested functions
# The output of abs(4 - 20) becomes the argument for sqrt()
sqrt(abs(4 - 20))

# Option 3: Pipes - covered later!

# Functions require specific types of arguments
sqrt("a")

## Try using the functions called log, log10, and exp
# What do each of them do?
log(10) # computes natural logarithm
log10(10) # computes base 10 logarithm
exp(10) # computes the exponential function

# Arguments are named, but it's not always neccessary to
# call them by name
# sqrt() requires an argument named 'x', which we specifiy to be 10
sqrt(x = 10)

# Some functions use more than one argument
# It's not always neccessary to provide these
# There are required arguments and optional arguments
# Optional arguments have default values
?rnorm

# Goal: Return one value from a normal distribution
# that has a mean of 0 and a standard deviation of 1
rnorm(n = 1, mean = 0, sd = 1)
rnorm(n = 1)
# By default, rnorm uses mean = 0 and sd = 1 so you don't
# need to specify those values

rnorm() # produces an error
## What does this error message tell you?

# Goal: Return one value from a normal distribution
# that has a mean of 10 and a standard deviation of 6
rnorm(n = 1, mean = 10, sd = 6)

rnorm(1, 10, 6) # Why might this be a bad idea?
rnorm(mean = 10, n = 1, sd = 6) # Why might this be a bad idea?
rnorm(n = 1, sd = 5) # Is this okay?

# ---- Packages ----
# Packages are collections of functions built by other users
#
# Step One: Download & install the package to your local library
install.packages("ggplot2") # one time use

# Step Two: Access the package's functions from the local library
library(ggplot2) # every time you start RStudio and want to use these functions

# ---- Finding Help ----
# Option 1: Google
# Option 2: Cheat Sheet
# Option 3: Ask R
?mean  # asking about a specific function
??average # searching for a keyword in your downloaded packages

# ---- Objects ----
# Objects ("containers") store information

# Goal: Find the value of the object called pi
pi

# Goal: Use pi to accomplish a task
pi * 10

# Goal: Make an object called x that contains the value 15
# Use the assignment operator <-
x <- 15
x

15 -> x # Can you think of why this might be a bad idea?

## Goal: Make an object called y that contains the value of x plus 3
y <- x + 3
y

# Note: If you update x, y does not update automatically
x <- 150
x
y
# This is different from some programming languages that
# you may have experience with - be careful!

## Without running this code, what do you expect to get as output?
a <- 10
b <- 15
A <- 100
c <- a + b
b <- 50
c

# (a) 115 - no, R is case sensitive
# (b) 25 - correct
# (c) 150 - no, R is case sensitive and object values don't update when other objects are updated
# (d) 60 - no, object values don't update when other objects are updated

# ---- Data Classes ----
# Numeric
mynumber <- 13
mynumber
class(mynumber)
sqrt(mynumber)

# Character
myword <- "hello"
myword
class(myword)
sqrt(myword)

# Logical
mytest <- TRUE
mytest
class(mytest)
sqrt(mytest) # Can you think of why this works?
sqrt(FALSE) # Hint: why is this output different?

# ---- Data Structures: Vectors ----
# One dimensional, >1 element
# Goal: Put all integers from 2 to 9 into the object called myvector
myvector <- 2:9
myvector

# Goal: How many elements are in the vector called myvector?
length(myvector)

# Goal: What class of data is found in myvector?
class(myvector)

# Goal: Apply a function to all elements in a vector
myvector + 30
sqrt(myvector)

# Is each element in myvector greater than 5?
myvector > 5

# Is 11 found in this vector?
11 %in% myvector

# Goal: Create a vector called mynumbers that contains
# the numbers 1, 6, 3, 4, and 10
mynumbers <- c(1, 6, 3, 4, 10) # "c" means "combine" into a vector
mynumbers

## How many elements are in mynumbers?
length(mynumbers)

## Is 25 found in myseq?
25 %in% mynumbers

## What is the average value of mynumbers?
mean(mynumbers)

# Goal: Create a vector called fruit that contains the words apple, orange, and kiwi
fruit <- c("apple", "orange", "kiwi")
fruit
class(fruit)

# Goal: Add "banana" to the vector called fruit
fruit <- c(fruit, "banana")
fruit

# Goal: Create a vector called tests that contains TRUE and FALSE
tests <- c(TRUE, TRUE, TRUE, FALSE)
tests
class(tests)

## Create a vector called aboutme that contains three elements:
# Your first name
# Your last name
# Your favourite study species
aboutme <- c("Danielle", "Quinn", "Little Skate")
aboutme

## Add an element to the first position of aboutme
# that contains the month you were born
aboutme <- c("January", aboutme)
aboutme

# ---- Characteristics of Vectors ----
# Vectors are "atomic": they can only contain one class of data
class(mynumbers) # numeric
class(fruit) # character

# Implication: You can't mix characters and numbers
eggs <- c(3, 6, 10, "missing value", 12)
class(eggs)

# Goal: What is the average number of eggs?
mean(eggs)

# Goal: Create a new object called neweggs that contains
# the values from eggs treated as a numeric vector
neweggs <- as.numeric(eggs)
neweggs

# Goal: What is the average/minimum/maximum number of eggs?
mean(neweggs)
min(neweggs)
max(neweggs)

# ---- Dealing with NAs ----
# Missing values are represented by NA

# Goal: Calculate basic statistics while ignoring the NAs
mean(neweggs, na.rm = TRUE)
# na.rm is an optional argument in several similar functions
min(neweggs, na.rm = TRUE)
max(neweggs, na.rm = TRUE)

# Goal: Asses which values are NAs
# A new function that acts like a conditional operator: is.na()

# Logical statement: each value neweggs is equal to NA
neweggs == NA # Doesn't work
is.na(neweggs) # Works

# Logical statement: each value of neweggs is not equal to NA
!is.na(neweggs)

# ---- Data Structures: Data Frames ----
# How does all of this relate to the type of data
# you'll likely have in a wildlife / fisheries context?

# Spreadsheets ("flat files") with columns and rows
# Tidy Data: Each row is an observation, 
#            Each column is a measurement (variable).

## IMPORTANT: Each column is a vector (atomic) ##

# Goal: Create a data frame with a column called "one" containing the values 1 to 5
# and a column called "two" containing the letters a to e. Call this data frame mydata
mydata <- data.frame(one = 1:5,
                     two = c("a", "b", "c", "d", "e"))
mydata

# In standard R syntax, you can extract a column of a 
# data frame as a vector using $
mydata$one # "Show me the contents of the component called one in the object called mydata"
mydata$two
mydata$three # Does not exist

# Then you can treat it like a regular vector
# Goal: What is the average value in the column called one?
mean(mydata$one)

# ---- Import Data ----
# Goal: Import a .csv file

# 1. Check your working directory
getwd()

# 2. List files in your working directory
list.files()

# 3. Import the data
data <- read.csv("KingsCreekFishSurveys.csv")

# ---- Exploring Data Frames ----
View(data) # View data in a new tab

dim(data) # Number of rows and columns
nrow(data) # Number of rows
ncol(data) # Number of columns

head(data) # Display the first six rows
tail(data) # Display the last six rows
names(data) # Display the names of each column

str(data) # Display the structure of the object
summary(data) # Summarise each column
