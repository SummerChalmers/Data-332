install.packages("ggplot2")
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:
  
  https://cran.rstudio.com/bin/windows/Rtools/
  Installing package into ‘C:/Users/smc91/AppData/Local/R/win-library/4.3’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/4.3/ggplot2_3.4.4.zip'
Content type 'application/zip' length 4299935 bytes (4.1 MB)
downloaded 4.1 MB

package ‘ggplot2’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\smc91\AppData\Local\Temp\RtmpErnWh6\downloaded_packages
> qplot
Error: object 'qplot' not found
> library("ggplot2")
> qplot
function (x, y, ..., data, facets = NULL, margins = FALSE, geom = "auto", 
          xlim = c(NA, NA), ylim = c(NA, NA), log = "", main = NULL, 
          xlab = NULL, ylab = NULL, asp = NA, stat = deprecated(), 
          position = deprecated()) 
{
  deprecate_soft0("3.4.0", "qplot()")
  caller_env <- parent.frame()
  if (lifecycle::is_present(stat)) 
    lifecycle::deprecate_stop("2.0.0", "qplot(stat)")
  if (lifecycle::is_present(position)) 
    lifecycle::deprecate_stop("2.0.0", "qplot(position)")
  check_character(geom)
  exprs <- enquos(x = x, y = y, ...)
  is_missing <- vapply(exprs, quo_is_missing, logical(1))
  is_constant <- (!names(exprs) %in% ggplot_global$all_aesthetics) | 
    vapply(exprs, quo_is_call, logical(1), name = "I")
  mapping <- new_aes(exprs[!is_missing & !is_constant], env = parent.frame())
  consts <- exprs[is_constant]
  aes_names <- names(mapping)
  mapping <- rename_aes(mapping)
  if (is.null(xlab)) {
    if (quo_is_missing(exprs$x)) {
      xlab <- ""
    }
    else {
      xlab <- as_label(exprs$x)
    }
  }
  if (is.null(ylab)) {
    if (quo_is_missing(exprs$y)) {
      ylab <- ""
    }
    else {
      ylab <- as_label(exprs$y)
    }
  }
  if (missing(data)) {
    data <- data_frame0()
    facetvars <- all.vars(facets)
    facetvars <- facetvars[facetvars != "."]
    names(facetvars) <- facetvars
    facetsdf <- as.data.frame(mget(facetvars, envir = caller_env))
    if (nrow(facetsdf)) 
      data <- facetsdf
  }
  if ("auto" %in% geom) {
    if ("sample" %in% aes_names) {
      geom[geom == "auto"] <- "qq"
    }
    else if (missing(y)) {
      x <- eval_tidy(mapping$x, data, caller_env)
      if (is.discrete(x)) {
        geom[geom == "auto"] <- "bar"
      }
      else {
        geom[geom == "auto"] <- "histogram"
      }
      if (is.null(ylab)) 
        ylab <- "count"
    }
    else {
      if (missing(x)) {
        mapping$x <- quo(seq_along(!!mapping$y))
      }
      geom[geom == "auto"] <- "point"
    }
  }
  p <- ggplot(data, mapping, environment = caller_env)
  if (is.null(facets)) {
    p <- p + facet_null()
  }
  else if (is.formula(facets) && length(facets) == 2) {
    p <- p + facet_wrap(facets)
  }
  else {
    p <- p + facet_grid(rows = deparse(facets), margins = margins)
  }
  if (!is.null(main)) 
    p <- p + ggtitle(main)
  for (g in geom) {
    params <- lapply(consts, eval_tidy)
    p <- p + do.call(paste0("geom_", g), params)
  }
  logv <- function(var) var %in% strsplit(log, "")[[1]]
  if (logv("x")) 
    p <- p + scale_x_log10()
  if (logv("y")) 
    p <- p + scale_y_log10()
  if (!is.na(asp)) 
    p <- p + theme(aspect.ratio = asp)
  if (!missing(xlab)) 
    p <- p + xlab(xlab)
  if (!missing(ylab)) 
    p <- p + ylab(ylab)
  if (!missing(xlim) && !all(is.na(xlim))) 
    p <- p + xlim(xlim)
  if (!missing(ylim) && !all(is.na(ylim))) 
    p <- p + ylim(ylim)
  p
}
<bytecode: 0x0000012e2664a940>
  <environment: namespace:ggplot2>
  > y
