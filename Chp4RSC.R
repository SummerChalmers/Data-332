suit<- c("spades", "hearts", "diamonds", "clubs")
hand <- c("ace", "king", "queen", "jack", "ten", "nine", "eight", "seven", "six", "five", "four", "three", "two")
hand1 <- c("ace", "king", "queen", "jack", "ten","spades", "spades", "spades", "spades")
matrix(hand1, nrow=5)
matrix(hand1, ncol= 2)
dim(hand1) <- c(5,2)
card <- c("ace", "heart", 1)
card
card <- list("ace", "hearts", 1)
card
df <- data.frame(face = c("ace", "two", "six"),
                 suit <- c("clubs", "clubs", "clubs"), value = c(1,2,3))
df

#deck [,]
df [1,1]
df[1, c(1,2,3)]
#R's indexing starts at 1 not 0
df[1:2,1]
df[1:2,1, drop = FALSE]
df[1,]
df[1, c("hand", "suit")]
deal <- funciton(df){df[1,]}
deck2 <- df[1:52,]
head(deck2)
random <- sample(1:52, size = 52)
random
deck4 <- df[random, ]
head(deck4)
shuffle <- function(df) {
  random <- sample(1:52, size = 52)
  df[random, ]
}
lst <- list(numbers = c(1,2), logical=TRUE, strings = c("a", "b", "c"))
lst
lst[1]
