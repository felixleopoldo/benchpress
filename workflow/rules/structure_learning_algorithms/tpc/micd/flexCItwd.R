#' Wrapper for gaussCItwd, disCItwd and mixCItwd
#' 
#' A plug-in conditional independence test for \code{pcalg::\link[pcalg]{skeleton}}, \code{pcalg::\link[pcalg]{pc}} or
#' \code{pcalg::\link[pcalg]{fci}} when the data contain missing values. Observations 
#' where at least one of the variables involved in the test is missing are 
#' deleted prior to performing the test (test-wise deletion). The function \code{flexCItwd} detects whether
#' variables are continuous, discrete or mixed, and automatically switches between \code{\link[micd]{gaussCItwd}} (continuous only),
#' \code{link{disCItwd}} (discrete only) and \code{\link[micd]{mixCItwd}} (mixed).
#'
#' @param x,y,S (Integer) position of variable X, Y and set of variables S, 
#' respectively, in each correlation matrix in \code{suffStat}. It is tested 
#' whether X and Y are conditionally independent given the subset S of the 
#' remaining variables.
#' @param data A data frame
#'
#' @return A p-value
#' @export
#'
#' @examples
#' ## load data (numeric and factor variables)
#' dat <- toenail2[1:400, ]
#'
#' ## delete some observations
#' set.seed(123)
#' dat[sample(400, 20), 2] <- NA
#' dat[sample(400, 30), 4] <- NA
#'
#' ## obtain correct input 'suffStat' for 'flexMItest'
#' suff <- getSuff(imp, test="flexCItwd")
#'
#' ## analyse data
#' # continuous variables only
#' flexCItwd(4, 5, NULL, dat)
#' 
#' # discrete variables only
#' flexCItwd(2, 3, NULL, dat)
#'
#' # mixed variables
#' flexCItwd(2, 3, 4, dat)
#'
flexCItwd <- function(x, y, S = NULL, data) {

  conpos <- Rfast::which.is(data, "numeric")
  dispos <- Rfast::which.is(data, "factor")


  if ( all(c(x,y,S) %in% conpos) ) {
    x2 <- as.numeric(which(conpos %in% x))
    y2 <- as.numeric(which(conpos %in% y))
  
    if(!is.null(S)){  
      S2 <- which(conpos %in% S)
    } else {
      S2 <- S
    }

    pval <- gaussCItwd(x = x2, y = y2, S = S2, suffStat = data[, conpos])
    
    print("GaussCItwd pval:")
    print(pval)
  } else if ( all(c(x,y,S) %in% dispos) ) {
    

    message(paste0("DisCItwd: ", x, " ", y, " ", paste(S, collapse = " ")))

    data <- lapply(data[,dispos], function(x){
               x <- as.integer(x)
               if(min(x, na.rm = TRUE) != 0) x - min(x, na.rm = TRUE)
            })
    data <- do.call(cbind, data)

    x2 <- as.numeric(which(dispos %in% x))
    y2 <- as.numeric(which(dispos %in% y))
    
    if(!is.null(S)){  
      S2 <- which(dispos %in% S)
    } else {
      S2 <- S
    }

    suffStat <- list(dm = data, adaptDF = TRUE)

    pval <- disCItwd(x = x2, y = y2, S = S2, suffStat = suffStat)
    message(paste0("DisCItwd pval: ", pval))
    
  } else {

    pval <- mixCItwd(x = x, y = y, S = S, suffStat = data)
  }

  return(pval)
}
