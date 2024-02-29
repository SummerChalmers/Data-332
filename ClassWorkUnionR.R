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
df_truck_0001 <- readxl::read_excel('truck data 0001.xlsx', sheet = 2, skip = 3, .name_repair = 'universal')
df_truck_0369 <- readxl::read_excel('truck data 0369.xlsx', sheet = 2, skip = 3, .name_repair = 'universal')
df_truck_1226 <- readxl::read_excel('truck data 1226.xlsx', sheet = 2, skip = 3, .name_repair = 'universal')
df_truck_1442 <- readxl::read_excel('truck data 1442.xlsx', sheet = 2, skip = 3, .name_repair = 'universal')
df_truck_1478 <- readxl::read_excel('truck data 1478.xlsx', sheet = 2, skip = 3, .name_repair = 'universal')
df_truck_1539 <- readxl::read_excel('truck data 1539.xlsx', sheet = 2, skip = 3, .name_repair = 'universal')
df_truck_1769 <- readxl::read_excel('truck data 1769.xlsx', sheet = 2, skip = 3, .name_repair = 'universal')
df_pay <- read_excel('Driver Pay Sheet.xlsx', .name_repair = 'universal')

df <- rbind(df_truck_0001, df_truck_0369, df_truck_1226, df_truck_1442, df_truck_1478, df_truck_1539, df_truck_1769)

# df_starting_Pivot <- df %>%
#   group_by(Truck.ID) %>%
#   summarize(count = n())
df <- left_join(df, df_pay,  by = c('Truck.ID'))

df$miles_driven <- df$Odometer.Ending - df$Odometer.Beginning

df$total_pay_for_miles <- df$miles_driven * df$labor_per_mil

df_miles_for_labor_Pivot <- df %>%
  group_by(Truck.ID) %>%
  summarize(count = n(),
            total_pay_driver = sum(total_pay_for_miles))


ggplot(df_miles_for_labor_Pivot, aes(x = Truck.ID, y = total_pay_driver)) +
  geom_col() +
  theme(axis.text = element_text(angle = 45, vjust = .5, hjust = 1))

