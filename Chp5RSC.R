vec <- c(0,0,0,0,0,0)
vec
vec[1]
vec [1] <- 1000
vec
vec[c(1,3,5)] <- c(1,1,1)
vec
vec[7] <- 0
vec
deck2$new <- 1:52
head(deck2)
#remove columns by using null
deck2$new <- NULL
#logical test to create vector of true and false
1 > c(0,1,2)
#%in% test if vector on left is on right side
1 %in% c(3,4,5)
#test for equality use double equal sign ==
# the single equal sign is equlivent to <-
deck2$face == "ace"
deck4$suit == 'hearts'
deck4$value[deck4$suit == 'hearts']
deck4$value[deck4$suit == 'hearts'] <- 1
deck4$value[deck4$suit == 'hearts']
#booleans will result in single true or false
 w > 0
 10<x & x<20
 y == "feburary"
 all(z %in% c('Monday','Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'))
 #NA can be used as a place holder for missing information
 1+NA
#na.rm will ignore NA's in a dataset 
 mean(c(NA, 1:50), na.rm = TRUE)
#to find NA in a dataset use is.an
 is.na(NA)
vec <- c(1,2,3,NA) 
is.na(vec)
