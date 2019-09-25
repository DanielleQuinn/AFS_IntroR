# ---- Clear Environment ----
rm(list = ls())

# ---- Clear Console ----
# Windows: Ctrl-L
# Mac: Cmmd-L

# ---- Load packages ----
library(dplyr)
library(ggplot2)
library(lubridate)
# Note: If an error is produced saying there is no such package
# it means you need to install the package using install.packages()

# ---- Import Data ----
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

summary(data) # Summarise each column
str(data) # Display the structure of the object
glimpse(data) # Display the structure of the object using {dplyr}

# ---- Factors ----
# Factors are variables that have levels / categories / groups
# By default, read.csv() treats all strings (characters) as factors
class(data$habitat)
class(data$site)

# Goal: What are the levels of habitat?
levels(data$habitat)
levels(data$site)

# Goal: What would this column look like if it was treated as a number?
as.numeric(data$site) # This doesn't change the object unless you overwrite the existing column

# ---- {tidyverse} ----
# The {tidyverse} is a collection of packages that share an
# underlying design philosophy, grammar, and data structures and
# work with "tidy data", which follows specific rules and best practices

# {dplyr}: data manipulation #
# {ggplot2}: visualizing data #
# {lubridate}: working with dates and times #
# {tidyr}: tidying data
# {broom}: tidying output from models
# {stringr}: working with strings
# {forcats}: working with factors
# {purrr}: functional programming
# {rvset}: web scraping

# https://www.tidyverse.org/packages/

# ---- Subsetting Data with {dplyr} ----
# select() : selects columns from a data frame and outputs as a data frame
# Example: Output the column called year
select(data, year)

## Can you explain why the output is different for each of these?
data$year
select(data, year)

# Goal: Output the columns called site and common_name
select(data, site, common_name)

# Goal: Convert the data frame to a tibble for easier viewing
data_tb <- as_tibble(data)
# A tibble is essentially the same as a data frame, with some extra features
# Today, primarily just the way the output is shown; more user friendly
data
data_tb

# Goal: Output the columns called site and common_name
select(data_tb, site, common_name)

# filter() : filters rows from a data frame
# Example: Output the rows where year is less than or equal to 2000
filter(data_tb, year <= 2000)

# Goal: Output the rows that correspond to data from site D
filter(data_tb, site == "D")

# Goal: Output the rows that correspond to data from pools in site D
filter(data_tb,
       site == "D",
       habitat == "pool")

## What is the output from the following line of code?
filter(data_tb,
       year %in% c(1999, 2001),
       month > 6,
       site == "A",
       common_name == "Creek Chub")

## What is the output from the following line of code?
filter(data_tb,
       between(year, 1999, 2001),
       month > 1,
       month < 4,
       site != "A",
       common_name == "Creek Chub")

# ---- Pipes ----
# Information is put into a pipe %>%
# It comes out the other end and is used as the first argument
# for the function on the other side

# Goal: Find the square root of 81
81 %>% sqrt()
# 81 becomes the argument for sqrt()

# Goal: Output the rows that correspond to data from site A
filter(data_tb, site == "A")

data_tb %>% filter(site == "A")
# data_tb becomes the first argument for filter

# This can also be written as
data_tb %>%
  filter(site == "A")

# Pipes are valuable when we want to perform multiple steps

# Goal: Find the square root of the absolute value of -16
# Nested functions
sqrt(abs(-16))

# Pipes
-16 %>% abs() %>% sqrt()

# Goal: Considering only data collected in 2000
# ouput the columns called year, habitat, and common_name
data_tb %>%
  filter(year == 2000) %>%
  select(year, habitat, common_name)

## Can you explain why this gives the same output?
data_tb %>%
  select(year, habitat, common_name) %>%
  filter(year == 2000)

## What would happen if you tried to run this?
data_tb %>%
  select(habitat, common_name) %>%
  filter(year == 2000)

## Choose any species.
# Output the common_name and count columns associated with that species.
data_tb %>%
  filter(common_name == "Green Sunfish") %>%
  select(common_name, count)

## Output the year, month, and site columns from instances where at least two
## individuals of that species were captured in a pool.
data_tb %>%
  filter(common_name == "Green Sunfish",
         count > 2,
         habitat == "pool") %>%
  select(year, month, site)

# ---- Summarising Data with {dplyr} ----
# summarise() : returns a single value based on the instructions you give it
# Goal: Find the maximum count
data_tb %>%
  summarise(max(count))

# group_by() : splits your data into groups based on the variables you specify
# Example: Group by site
data_tb %>%
  group_by(site)

# Goal: Use group_by() and summarise() together to find the average
# number of fish caught at each site
data_tb %>%
  group_by(site) %>%
  summarise(mean(count))

