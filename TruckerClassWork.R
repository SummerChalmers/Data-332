library(readxl)
library(dplyr)
library(tidyverse)
library(tidyr)
library(ggplot2)
library(stringr)
#install packages before class

rm(list = ls())
#set up
setwd('H:/Data332')

df_truck <- readxl::read_excel('NP_EX_1-2.xlsx', sheet = 2, skip = 3, .name_repair = 'universal')
#selecting columns
df <- df_truck [, c(4:15)]
#deselecting columns
df<- subset(df, select = -c(...10))
#getting difference in days within a column
date_min <- min(df$Date)
date_max<- max(df$Date)
number_of_days_on_the_road <- date_max - date_min
print(number_of_days_on_the_road)

days <- difftime(max(df$Date), min(df$Date))
print(days)
number_of_days_recorded <- nrow(df)

total_hours <- sum(df$Hours)
average_per_day_rec <-round(total_hours/ number_of_days_recorded, digits = 3)
print(average_per_day_rec)

df$fuel_cost <- df$Gallons * df$Price.per.Gallon
total_fuel_cost <- round(sum(df$Gallons * df$Price.per.Gallon) , 2)

df[c('warehouse' ,'city_state')] <- str_split_fixed(df$Starting.Location, ',',2) 

total_cost <- round(total_fuel_cost + sum(df$Misc) +sum(df$Tolls), 2)

total_gallons_consumed <- sum(df$Gallons)
total_miles_driven <- sum(df$Odometer.Ending- df$Odometer.Beginning)
miles_per_gallon <- round(total_miles_driven / total_gallons_consumed ,2)
total_cost_per_mile <- total_cost_per_mile * 