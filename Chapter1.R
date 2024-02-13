1 + 1
[1] 2
> 100:130
[1] 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116
[18] 117 118 119 120 121 122 123 124 125 126 127 128 129 130
> 5-
  + 
  + 1
[1] 4
> 3 % 5
Error: unexpected input in "3 % 5"
> 2 *3
[1] 6
> 4 - 1
[1] 3
> 6/(4-1)
[1] 2
> (((7+2)*3)-6)
[1] 21
> 7+2
[1] 9
> 9*3
[1] 27
> 27-6
[1] 21
> 1+2
[1] 3
> 3*3
[1] 9
> 9-6
[1] 3
> 3/3
[1] 1
> 1-+2
[1] -1
> 10+2
[1] 12
> 12*3
[1] 36
> 36-6
[1] 30
> 30/3
[1] 10
> 1:6
[1] 1 2 3 4 5 6
> die <- 1:6
> die
[1] 1 2 3 4 5 6
> die -1
[1] 0 1 2 3 4 5
> die*die
[1]  1  4  9 16 25 36
> die%*%die
[,1]
[1,]   91
> die%o%
  + die%o%die
, , 1

[,1] [,2] [,3] [,4] [,5] [,6]
[1,]    1    2    3    4    5    6
[2,]    2    4    6    8   10   12
[3,]    3    6    9   12   15   18
[4,]    4    8   12   16   20   24
[5,]    5   10   15   20   25   30
[6,]    6   12   18   24   30   36

, , 2

[,1] [,2] [,3] [,4] [,5] [,6]
[1,]    2    4    6    8   10   12
[2,]    4    8   12   16   20   24
[3,]    6   12   18   24   30   36
[4,]    8   16   24   32   40   48
[5,]   10   20   30   40   50   60
[6,]   12   24   36   48   60   72

, , 3

[,1] [,2] [,3] [,4] [,5] [,6]
[1,]    3    6    9   12   15   18
[2,]    6   12   18   24   30   36
[3,]    9   18   27   36   45   54
[4,]   12   24   36   48   60   72
[5,]   15   30   45   60   75   90
[6,]   18   36   54   72   90  108

, , 4

[,1] [,2] [,3] [,4] [,5] [,6]
[1,]    4    8   12   16   20   24
[2,]    8   16   24   32   40   48
[3,]   12   24   36   48   60   72
[4,]   16   32   48   64   80   96
[5,]   20   40   60   80  100  120
[6,]   24   48   72   96  120  144

, , 5

[,1] [,2] [,3] [,4] [,5] [,6]
[1,]    5   10   15   20   25   30
[2,]   10   20   30   40   50   60
[3,]   15   30   45   60   75   90
[4,]   20   40   60   80  100  120
[5,]   25   50   75  100  125  150
[6,]   30   60   90  120  150  180

, , 6

[,1] [,2] [,3] [,4] [,5] [,6]
[1,]    6   12   18   24   30   36
[2,]   12   24   36   48   60   72
[3,]   18   36   54   72   90  108
[4,]   24   48   72   96  120  144
[5,]   30   60   90  120  150  180
[6,]   36   72  108  144  180  216

> round(3.1415)
[1] 3
> factorial(3)
[1] 6
> round(mean(die))
[1] 4
> sample(x=1:4, size=2)
[1] 3 2
> sample(x=die, size=1)
[1] 5
> args(round)
function (x, digits = 0) 
  NULL
> round(3.1415, digits = 2)
[1] 3.14
> sample(die, size=2, replace=TRUE)
[1] 3 2
> dice <- sample(die, size=2, replace=TRUE)
> dice
[1] 2 1
> sum(dice)
[1] 3
> roll <- function(){}
> roll <- function() {}
> roll <- function() {die <- 1:6 dice<- sample(die, size=2, replace=TRUE) sum dice}
Error: unexpected symbol in "roll <- function() {die <- 1:6 dice"
> roll <- function() {die <- 1:6, dice<- sample(die, size=2, replace=TRUE), sum dice}
Error: unexpected ',' in "roll <- function() {die <- 1:6,"
> roll <- function() {die, dice, sum(dice)}
Error: unexpected ',' in "roll <- function() {die,"
> > roll <- function() {die dice sum(dice)}
Error: unexpected '>' in ">"
> my_function=function(){}
> roll <-function(){die <- 1:6}
> roll()
> roll2 <- function() { dice <- sample(bones, size=2, replace=TRUE) sum(dice)}
Error: unexpected symbol in "roll2 <- function() { dice <- sample(bones, size=2, replace=TRUE) sum"
> roll2 <- function(bones)
  + 
  + roll2 <- function(bones){}
> dice <- sample(bones, size=2, replace=TRUE)
Error: object 'bones' not found
> sum(dice)
[1] 3
> roll2 <- function(bones= 1:6) {
  + dice <- sample(bones, size=2, replace=TRUE)
  + sum dice}
Error: unexpected symbol in:
  "dice <- sample(bones, size=2, replace=TRUE)
sum dice"
> roll2 <- function(bones= 1:6) {
  +     + dice <- sample(bones, size=2, replace=TRUE)
  +     + sum(dice)}
> roll2()
Error in +dice <- sample(bones, size = 2, replace = TRUE) : 
  could not find function "+<-"
> roll2 <- function(bones= 1:6) {
  + dice <- sample(bones, size=2, replace=TRUE)
  + sum(dice)}
> roll2()
[1] 5