# This can be stored as a data frame
mean_counts <- data_tb %>%
  group_by(site) %>%
  summarise(mean(count))
mean_counts

# The column names can be specified in summarise
mean_counts <- data_tb %>%
  group_by(site) %>%
  summarise(average = mean(count))
mean_counts

# Goal: What is the average and sd of counts in each habitat type?
data_tb %>%
  group_by(habitat) %>%
  summarise(average = mean(count),
            sdev = sd(count))

# Goal: What is the average and sd of counts in each habitat type, by year?
data_tb %>%
  group_by(year, habitat) %>%
  summarise(average = mean(count),
            sdev = sd(count))

# Goal: What was the average number 
# of Creek Chub captured at each site?
data_tb %>%
  filter(common_name == "Creek Chub") %>%
  group_by(site) %>%
  summarise(average = mean(count))

# count() : counts occurences

# Goal: How many records at each site?
data_tb %>%
  count(site)

# n() : counts occurences in each group using summarise()

# Goal: How many records at each site by habitat type?
data_tb %>%
  group_by(site) %>%
  summarise(mycount = n())

## When might you use count() vs summarise(n())?
data_tb %>%
  group_by(site) %>%
  summarise(most_recent = max(year),
            total_records = n())


# n_distinct() : count unique values in each group using summarise()

# Goal: In how many unique years was each site sampled?
data_tb %>%
  group_by(site) %>%
  summarise(unique = n_distinct(year))

## Goal: How many total specimens were captured at each site?
data_tb %>%
  group_by(site) %>%
  summarise(total = sum(count))

## Goal: How many unique species were captured at each site?
data_tb %>%
  filter(count > 0) %>%
  group_by(site, habitat) %>%
  summarise(richness = n_distinct(common_name))


# ---- Manipulating Data with {dplyr} ----
# mutate() : create a new column
# Goal: Create a column called area, containing simulated sampling areas
# generated using rnorm()
set.seed(123) # This ensures that we all "randomly" generate the same values
myareas <- rnorm(n = nrow(data_tb), mean = 100, sd = 20)

data_tb %>%
  mutate(area = myareas)

# To make this change permanent, overwrite the data frame
data_tb <- data_tb %>%
  mutate(area = myareas)

# mutate() : create a new column based on another column
# Example: Create a column called density
data_tb <- data_tb %>%
  mutate(density = count / area)

glimpse(data_tb)

# Goal: Create a column called "present", that contains TRUE if a
# species was captured and FALSE if a species was not captured
data_tb$count > 0

data_tb <- data_tb %>%
  mutate(present = count > 0)

# Goal: Create a column called "present_v2" that contains "yes" if a 
# species was captured and "no" if a species was not captured
ifelse(data_tb$count > 0, "yes", "no")

data_tb <- data_tb %>%
  mutate(present_v2 = ifelse(count > 0, "yes", "no"))

glimpse(data_tb)

## Goal: Create a column called "records" that contains "new" if the 
# record was collected after 2010 and "old" if it was collected in 2009 or earlier
data_tb <- data_tb %>%
  mutate(records = ifelse(year > 2010, "new", "old"))

glimpse(data_tb)

# ---- Dealing with dates and times with {lubridate} ----
# ymd() : takes a string representing year-month-day and converts it to a date
test_value <- "1999-11-21"
test_value
class(test_value)

test_date <- ymd(test_value)
test_date
class(test_date)

# Goal: Combine year, month, and day into a format that can be 
# converted to a date
data_tb <- data_tb %>%
  mutate(date = ymd(paste(year, month, day, sep = "-")))

# ---- Capstone {dplyr} Exercise ----
## Create a summary table called "table1" that contains the
# total, mean, maximum, and minimum number of Central Stonerollers
# captured by year, site, and habitat
table1 <- data_tb %>%
  filter(common_name == "Central Stoneroller") %>%
  group_by(year, site, habitat) %>%
  summarise(total = sum(count),
            mean = mean(count), 
            minimum = min(count),
            maximum = max(count))
table1

# ---- Visualizations in {ggplot2} ----
# Any visualization has three components:
# 1. a data set (What are you trying to look at?)
# 2. a coordinate system (The most common are x and y axes)
# 3. a geom (How do you want to visualize the data set on the coordinate system?)
# ggplot2 uses layers to build plots

# ---- Starting with ggplot() ----
# Initialize ggplot()
ggplot()

# 1. Specify a data set
ggplot(data_tb)

# 2. Specify a coordinate system
ggplot(data_tb, aes(x = year, y = count))

# 3. Specify a geom
ggplot(data_tb, aes(x = year, y = count)) +
  geom_point()

ggplot(data_tb) +
  geom_point(aes(x = year, y = count))