Error: object 'y' not found
> x<-c(-1,-0.8,-0.4,-0.2,0,0.2,0.4,0.6,0.8)
> 
  > qplot(x,y)
Error in `geom_point()`:
  ! Problem while computing aesthetics.
ℹ Error occurred in the 1st layer.
Caused by error:
  ! object 'y' not found
Run `rlang::last_trace()` to see where the error occurred.
Warning message:
  `qplot()` was deprecated in ggplot2 3.4.0.
This warning is displayed once every 8 hours.
Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
generated. 
> x<-c(-1,-0.8,-0.4,-0.2,0,0.2,0.4,0.6,0.8)
> qplot(x,y)
Error in `geom_point()`:
  ! Problem while computing aesthetics.
ℹ Error occurred in the 1st layer.
Caused by error:
  ! object 'y' not found
Run `rlang::last_trace()` to see where the error occurred.
> x <- c(-1,-0.8,-0.4,-0.2,0,0.2,0.4,0.6,0.8,1)
> 
  > qplot(x, y)
Error in `geom_point()`:
  ! Problem while computing aesthetics.
ℹ Error occurred in the 1st layer.
Caused by error:
  ! object 'y' not found
Run `rlang::last_trace()` to see where the error occurred.
> x <- c(-1,-0.8,-0.4,-0.2,0,0.2,0.4,0.6,0.8,1)
> qplot(x, y)
Error in `geom_point()`:
  ! Problem while computing aesthetics.
ℹ Error occurred in the 1st layer.
Caused by error:
  ! object 'y' not found
Run `rlang::last_trace()` to see where the error occurred.
> qplot(x, y)
Error in `geom_point()`:
  ! Problem while computing aesthetics.
ℹ Error occurred in the 1st layer.
Caused by error:
  ! object 'y' not found
Run `rlang::last_trace()` to see where the error occurred.
> x <- c(-1,-0.8,-0.4,-0.2,0,0.2,0.4,0.6,0.8,1)
> x
[1] -1.0 -0.8 -0.4 -0.2  0.0  0.2  0.4  0.6  0.8  1.0
> y <- x^3
> y
[1] -1.000 -0.512 -0.064 -0.008  0.000  0.008  0.064  0.216  0.512  1.000
> qplot(x, y)
> qplot(x, binwidth = 1)
> qplot(x2, binwidth = 1)
Error: object 'x2' not found
> qplot(x2, binwidth = 1)
Error: object 'x2' not found
> x2 <- c(1,2,2,2,3,3)
> qplot(x2, binwidth = 1)
> qplot(x3, binwidth = 1)
Error: object 'x3' not found
> qplot(x3, binwidth = 1)
Error: object 'x3' not found
> x3<- c(0,1,1,2,2,2,3,3,4)
> qplot(x3, binwidth = 1)
> replicate(3, 3+1+1)
[1] 5 5 5
> replicate(10, roll())
[,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
[1,]    1    1    1    1    1    1    1    1    1     1
[2,]    2    2    2    2    2    2    2    2    2     2
[3,]    3    3    3    3    3    3    3    3    3     3
[4,]    4    4    4    4    4    4    4    4    4     4
[5,]    5    5    5    5    5    5    5    5    5     5
[6,]    6    6    6    6    6    6    6    6    6     6
> qplot(rolls, binwidth=1)
Error: object 'rolls' not found
> rolls <- replicate(1000, roll())
> qplot(rolls, binwidth=1)
> qplot(rolls, binwidth=1)
> roll <- function() {
  +   die <- 1:6
  +   dice <- sample(die, size = 2, replace =TRUE)
  +   sum (dice)
  + }
> qplot(rolls, binwidth = 1)