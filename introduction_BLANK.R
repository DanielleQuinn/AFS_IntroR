# ---- Running Code ----
# On windows, Ctrl - Enter to run a line of code
# On Mac Cmd-Enter

# ---- Mathematical Operators ----


# ---- Conditional Operators ----
# 5 is equal to 5


# 5 is equal to 6


# 5 is greater than 6


# 5 is greater than or equal to 6


# 5 is not equal to 6


# 5 is equal to 5 AND 7 is greater than 6


# 5 is equal to 5 OR 7 is greater than 10


## Complete each conditional statement so that it returns TRUE
3 * 5 ___ 15
1/2 ___ 1/4
30 ___ 10 * 3 & 40 * 10 ___ 405

# ---- Functions ----
# Goal: Find the square root of 81
# Function name: sqrt
# Argument: 81


# Goal: Find the absolute value of 6 - 14
# Function name: abs
# Argument: 6 - 14


# Goal: Find the square root of the absolute value of 4 - 20
# Option 1: Evaluate in two steps


# Option 2: Nested functions
# The output of abs(4 - 20) becomes the argument for sqrt()



# Functions require specific types of arguments


## Try using the functions called log, log10, and exp
# What do each of them do?


# Arguments are named


# Some functions use more than one argument
# It's not always neccessary to provide these


# Goal: Return one value from a normal distribution
# that has a mean of 0 and a standard deviation of 1


rnorm() # produces an error
## What does this error message tell you?

# Goal: Return one value from a normal distribution
# that has a mean of 10 and a standard deviation of 6


rnorm(1, 10, 6) # Why might this be a bad idea?
rnorm(mean = 10, n = 1, sd = 6) # Why might this be a bad idea?
rnorm(n = 1, sd = 5) # Is this okay?

# ---- Packages ----
# Packages are collections of functions built by other users
#
# Step One: Download & install the package to your local library


# Step Two: Access the package's functions from the local library


# ---- Finding Help ----
# Option 1: Google
# Option 2: Cheat Sheet
# Option 3: Ask R
?mean  # asking about a specific function
??average # searching for a keyword in your downloaded packages

# ---- Objects ----
# Goal: Find the value of the object called pi


# Goal: Use pi to accomplish a task


# Goal: Make an object called x that contains the value 15
# Use the assignment operator <-


15 -> x # Can you think of why this might be a bad idea?

## Goal: Make an object called y that contains the value of x plus 3


# Note: If you update x, y does not update automatically


## Without running this code, what do you expect to get as output?
a <- 10
b <- 15
A <- 100
c <- a + b
b <- 50
c

# (a) 115
# (b) 25 *
# (c) 150
# (d) 60

# ---- Data Classes ----
# Numeric


# Character


# Logical



sqrt(mytest) # Can you think of why this works?
sqrt(FALSE) # Hint: why is this output different?

# ---- Data Structures: Vectors ----
# One dimensional, >1 element
# Goal: Put all integers from 2 to 9 into the object called myvector


# Goal: How many elements are in the vector called myvector?


# Goal: What class of data is found in myvector?


# Goal: Apply a function to all elements in a vector


# Is each element in myvector greater than 5?


# Is 11 found in this vector?


# Goal: Create a vector called mynumbers that contains
# the numbers 1, 6, 3, 4, and 10


## How many elements are in mynumbers?


## Is 25 found in myseq?


## What is the average value of mynumbers?


# Goal: Create a vector called fruit that contains the words apple, orange, and kiwi


# Goal: Add "banana" to the vector called fruit


# Goal: Create a vector called tests that contains TRUE and FALSE


## Create a vector called aboutme that contains three elements:
# Your first name
# Your last name
# Your favourite study species


## Add an element to the first position of aboutme
# that contains the month you were born


# ---- Characteristics of Vectors ----
# Vectors are "atomic": they can only contain one class of data


# Implication: You can't mix characters and numbers


# Goal: What is the average number of eggs?


# Goal: Create a new object called neweggs that contains
# the values from eggs treated as a numeric vector


# Goal: What is the average/minimum/maximum number of eggs?


# ---- Dealing with NAs ----
# Missing values are represented by NA

# Goal: Calculate basic statistics while ignoring the NAs

# na.rm is an optional argument in several similar functions


# Goal: Asses which values are NAs
# A new function that acts like a conditional operator: is.na()

# Logical statement: each value neweggs is equal to NA


# Logical statement: each value of neweggs is not equal to NA


# ---- Data Structures: Data Frames ----
# How does all of this relate to the type of data
# you'll likely have in a wildlife / fisheries context?

# Spreadsheets ("flat files") with columns and rows
# Tidy Data: Each row is an observation, 
#            Each column is a measurement (variable).

## IMPORTANT: Each column is a vector (atomic) ##

# Goal: Create a data frame with a column called "one" containing the values 1 to 5
# and a column called "two" containing the letters a to e. Call this data frame mydata


# In standard R syntax, you can extract a column of a 
# data frame as a vector using $


# Goal: What is the average value in the column called one?


# ---- Import Data ----
# Goal: Import a .csv file

# 1. Check your working directory


# 2. List files in your working directory


# 3. Import the data


# ---- Exploring Data Frames ----
