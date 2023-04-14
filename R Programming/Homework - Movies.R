
getwd()
setwd("/home/fajarww93/R Programming/P2-Section6-Homework-Data")

rm(movies)
movies <- read.csv("Section6-Homework-Data.csv", stringsAsFactors = T)

head(movies)
colnames(movies)
colnames(movies) <- c("Release_Day",
                      "Director",
                      "Genre",
                      "Movie_Title",
                      "Release_Date",
                      "Studio",
                      "Adjusted_Gross",
                      "Budget",
                      "Gross",
                      "IMDb_Rating",
                      "MovieLens_Rating",
                      "Overseas",
                      "Overseas_percent",
                      "Profit",
                      "Profit_percent",
                      "Runtime",
                      "US",
                      "US_percent")
head(movies,10)
tail(movies,10)
str(movies)

#install.packages("ggplot2")
library(ggplot2)

action_movies <- movies[movies$Genre == "action",]
head(action_movies)
tail(action_movies)
factor(action_movies$Genre)

adventure_movies <- movies[movies$Genre == "adventure",]
head(adventure_movies)
tail(adventure_movies)
factor(adventure_movies$Genre)

animation_movies <- movies[movies$Genre == "animation",]
head(animation_movies)
tail(animation_movies)
factor(animation_movies$Genre)

comedy_movies <- movies[movies$Genre == "comedy",]
head(comedy_movies)
tail(comedy_movies)
factor(comedy_movies$Genre)

drama_movies <- movies[movies$Genre == "drama",]
head(drama_movies)
tail(drama_movies)
factor(drama_movies$Genre)

#?rbind
subset_movies <- rbind(action_movies,
                       adventure_movies,
                       animation_movies,
                       comedy_movies,
                       drama_movies)
head(subset_movies)
tail(subset_movies)
factor(subset_movies$Genre)
factor(movies$Genre)

rm(action_movies, adventure_movies, animation_movies,
   comedy_movies, drama_movies)

buenavista <- subset_movies[subset_movies$Studio == "Buena Vista Studios",]
head(buenavista)
tail(buenavista)
factor(buenavista$Studio)

fox <- subset_movies[subset_movies$Studio == "Fox",]
head(fox)
tail(fox)
factor(fox$Studio)

paramount <- subset_movies[subset_movies$Studio == "Paramount Pictures",]
head(paramount)
tail(paramount)
factor(paramount$Studio)

sony <- subset_movies[subset_movies$Studio == "Sony",]
head(sony)
tail(sony)
factor(sony$Studio)

universal <- subset_movies[subset_movies$Studio == "Universal",]
head(universal)
tail(universal)
factor(universal$Studio)

warnerbros <- subset_movies[subset_movies$Studio == "WB",]
head(warnerbros)
tail(warnerbros)
factor(warnerbros$Studio)

subset2 <- rbind(buenavista, fox, paramount, sony, universal, warnerbros)
head(subset2)
tail(subset2)
factor(subset2$Studio)

rm(subset_movies, buenavista, fox, paramount, sony, universal, warnerbros)

# ALTERNATIVE SOLUTION USING == AND | OPERATORS
rm(subset2)

filter_1 <- (movies$Genre == "action")|(movies$Genre == "adventure")|(movies$Genre == "animation")|(movies$Genre == "comedy")|(movies$Genre == "drama")
head(filter_1)
filter_2 <- (movies$Studio == "Buena Vista Studios")|(movies$Studio == "Fox")|(movies$Studio == "Paramount Pictures")|(movies$Studio == "Sony")|(movies$Studio == "Universal")|(movies$Studio == "WB")
head(filter_2)

subset2 <- movies[filter_1 & filter_2,]
head(subset2)

# ANOTHER ALTERNATIVE SOLUTION USING %in% OPERATOR

rm(subset2, filter_1, filter_2)
filter_1 <-movies$Genre %in% c("action","adventure","animation","comedy","drama")
head(filter_1)
filter_2 <-movies$Studio %in% c("Buena Vista Studios","Fox","Paramount Pictures","Sony","Universal","WB")
head(filter_2)

subset2 <- movies[filter_1 & filter_2,]
head(subset2)

# INSTALL EXTRA FONT PACKAGE TO USE COMIC SANS MS FONT
#install.packages("extrafont")
library(extrafont)
#font_import()
#y
fonts()
#fonttable()
#loadfonts()

#?labs()
#?element_text(hjust)
  
movies_aes <- ggplot(data=subset2,
                     aes(x=Genre, y=US_percent))
movies_aes + 
  geom_jitter(aes(colour=Studio,
                  size=Budget)) +
  geom_boxplot(size=1,
               alpha=0.5,
               outlier.shape=NA) +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre") + 
  labs(size="Budget $M") +
  theme(axis.title = element_text(colour="Blue",
                                  size = 15,
                                  face = "bold",
                                  family = "Ubuntu"),
        axis.text = element_text(size = 10,
                                 family = "Ubuntu"),
        legend.title = element_text(size = 15,
                                    family = "Ubuntu"),
        legend.text = element_text(size = 10,
                                   family = "Ubuntu"),
        plot.title = element_text(colour = "Black",
                                  face = "bold",
                                  size = 15,
                                  family = "Ubuntu",
                                  hjust = 0.5))
