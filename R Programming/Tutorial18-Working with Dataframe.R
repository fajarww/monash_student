?read.csv

# Method 1: Select The File Manually
stats <- read.csv(file.choose(), stringsAsFactors = T)
stats

# Method 2: Set WD and Read Data
getwd()
# Windows:
setwd("C:\\Users\\fajar\\OneDrive\\Documents\\R Programming")
# Mac:
# setwd("/Users/fajar/Desktop/R programming")
getwd()
rm(stats)
stats <- read.csv("P2-Demographic-Data.csv", stringsAsFactors = T)
stats

# --------------------------------------------- Exploring Data
stats
nrow(stats) # Imported 195 rows
ncol(stats) # Imported   5 cols

head(stats, n=10) # 10 first rows of data frame
tail(stats, n=6)  # 6 last rows of data frame

str(stats) # Structure of the data frame
?runif() # Random variables uniform distribution

summary(stats) # The descriptive statistics of data frame


# --------------------------------------------- Using the $ sign
stats
head(stats)
stats[3,3]
stats[3,"Birth.rate"]
stats[,"Internet.users"]
stats$Internet.users
stats$Internet.users[2]
?levels()
levels(stats$Income.Group)
?factor()
factor(stats$Income.Group)

#---------------------------------------------- Basic Operations with a DF
stats[1:10,] # subsetting
stats[3:9,]
stats[c(4,100),]
# Remember how the [] work
stats[1,]
is.data.frame(stats[1,]) # no need for drop = F
stats[,1]
is.data.frame(stats[,1]) # need for drop = F
stats[,1,drop=F]
is.data.frame(stats[,1,drop=F]) # successfully slice the data frame vertically

# multiply columns
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

# add column
head(stats)
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
head(stats)

# Test of knowledge
stats$xyz <- 1:5
head(stats,n=10)
stats$xyz <- 1:4 # error because not recycled as 1:5
head(stats,n=10) 
stats$xyz <- 1:6 # error because not recycled as 1:5
head(stats,n=10)
stats$xyz <- 1:10 # error because not recycled as 1:5
head(stats,n=10)

# remove column
head(stats)
stats$MyCalc <- NULL
stats$xyz <- NULL
head(stats)

#--------------------------------------------- Filtering Data Frame
head(stats)
filter <- stats$Internet.users < 2
stats[filter,] 
stats[stats$Birth.rate>40,]
stats[stats$Birth.rate>40 & stats$Internet.users<2,]
stats[stats$Income.Group == "High income",]
levels(stats$Income.Group)
stats[stats$Country.Name == "Malta",]

#-------------------------------------------- Introduction to qplot
#install.packages("ggplot2")
library(ggplot2)
?qplot
qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group, y=Birth.rate)
qplot(data=stats, x=Income.Group, y=Birth.rate,
      size=I(3))
qplot(data=stats, x=Income.Group, y=Birth.rate,
      size=I(3), colour=I("blue"))
qplot(data=stats, x=Income.Group, y=Birth.rate,
      geom="boxplot")

#-------------------------------------------- Visualizing what we need
qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate,
      size=I(4))
qplot(data=stats, x=Internet.users, y=Birth.rate,
      size=I(4), colour=I("red"))
qplot(data=stats, x=Internet.users, y=Birth.rate,
      size=I(3), colour=Income.Group)

#-------------------------------------------- Creating Data Frames
mydf <- data.frame(Countries_2012_Dataset,
                   Codes_2012_Dataset,
                   Regions_2012_Dataset)
head(mydf)
#colnames(mydf) <- c("Country", "Code", "Region")
#head(mydf)
rm(mydf)

mydf <- data.frame(Country=Countries_2012_Dataset,
                   Code=Codes_2012_Dataset,
                   Region=Regions_2012_Dataset)
head(mydf)
tail(mydf)

summary(mydf)


#------------------------------------------- Merging Data Frames
head(stats)
head(mydf)
?merge()
merged <- merge(stats, mydf, by.x = "Country.Code", by.y="Code")
#the "Code" column in mydf will be omitted in merged df
head(merged)
merged$Country <- NULL #duplicate columns with Country.Name
str(merged)
tail(merged)


#------------------------------------------- Visualizing with new Split
qplot(data=merged, x=Internet.users, y=Birth.rate)
qplot(data=merged, x=Internet.users, y=Birth.rate,
      colour=Region)
# 1. Shapes
# Try Google R shapes
qplot(data=merged, x=Internet.users, y=Birth.rate,
      colour=Region, size=I(5), shape=I(17))
qplot(data=merged, x=Internet.users, y=Birth.rate,
      colour=Region, size=I(5), shape=I(15))
qplot(data=merged, x=Internet.users, y=Birth.rate,
      colour=Region, size=I(5), shape=I(23))
# 2. Transparency
qplot(data=merged, x=Internet.users, y=Birth.rate,
      colour=Region, size=I(5), shape=I(19),
      alpha=I(0.1))
qplot(data=merged, x=Internet.users, y=Birth.rate,
      colour=Region, size=I(5), shape=I(19),
      alpha=I(0.6))
# 3. Title
qplot(data=merged, x=Internet.users, y=Birth.rate,
      colour=Region, size=I(5), shape=I(19),
      alpha=I(0.6),
      main="Birth Rate vs Internet Users")








