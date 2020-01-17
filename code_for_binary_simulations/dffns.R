# data frame function for binary simulations

scoredf.init <- function() {
  scoredf <- data.frame(
    time = double(),
    logscore = double(),
    algorithm = character(),
    replicate = integer(),
    ss = integer()
  )
  return(scoredf)
}
ROCdf.init <- function() {
  ROCdf <- data.frame(
    TPR = double(),
    FPRn = double(),
    threshold = double(),
    algorithm = character(),
    replicate = integer(),
    ss = integer()
  )
  return(ROCdf)
}
SHDdf.init <- function() {
  SHDdf <- data.frame(
    time = double(),
    SHD = double(),
    algorithm = character(),
    replicate = integer(),
    ss = integer()
  )
  return(SHDdf)
}
scoredf.add <- function(newrep, scoredf, algo, repl) {
  if (algo == "blip") {
    scoredf <- rbind(scoredf, data.frame(
      logscore = newrep$blip$res[3, 6],
      algo = "blip",
      ss = newrep$sampsize / newrep$n,
      replicate = repl,
      time = newrep$blip$res[3, 8]
    ))
  } else {
    scoredf <- rbind(scoredf, data.frame(
      logscore = newrep$truescore,
      algo = "true",
      ss = newrep$sampsize / newrep$n,
      replicate = newrep$replicate,
      time = 0
    ))
    scoredf <- rbind(scoredf, data.frame(
      logscore = newrep$MAPscore,
      algo = "MAP PC",
      ss = newrep$sampsize / newrep$n,
      replicate = newrep$replicate,
      time = newrep$totaltime
    ))
    scoredf <- rbind(scoredf, data.frame(
      logscore = newrep$TABUMAPscore,
      algo = "MAP TABU",
      ss = newrep$sampsize / newrep$n,
      replicate = newrep$replicate,
      time = newrep$TABUtotaltime
    ))
    scoredf <- rbind(scoredf, data.frame(
      logscore = newrep$medianscore,
      algo = "final MCMC",
      ss = newrep$sampsize / newrep$n,
      replicate = newrep$replicate,
      time = newrep$TABUtotaltime
    ))
    scoredf <- rbind(scoredf, data.frame(
      logscore = newrep$TABUmedianscore,
      algo = "final MCMC TABU",
      ss = newrep$sampsize / newrep$n,
      replicate = newrep$replicate,
      time = newrep$TABUtotaltime
    ))
  }
  return(scoredf)
}
ROCdf.add <- function(newrep, ROCdf, algo, repl) {
  if (algo == "blip") {
    ROCdf <- rbind(ROCdf, data.frame(
      TPR = newrep$blip$res[, 4],
      FPRn = newrep$blip$res[, 5],
      threshold = newrep$blip$res[, 8],
      algorithm = "blip",
      ss = newrep$sampsize / newrep$n,
      replicate = repl
    ))
  } else {
    nit <- nrow(newrep$iterativeMCMC)
    ROCdf <- rbind(ROCdf, data.frame(
      TPR = newrep$iterativeMCMC[nit, 3],
      FPRn = newrep$iterativeMCMC[nit, 6],
      threshold = 10,
      algorithm = "iterativeMCMC",
      ss = newrep$sampsize / newrep$n,
      replicate = newrep$replicate
    ))
    ROCdf <- rbind(ROCdf, data.frame(
      TPR = newrep$finalMCMC[, 5],
      FPRn = newrep$finalMCMC[, 6],
      threshold = newrep$finalMCMC[, 4],
      algorithm = "finalMCMC",
      ss = newrep$sampsize / newrep$n,
      replicate = newrep$replicate
    ))
  }
  return(ROCdf)
}
SHDdf.add <- function(newrep, SHDdf, algo, repl) {
  if (algo == "blip") {
    SHDdf <- rbind(SHDdf, data.frame(
      SHD = newrep$blip$res[3, 3],
      algorithm = "blip",
      ss = newrep$sampsize / newrep$n,
      replicate = repl,
      time = newrep$blip$res[3, 8]
    ))
  } else {
    SHDdf <- rbind(SHDdf, data.frame(
      SHD = newrep$SHDmedian,
      algorithm = "finalMCMC",
      ss = newrep$sampsize / newrep$n,
      replicate = newrep$replicate,
      time = newrep$totaltime
    ))
    # SHDdf<-rbind(SHDdf, data.frame(logscore=newrep$SHDmedianTABU,
    #                                    algo="finalMCMC TABU",
    #                                    ss=newrep$sampsize/newrep$n,
    #                                    replicate=newrep$replicate,
    #                                    time=newrep$TABUtotaltime))
    SHDdf <- rbind(SHDdf, data.frame(
      SHD = newrep$iterativeMCMC[nrow(newrep$iterativeMCMC), 4],
      algorithm = "MAP PC",
      ss = newrep$sampsize / newrep$n,
      replicate = newrep$replicate,
      time = newrep$totaltime
    ))
    # SHDdf<-rbind(SHDdf, data.frame(logscore=newrep$iterativeMCMC[nrow(newrep$iterativeMCMC),],
    #                                    algo="MAP TABU",
    #                                    ss=newrep$sampsize/newrep$n,
    #                                    replicate=newrep$replicate,
    #                                    time=newrep$TABUtotaltime))
  }
  return(SHDdf)
}
