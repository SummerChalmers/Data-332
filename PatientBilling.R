library(readxl)
library(tidyr)
library(tidyr)
library(ggplot2)
library(dplyr)

setwd('H:/Data332/PatientBilling')
df_billing <- readxl::read_excel('Billing.xlsx', .name_repair = 'universal')
df_patient <- readxl::read_excel('Patient.xlsx', .name_repair = 'universal')
df_visit <- readxl::read_excel('Visit.xlsx', .name_repair = 'universal')

df <- left_join(df_visit, df_patient, by = c('PatientID'))
df <- left_join(df, df_billing, by = c('VisitID'))

df_reason <- df%>%
  group_by(Reason, WalkIn) %>%
  summarize(count = n())
ggplot(df_reason, aes(x = Reason, y= count))+
  geom_col()+
  theme(axis.text = element_text(angle = 45, vjust = .5, hjust = 1))

df_reason_by_city <- df%>%
  group_by(Reason, City) %>%
  summarize(count = n())
ggplot(df_reason_by_city, aes(x = City, y= count))+
  geom_col()+
  theme(axis.text = element_text(angle = 45, vjust = .5, hjust = 1))

df_reason_by_state <- df%>%
  group_by(Reason, State) %>%
  summarize(count = n())
ggplot(df_reason_by_state, aes(x = State, y= count))+
  geom_col()+
  theme(axis.text = element_text(angle = 45, vjust = .5, hjust = 1))

df_reason_by_zip <- df%>%
  group_by(Reason, Zip) %>%
  summarize(count = n())
ggplot(df_reason_by_zip, aes(x = Zip, y= count))+
  geom_col()+
  theme(axis.text = element_text(angle = 45, vjust = .5, hjust = 1))

df_invoice_by_reason <- df %>%
  group_by(Reason) %>%
  summarize(count = sum(InvoiceAmt))
ggplot(df_invoice_by_reaon, aes(x = reason, y = count))+
geom_col()+
theme(axis.text = element_text(angle = 45, vjust = .5, hjust = 1))

df$VisitDate <- as.Date(df$VisitDate)
df$VisitYear <- year(df$VisitDate)
df$VisitMonth <- month(df$VisitDate)

df_reason_by_month <- df %>%
  group_by(df$VisitMonth) %>%
  summarize(count = sum(Reason))
ggplot(df_reason_by_month, aes(x = reason, y = count),col =c("red", "blue"))+
geom_col()+
theme(axis.text = element_text(angle = 45, vjust = .5, hjust = 1)

