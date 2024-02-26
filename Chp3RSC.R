die<- c(1,2,3,4,5,6)
die
typeof(die)
int<- c(-1L, 2L, 4L)
int
sqrt(2)^2-2
text <- c("hello", "world")
text
typeof(text)
typeof("hello")
logic<- c(TRUE, FALSE, TRUE)
logic
typeof(F)
comp<- c(1+1i, 1+2i, 1+3i)
comp
typeof(comp)
raw(3)
typeof(raw(3))
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