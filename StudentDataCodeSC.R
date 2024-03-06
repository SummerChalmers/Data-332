library(dplyr)
library(readxl)
library(tidyverse)
library(tidyr)
library(ggplot2)
library(stringr)
setwd('H:/Data332/StudentData')
df_courses <- readxl::read_excel('Course.xlsx', sheet = 1, skip = 3, .name_repair = 'universal')
df_registration <- readxl::read_excel('Registration.xlsx', sheet = 1, skip = 3, .name_repair = 'universal')
df_student <- readxl::read_excel('Student.xlsx', sheet = 1, skip = 3, .name_repair = 'universal')
df <- left_join(df_student, df_regirstration, by = c('Student.ID'))
df <- left_join(df, df_courses, by = c('Instance.ID'))
df_majors_chart <- df %>%
  group_by(Title)
  summarize(count = n())
ggplot(df_majors_chart, aes(x = Title, y= count))+
  geom_col()+
  theme(axis.text = element_text(angle = 45, vjust = .5, hjust = 1))
df$Birth.Date <- as.Date(df$Birth.Date)
df$Birth.Year <- year(df$Birth.Date)
df_birth_year_chart <- df %>%
  group_by(Birth.Year) %>%
  summarize(count = n())
ggplot(df_birth_year_chart, aes(x =  Birth.Year, y = count))+
  geom_col()+
  theme(axis.text =  element_text(angle = 45, vjust = .5, hjust = 1))
df_total_cost_per_major <_ df%>%
  group_by(Cost, Payment.Plan) %>%
  summarize(Total.Cost =  sum(Totoal.cost))
print(df_total_cost_per_major)
df_total_balance_due_per_major <_ %>%
  group_by(Title, Payment.Plan)%>%
  summarize(Total_Balance_Due =  sum(Balance.Due))
print(df_total_balance_due_per_major)
