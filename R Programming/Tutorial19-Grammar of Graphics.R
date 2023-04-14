getwd()
setwd("C:\\Users\\fajar\\OneDrive\\Documents\\R Programming")
getwd()

movies <- read.csv("P2-Movie-Ratings.csv", stringsAsFactors = T)
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating",
                      "BudgetMillions", "Year")
head(movies)
tail(movies)
str(movies)
summary(movies)

factor(movies$Year)
movies$Year <- factor(movies$Year) 
#change Year from integer to factor (categorical)
summary(movies)
str(movies)

#----------------- Aesthetics
library(ggplot2)

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

#add geometry
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) +
  geom_point()

#add colour
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                        colour=Genre)) +
  geom_point()

# add size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                        colour=Genre, size=Genre)) +
  geom_point()

# add size - better way
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                        colour=Genre, size=BudgetMillions)) +
  geom_point()

# >>> this #1 (we will improve it)


#---------------- Plotting with Layers

p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, 
                             colour=Genre, size=BudgetMillions))

# point
p + geom_point()

#lines
p + geom_line()

# multiple layers
p + geom_point() + geom_line() # line layer at the top of point layer
p + geom_line() + geom_point() # point layer at the top of line layer


#------------------ Overriding Aesthetics

q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre, size=BudgetMillions))

# add geom layer
q + geom_point()

# overriding aesthetics
# example 1
q + geom_point(aes(size=CriticRating))

# example 2
q + geom_point(aes(colour=BudgetMillions))

# q remains the same
q + geom_point()

# example 3
q + geom_point(aes(x=BudgetMillions)) +
  xlab("Budget Millions $$$")

# example 4
q + geom_line() + geom_point()
#reduce line size
q + geom_line(size=1) + geom_point()


#--------------- Mapping vs Setting

r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

# add colour
# 1. Mapping (what we have done so far)
r + geom_point(aes(colour=Genre))
#use aesthetics if using variable to colour

# 2. Setting
r + geom_point(colour="DarkGreen")
#use setting if using non variable to colour

# ERROR
r + geom_point(aes(colour="DarkGreen"))
#misleading, make "DarkGreen" as variable instead of colour

#1. Mapping
r + geom_point(aes(size=BudgetMillions))
#2. Setting
r + geom_point(size=10)
#ERROR
r + geom_point(aes(size=10))
#misleading, make 10 as variable instead of size


#----------------------- Histograms and Density Charts

s <- ggplot(data=movies, aes(x=BudgetMillions))
#no need to define y since the y axis will be overriden by "count" in histogram
s + geom_histogram(binwidth=10)

# add colour
s + geom_histogram(binwidth=10, aes(fill=Genre))

# add a border
s + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")

#>>>> chart #3 we will improve it

# sometime you may need density charts:
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position="stack")
# will not be presented to customer since it is hard for executive board

#--------------- Starting Layer Tips

t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth=10,
                   fill="white",
                   colour="Blue")

# another way
t <- ggplot(data=movies)
t + geom_histogram(binwidth=10,
                   aes(x=AudienceRating),
                   fill="white",
                   colour="Blue")
#>>>> chart #4

t + geom_histogram(binwidth=10,
                   aes(x=CriticRating),
                   fill="white",
                   colour="Blue")
#>>>> chart #5

# you may need this
t <- ggplot() # skeleton plot, then add layers


#------------- Statistical Transformation

?geom_smooth()

u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))
u + geom_point() + geom_smooth(fill=NA)

#boxplots

u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating,
                             colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()

#tip/hack:
u + geom_boxplot(size=1) + geom_jitter()
# geom_jitter() scatter the points instead of aligning it on a line 

#another way:
u + geom_jitter() + geom_boxplot(size=1, alpha=0.5)
# make boxplot on top of jitter points, and adds transparency to boxplot
# the result shows the thriller and drama has a great audience rating
# meanwhile the horror has the worst audience rating. In overall, the
# variance is quite low

#>>>>> chart #6

# Challenge for CriticRating
v <- ggplot(data=movies, aes(x=Genre, y=CriticRating,
                             colour=Genre))
v + geom_jitter() + geom_boxplot(size=1, alpha=0.5)
# in overall, CriticRating has more diverse results and more variance instead of
# AudienceRating. But the best and worst category are likely the same, Thriller
# is the best genre and horror is the worst genre


#------------ using facets

w <- ggplot(data=movies, aes(x=BudgetMillions))
w + geom_histogram(binwidth=10, aes(fill=Genre),
                   colour="Black")

# facets:
w + geom_histogram(binwidth=10, aes(fill=Genre),
                   colour="Black") +
  facet_grid(Genre~.)

w + geom_histogram(binwidth=10, aes(fill=Genre),
                   colour="Black") +
  facet_grid(Genre~., scales="free")

#scatterplots:
k <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             colour=Genre))
k + geom_point(size=3)

#facets:
k + geom_point(size=3) + 
  facet_grid(Genre~.)

k + geom_point(size=3) + 
  facet_grid(.~Year)

k + geom_point(size=3) + 
  facet_grid(Genre~Year)

k + geom_point(size=3) + 
  geom_smooth() +
  facet_grid(Genre~Year)

k + geom_point(aes(size=BudgetMillions)) + 
  geom_smooth() +
  facet_grid(Genre~Year)
#>>>> Chart #1 (but still will improve)


#----------- Coordinates
#Today:
#limits
#zoom

m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                             size=BudgetMillions,
                             colour=Genre))
m + geom_point()
m + geom_point() +
  xlim(50,100) +
  ylim(50,100)
#won't work well always

n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")
n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") +
  ylim(0,50)
#some data being omitted

#instead - zoom:
n + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black") +
  coord_cartesian(ylim=c(0,50))
# zoom without omitting data, this is the way R zoom graph

# improve #1
k + geom_point(aes(size=BudgetMillions)) + 
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0,100))


#--------------------- Theme

o <- ggplot(data=movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")
h

# axes label
h + xlab("Money Axis")+
  ylab("Number of Movies")

# label formatting
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=15),
        axis.title.y = element_text(colour="Red", size=15))

# tick mark formatting
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=15),
        axis.title.y = element_text(colour="Red", size=15),
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=10))
?theme

#legend formatting
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=15),
        axis.title.y = element_text(colour="Red", size=15),
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=10),
        legend.title = element_text(size=15),
        legend.text = element_text(size=10),
        legend.position = c(1,1),
        legend.justification = c(1,1))

#title
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=15),
        axis.title.y = element_text(colour="Red", size=15),
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=10),
        
        legend.title = element_text(size=15),
        legend.text = element_text(size=10),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour="DarkBlue",
                                  size=30,
                                  family="Courier"))



