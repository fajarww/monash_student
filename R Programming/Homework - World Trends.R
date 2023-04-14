getwd()
setwd("C:\\Users\\fajar\\OneDrive\\Documents\\R Programming")
getwd()
wtrend <- read.csv("P2-Section5-Homework-Data.csv", stringsAsFactors = T)
head(wtrend)
str(wtrend)
summary(wtrend)


rm(Fertility_Rate_1960)
Fertility_Rate_1960 <- wtrend[wtrend$Year == 1960,]
Fertility_Rate_1960

rm(Fertility_Rate_2013)
Fertility_Rate_2013 <- wtrend[wtrend$Year == 2013,]
Fertility_Rate_2013


Life_Expectancy_1960 <- data.frame(Country.Code=Country_Code,
                                   Life.Expectancy=Life_Expectancy_At_Birth_1960)
Life_Expectancy_2013 <- data.frame(Country.Code=Country_Code,
                                   Life.Expectancy=Life_Expectancy_At_Birth_2013)
head(Life_Expectancy_1960)
head(Life_Expectancy_2013)


head(Fertility_Rate_1960)
head(Life_Expectancy_1960)
stats_1960 <- merge(Fertility_Rate_1960, Life_Expectancy_1960,
                    by.x="Country.Code", by.y="Country.Code")
head(stats_1960)


head(Fertility_Rate_2013)
head(Life_Expectancy_2013)
stats_2013 <- merge(Fertility_Rate_2013, Life_Expectancy_2013,
                    by.x="Country.Code", by.y="Country.Code")
head(stats_2013)

rm(wtrend,Fertility_Rate_1960,Fertility_Rate_2013,
   Life_Expectancy_1960,Life_Expectancy_2013,
   Country_Code,Life_Expectancy_At_Birth_1960,
   Life_Expectancy_At_Birth_2013)

library(ggplot2)

head(stats_1960)
qplot(data=stats_1960, x=Fertility.Rate, y=Life.Expectancy,
      colour=Region, size=I(5), shape=I(19), alpha=I(0.2),
      main="Life Expectancy vs Fertility Rate in 1960")

head(stats_2013)
qplot(data=stats_2013, x=Fertility.Rate, y=Life.Expectancy,
      colour=Region, size=I(5), shape=I(19), alpha=I(0.2),
      main="Life Expectancy vs Fertility Rate in 2013")