# Goal: Create a boxplot with site on the x axis and area on the y axis
# Remember that this is simulated data!
ggplot(data_tb) +
  geom_boxplot(aes(x = site, y = area))

## What happens if a continuous variable is used on the x axis?
ggplot(data_tb) +
  geom_boxplot(aes(x = year, y = area))

ggplot(data_tb) +
  geom_boxplot(aes(x = as.factor(year), y = area))

# Goal: Create a histogram of area sampled
ggplot(data_tb) +
  geom_histogram(aes(x = area))

# ---- Adding Colour ----
## Create a scatterplot of mean number of individuals captured by year
ggplot(data_tb) +
  geom_point(aes(x = year, y = count))

# Goal: Make points blue  
## Can you explain why this happens?
ggplot(data_tb) +
  geom_point(aes(x = year, y = count, col = "blue"))
## How would you fix this?
ggplot(data_tb) +
  geom_point(aes(x = year, y = count), col = "blue")

# Goal: Make the color of each point based on the month
ggplot(data_tb) +
  geom_point(aes(x = year, y = count, col = month))

# Goal: Make the color of each point based on site
ggplot(data_tb) +
  geom_point(aes(x = year, y = count, col = site))

# ---- ggplot() as an Object ----
# Store ggplot plots as an object
plot1 <- ggplot(data) +
  geom_point(aes(x = year, y = count, col = site))
plot1

# Goal: Add labels on x and y axis
plot2 <- plot1 +
  xlab("Year") +
  ylab("Number Captured")
plot2 # show plot2

# Goal: Tidy up the background colours
plot3 <- plot2 +
  theme_bw()
plot3

# ---- Facetting ----
# Goal: Add a layer to plot3 that creates a separate panel for each habitat type
plot3 + facet_wrap(~habitat)

# Goal: Arrange the panels as a single column
plot3 + facet_wrap(~habitat, ncol = 1)

# ---- Capstone {ggplot2} Exercise ----
# Reproduce the plot found here:
# https://github.com/DanielleQuinn/OTN_workshop/blob/master/GapMinderReport.pdf

# Tip: Make a list of what needs to be done and tackle ONE thing at a time.

# Here is a list of things you'll
# need to do; see how many you can accomplish

# Don't hesitate to consult resources:
# http://www.cookbook-r.com/Graphs/
# We haven't seen all of these yet!

# data preparation:
# (1) subset table1 to only include samples from pools

# creating the plot:
# (1) Scatterplot with year on x axis and mean on y axis
# (2) X axis label is Year
# (3) Y axis label is Mean Number Caught
# (4) Theme is black and white
# (5) Point colour is based on site
# (6) NEW! Points are triangles
  ## See if you can work this one out with a partner
# (7) Facet your plot based on site using facet_wrap
# (8) Stack all facets into one column
# (9) NEW! Draw a line connecting the points
  ## Hint: geom_line()
# (10) NEW! Draw a dashed line represented the maximum number captured per year
  ## Hint: Just like col and shape, there is an argument called linetype
# (11) Draw a dashed line representing the minumum number captured per year
# (12) NEW! Allow the y axis limits to be based only on the points within them
  ## Hint: Look at R Cookbook ggplot2 under "Facets"
# (13) NEW! Specificy the colors to be used as red, blue, purple, orange, and black
  ## Hint: Look at R Cookbook ggplot2 under "Colors" > "Palettes Manually Defined"
# (14) NEW! Name the lengend SITE ID
  ## Hint: You can specify this in the name argument of the function used in step (13) 
# (16) NEW! Add a title: "Mean number of Central Stonerollers captured in pools between 2000 and 2015"
  ## Hint: ggtitle()
# (17) Store your finished plot in an object called myfigure
# (18) NEW! Save your plot to your working directory!
  ## Hint: ggsave()

# As you solve each piece, add an "x" next to it on the etherpad
# https://etherpad.net/p/2019-09-28-afs

# Solution:
myfigure <- ggplot(table1 %>% filter(habitat == "pool")) +
  geom_point(aes(x = year, y = mean, col = site), size = 4, shape = "triangle") + 
  geom_line(aes(x = year, y = mean, col = site)) +
  geom_line(aes(x = year, y = maximum, col = site), linetype = "dashed") +
  geom_line(aes(x = year, y = minimum, col = site), linetype = "dashed") +
  xlab("Year") +
  ylab("Mean Number Captured") + 
  theme_bw(12) +
  facet_wrap(~site, ncol = 1, scales = "free_y") +
  scale_color_manual(values = c("red", "blue", "purple", "orange", "black"),
                     name = "SITE ID") +
  ggtitle("Mean number of Central Stonerollers captured in pools between 2000 and 2015")

myfigure

# Saving plots to your current working directory
ggsave("myfigure.png", myfigure)
