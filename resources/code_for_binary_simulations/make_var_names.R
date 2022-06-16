varnames.make <- function(n) {
  return(paste("V", c(1:n), sep = ""))
}

matrixToDataframe <- function(data, varnames) {
  datadf <- data
  n <- dim(data)[2]
  colnames(datadf) <- varnames
  datadf <- as.data.frame(datadf)
  for (j in 1:ncol(datadf)) {
    datadf[, varnames[j]] <- as.factor(datadf[, varnames[j]])
  }
  return(datadf)
}
