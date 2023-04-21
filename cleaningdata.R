setwd('D:/school/STAT 461/Final Project')
library(dplyr)
library(tidyr)

#CLEANING FOREIGN ASSISTANCE DATA ----
data<-read.csv("D:/school/STAT 461/Final Project/ForeignAssistanceComplete.csv")
cleandata<-data %>% 
  select(Country.Code, Country.Name, Fiscal.Year,Foreign.Assistance.Objective.Name, #filter to relevant columns
         Transaction.Type.Name, Transaction.Type.ID, Current.Dollar.Amount) %>%
  mutate(Fiscal.Year=as.numeric(Fiscal.Year)) %>%
  filter(between(Fiscal.Year, 2002, 2015),Foreign.Assistance.Objective.Name == "Military", #filter to only military disbursements between 2002-2015
         Transaction.Type.ID == 3)

summary(cleandata)

n_distinct(cleandata$Country.Name)

write.csv(cleandata,"D:/school/STAT 461/Final Project/foreignassistance.csv")

#CLEANING WORLD BANK DATA ----

worldbankraw<-read.csv("https://raw.githubusercontent.com/Chromaticluv/Stat461project/main/WorldBankData.csv")
worldbankclean<-worldbankraw %>%
  filter(Series.Code =="NY.GDP.PCAP.CD")

worldbankfinal<-gather(worldbankclean, Year, GDP_per_cap, X2000..YR2000.:X2015..YR2015.) #Convert wide data to long

#Recoding all the wierd year formats to something normal. (and numeric)
worldbankfinal$Year[worldbankfinal$Year =="X2000..YR2000."] <- 2000
worldbankfinal$Year[worldbankfinal$Year =="X2001..YR2001."] <- 2001
worldbankfinal$Year[worldbankfinal$Year =="X2002..YR2002."] <- 2002
worldbankfinal$Year[worldbankfinal$Year =="X2003..YR2003."] <- 2003
worldbankfinal$Year[worldbankfinal$Year =="X2004..YR2004."] <- 2004
worldbankfinal$Year[worldbankfinal$Year =="X2005..YR2005."] <- 2005
worldbankfinal$Year[worldbankfinal$Year =="X2006..YR2006."] <- 2006
worldbankfinal$Year[worldbankfinal$Year =="X2007..YR2007."] <- 2007
worldbankfinal$Year[worldbankfinal$Year =="X2008..YR2008."] <- 2008
worldbankfinal$Year[worldbankfinal$Year =="X2009..YR2009."] <- 2009
worldbankfinal$Year[worldbankfinal$Year =="X2010..YR2010."] <- 2010
worldbankfinal$Year[worldbankfinal$Year =="X2011..YR2011."] <- 2011
worldbankfinal$Year[worldbankfinal$Year =="X2012..YR2012."] <- 2012
worldbankfinal$Year[worldbankfinal$Year =="X2013..YR2013."] <- 2013
worldbankfinal$Year[worldbankfinal$Year =="X2014..YR2014."] <- 2014
worldbankfinal$Year[worldbankfinal$Year =="X2015..YR2015."] <- 2015


write.csv(worldbankfinal, "D:/School/STAT 461/Final Project/worldbankfinal.csv")


#CLEANING POLITY ----

#CLEANING ALLIANCE ----