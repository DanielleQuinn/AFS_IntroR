# ---- Running Code ----
# On windows, Ctrl - Enter to run a line of code
# On Mac Cmd-Enter

# ---- R is a calculator ----
5 + 6
5 - 9
6 * 7
7/13
(4 + 5)/6

# ---- Conditional Operators ----
# Is 5 equal to 5?
5 == 5

# Is 5 equal to 6?
5 == 6

# Is 5 greater than 6?
5 > 6

# Is 5 greater than or equal to 6?
5 >= 6

# Is 5 not equal to 6?
!5 == 6
5 != 6

# Is 5 equal to 5 AND 7 greater than 6?
5 == 5 & 7 > 6

# Is 5 equal to 5 OR 7 greater than 10?
5 == 5 | 7 > 10

## Complete each conditional statement so that it returns TRUE
3 * 5 ___ 15
1/2 ___ 1/4
30 ___ 10 * 3 & 40 * 10 ___ 405

# ---- Functions ----
# Functions "do things"
# Recognizable by the function name followed by (
# Every ( needs a )

# Goal: Find the square root of 81
# Function name: sqrt
sqrt(81)

# Goal: Find the absolute value of 6 - 14
# Function name: abs
abs(6 - 14)

# Nesting functions
# Goal: Find the square root of the absolute value of 4 - 20
# Option 1: Evaluate in two steps
abs(4 - 20)
sqrt(16)
# Option 2: Nested functions
sqrt(abs(4 - 20))
# Option 3: Pipes - covered later

# Functions require specific types of arguments
sqrt("a")

## Try using the functions called log, log10, and exp
# What do each of them do?
log(10) # computes natural logarithm
log10(10) # computes base 10 logarithm
exp(10) # computes the exponential function

# Arguments are named, but it's not always neccessary to
# call them by name
sqrt(x = 10)

# Some functions use more than one argument
# It's not always neccessary to provide these
?rnorm

# Goal: Return one value from a normal distribution
# that has a mean of 0 and a standard deviation of 1
rnorm(n = 1)
# By default, rnorm uses mean = 0 and sd = 1

# Goal: Return one value from a normal distribution
# that has a mean of 10 and a standard deviation of 6
rnorm(n = 1, mean = 10, sd = 6)

rnorm(1, 10, 6) # Why might this be a bad idea?
rnorm(mean = 10, n = 1, sd = 6) # Why might this be a bad idea?
rnorm(n = 1, sd = 5) # Is this okay?

# ---- Packages ----
# Packages are collections of functions built by other users

# Step One: Download & install the package to your local library
install.packages("ggplot2") # one time use

# Step Two: Access the package's functions from the local library
library(ggplot2) # every time you start RStudio

# ---- Finding Help ----
# Option 1: Google
# Option 2: Cheat Sheet
# Option 3: Ask R
?mean  # asking about a specific function
??average # searching for a keyword in your downloaded packages

# ---- Objects ----
# Objects ("containers" store information in the form of
# values and various attributes depending on their structure

# Goal: Find and use the value of pi
pi
pi * 10

# Goal: Make an object called x that contains the value 15
# Use the assignment operator <-
x <- 15
x

15 -> x # Can you think of why this might be a bad idea?

# Goal: Make an object called y that contains the value of x plus 3
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
str(myvector)
class(myvector)

# Goal: Apply a function to all elements in a vector
myvector + 30
sqrt(myvector)

# Is each element in myvector greater than 5?
myvector > 5

# Is 11 found in this vector?
11 %in% myvector

# Goal: Create a vector called myseq that contains all 
# odd numbers between 1 and 300.
# Hint: ?seq
?seq
myseq <- seq(from = 1, to = 300, by = 2)
myseq

# How many elements are in myseq?
length(myseq)

# Is 25 found in myseq?
25 %in% myseq

# What is the average value of myseq?
mean(myseq)

# Goal: Create a vector called numbers that contains
# the numbers 1, 6, 3, 4, and 10
numbers <- c(1, 6, 3, 4, 10) # "c" means "combine" into a vector
numbers

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
class(numbers) # numeric
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

# ---- Data Structures: Data Frames ----
# How does all of this relate to the type of data
# you'll likely have in a wildlife / fisheries context?


# Spreadsheets ("flat files") with columns and rows
# Tidy Data: Each row is an observation, 
#            Each column is a measurement (variable).

# IMPORTANT: Each column is a vector (atomic) #

# Goal: Create a data frame with a column called "one" containing the values 1 to 5
# and a column called "two" containing the letters a to e. Call this data frame mydata
mydata <- data.frame(one = 1:5,
                     two = c("a", "b", "c", "d", "e"))
mydata

# In standard R syntax, you can extract a column of a 
# data frame as a vector using $
mydata$one # "Show me the contents of the component called one in the object called mydata"
mydata$two

# Then you can treat it like a regular vector
# Goal: What is the average value in the column called one?
mean(mydata$one)

# ---- Importing Data ----
# Goal: Import a .txt file

## Step One: Tell R where to look
setwd("C:/Users/Danielle/Desktop/AFS_IntroR")

## Step Two: Load the data
species <- read.delim("species.txt")
species

# What class is the object called species?
class(species)

# View species in a new tab
View(species)
