library(tidyverse)
library(readxl)
library(here)
library(kableExtra)

setwd('H:/Data332')
kelp_abur <- readxl::read_excel('kelp_fronds.xlsx', sheet = "abur")
fish <- read.csv('fish.csv')

fish_garibaldi <- fish%>%
  filter(commone_name = 'garibali')

fish_monk <- fish %>%
  filter(site == "monk")

fish_over50 <- fish %>%
  filter(total_count >= 50)

fish_3ep <- fish %>%
  filter(common_name = 'garibaldi') +
  filter(common_name = 'blacksmith') +
  filter(common_name = 'black surfperch')

fish_3ep <- fish %>%
  filter(common_name %in% c('garibaldi', 'blacksmith', 'black surfperch'))

fish_gar_2016 <- fish %>% 
  filter(year == 2016 | common_name == "garibaldi")

aque_2018 <- fish %>% 
  filter(year == 2018, site == "aque")

low_gb_wr <- fish %>% 
  filter(common_name %in% c("garibaldi", "rock wrasse"), 
         total_count <= 10)
fish_bl <- fish %>% 
  filter(str_detect(common_name, pattern = "black"))

abur_kelp_fish <- kelp_abur %>% 
  full_join(fish, by = c("year", "site"))

kelp_fish_injoin <- kelp_abur %>% 
  inner_join(fish, by = c("year", "site"))

my_fish_join <- fish %>% 
  filter(year == 2017, site == "abur") %>% 
  left_join(kelp_abur, by = c("year", "site")) %>% 
  mutate(fish_per_frond = total_count / total_fronds)
kable(my_fish_join)
my_fish_join %>% 
  kable() %>% 
  kable_styling(bootstrap_options = "striped", 
                full_width = FALSE)
