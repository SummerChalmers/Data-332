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

df[c('warehouse' ,'starting_city_state')] <- str_split_fixed(df$Starting.Location, ',',2) 

total_cost <- round(total_fuel_cost + sum(df$Misc) +sum(df$Tolls), 2)

total_gallons_consumed <- sum(df$Gallons)
total_miles_driven <- sum(df$Odometer.Ending- df$Odometer.Beginning)
miles_per_gallon <- round(total_miles_driven / total_gallons_consumed ,2)
#total_cost_per_mile <- total_cost_per_mile * 

df$city_state <- gsub(',', "", df$starting_city_state)
#df[c('col1' ,'col2')] <- str_split_fixed(df$city_state, ' ',2)

df_starting_pivot <- df %>%
  group_by(starting_city_state) %>%
  summarize(count = n(),
            mean_size_hours = mean(Hours, na.rm = TRUE),
            sd_hours = sd(Hours, na.rm = TRUE),
            total_hours = sum(Hours, na.rm =TRUE),
            total_gallons = sum(Gallons, na.rm = TRUE)
            )

ggplot(df_starting_pivot, aes(x = starting_city_state, y =count)) +
  geom_col() +
  theme(axis.text = element_text(angle = 45, vjust = .5, hjust = 1))

df$delivery_location <- gsub(',', "", df$delivery_location)
df_delivery_location_pivot <- df %>%
  group_by(Delivery.Location) %>%
  summarize(count = n())
ggplot(df_delivery_location_pivot, aes(x = Delivery.Location, y =count)) +
  geom_col() +
  theme(axis.text = element_text(angle = 45, vjust = .5, hjust = 1))

