summarySE <- function(data = NULL, measurevar, othervars = NULL, groupvars = NULL, na.rm = FALSE, .drop = TRUE) {
  #library(plyr) # for the rename function
  #library(dplyr)

  library(reshape)

  # New version of length which can handle NA's: if na.rm==T, don't count them
  length2 <- function(x, na.rm = FALSE) {
    if (na.rm) {
      sum(!is.na(x))
    } else {
      length(x)
    }
  }
  # This does the summary. For each group's data frame, return a vector with
  # N, mean, and sd
  datac <- ddply(data, groupvars,
    .drop = .drop,
    .fun = function(xx, col) {
      c(
        N = length2(xx[[col]], na.rm = na.rm),
        mean = median(xx[[col]], na.rm = na.rm),
        q1 = quantile(xx[[col]], na.rm = na.rm)[2],
        q3 = quantile(xx[[col]], na.rm = na.rm)[4]
      )
    },
    measurevar
  )

  # Rename the "mean" column
  datac <- rename(datac, c("mean" = measurevar))
  datac <- rename(datac, c("q1.25%" = "q1"))
  datac <- rename(datac, c("q3.75%" = "q3"))
  ncols <- ncol(datac)
  if (!is.null(othervars)) {
    k <- 1
    for (i in othervars) {
      datao <- ddply(data, groupvars,
        .drop = .drop,
        .fun = function(xx, col) {
          c(
            N = length2(xx[[col]], na.rm = na.rm),
            mean = median(xx[[col]], na.rm = na.rm)
          )
        },
        i
      )
      datac <- cbind(datac, datao$mean)
      colnames(datac)[ncols + k] <- i
      k <- k + 1
    }
  }

  return(datac)
}
