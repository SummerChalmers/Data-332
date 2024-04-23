#Chapter 8
play <- function () {
  symbols <- get_symbols()
  prize <- score(symbols)
  prize
}

print.slots <- function(x,...){
  slot_displays(x)
}

play <- function(){
  symbols <- get_symbols()
  structure(score(symbols), symbols = symbols, class = 'slots')
}

#Chapter 9
combo <- expand.grid(wheel, wheel, wheel, stringsAsFactors = FALSE)

get_symbols <- function(){
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE,
         prob = c(0.03,0.03,0.06,0.1,0.25,0.52)
}
prob <- c("DD"=0.03, "7"=0.03, "BBB"=0.06, "BB"=0.1, "B"= 0.25, "C"= 0.01, "0"=0.52)
combo$prob1 <- prob[combos$Var1]
combo$prob2 <- prob[combos$Var2]
combo$prob3 <- prob[combos$Var3]
head(combos, 1)

combo$prob <- combo$prob1*combo$prob2*combo$prob3
head(combo, 3)

for(i in 1:nrow(combo)){
  symbols <- c(combo[i,1],combo[i,2],combo[i,3])
  combo$prize[i] <- score(symbols)
}

#Chapter 10
abs_loop <- function(vec){
  for(i in 1:lenth(vec)){
    if (vec[i] <0){
      vec[i] <- vec[i]
    }
  }
  vec
}
abs_sets <- function(vec){
  negs <- vec < 0
  vec[negs] <- vec[negs]*1
  vec
}
system.timer(abs(long))
change_vec <- function(vec) {
  vec[vec == "DD"] <- "joker"
  vec[vec == "C"] <- "ace"
  vec[vec == "7"] <- "king"
  vec[vec == "8"] <- "queen"
  vec[vec == "BB"] <- "jack"
  vec[vec == "BBB"] <- "ten"
  vec[vec == "0"] <- "nine"
}
system.time(change_vec(many))
