# data frame function for binary simulations

# These seem to be almost ready for being "methods" in S3(?) objects.

# This adds some columns to the already exixting simulation dataframe
#
# TODO: Remove side effects, dont load as "sim" variable
# NOW ADD BIDAG PART


#' Extends the statitics summary of BiDAG algorithm.
#'
#'
#' @param sim_list Results from the BiDAG agorithm.
#'
#' @return
#' @export
#'
#' @examples
extendBidagSimResult <- function(sim_list) {
  print(sim_list)
  sim_list$replicate <- sim_list$i
  sim_list$ss <- sim_list$sampsize / sim_list$n

  sim_list$iterativeMCMC <- cbind(sim_list$iterativeMCMC, sim_list$iterativeMCMC[, 2] / sim_list$nedges)
  colnames(sim_list$iterativeMCMC)[6] <- "FPRn"
  sim_list$finalMCMC <- cbind(sim_list$finalMCMC, sim_list$finalMCMC[, 1] / sim_list$nedges, sim_list$finalMCMC[, 2] / sim_list$nedges)
  colnames(sim_list$finalMCMC)[c(5, 6)] <- c("TPR", "FPRn")

  nit <- nrow(sim_list$iterativeMCMC)
  sim_list$SHDMAP <- sim_list$terativeMCMC[nit, 4]
  sim_list$SHDmdeian <- sim_list$finalMCMC[7, 3]
  sim_list$totaltime <- as.numeric(sim_list$totaltime) * 60

  # # Tabu search start
  # sim_list$TABUiterativeMCMC <- cbind(sim_list$TABUiterativeMCMC, sim_list$TABUiterativeMCMC[, 2] / sim_list$nedges)
  # colnames(sim_list$TABUiterativeMCMC)[6] <- "FPRn"
  # sim_list$TABUfinalMCMC <- cbind(sim_list$TABUfinalMCMC, sim_list$TABUfinalMCMC[, 1] / sim_list$nedges, sim_list$TABUfinalMCMC[, 2] / sim_list$nedges)
  # colnames(sim_list$TABUfinalMCMC)[c(5, 6)] <- c("TPR", "FPRn")
  #
  # nit <- nrow(sim_list$TABUiterativeMCMC)
  # sim_list$SHDMAPtabu <- sim_list$TABUterativeMCMC[nit, 4]
  # sim_list$SHDmediantabu <- sim_list$TABUfinalMCMC[7, 3]
  # sim_list$TABUtotaltime <- as.numeric(sim_list$TABUtotaltime) * 60

  return(sim_list)
}

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

scoreDf <- function(ss, algo_title, logscore, tim, rep) {
  scoredf <- data.frame(
    time = double(),
    logscore = double(),
    algorithm = character(),
    replicate = integer(),
    ss = integer()
  )
  scoredf <- rbind(scoredf, data.frame(
    logscore = logscore,
    algo = algo_title,
    ss = ss,
    replicate = rep,
    time = time
  ))
  return(scoredf)
}

BlipScoresToDf <- function(newrep, repl) {
  scoredf <- scoredf.init()

  scoredf <- rbind(scoredf, data.frame(
    logscore = newrep$blip$res[3, 6], # 3 is ? and 6 is the score column
    algo = "blip",
    ss = newrep$sampsize / newrep$n,
    replicate = repl,
    time = newrep$blip$res[3, 8] # 3 is ? and 8 is the time column
  ))
  return(scoredf)
}


scoredf.add <- function(newrep, scoredf, algo, repl) {
  if (algo == "blip") {
    scoredf <- rbind(scoredf, data.frame(
      logscore = newrep$blip$res[3, 6], # 3 is ? and 6 is the score column
      algo = "blip",
      ss = newrep$sampsize / newrep$n,
      replicate = repl,
      time = newrep$blip$res[3, 8] # 3 is ? and 8 is the time column
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

BlipResultsToROC <- function(newrep, repl) {
  ROCdf <- ROCdf.init()
  ROCdf <- rbind(ROCdf, data.frame(
    TPR = newrep$blip$res[, 4],
    FPRn = newrep$blip$res[, 5],
    threshold = newrep$blip$res[, 8],
    algorithm = "blip",
    ss = newrep$sampsize / newrep$n,
    replicate = repl
  ))

  return(ROCdf)
}

BidagResultsToROC <- function(sim, repl) {
  ROCdf <- ROCdf.init()

  nit <- nrow(sim$iterative_search)
  ROCdf <- rbind(ROCdf, data.frame(
    TPR = sim$iterative_search[nit, 3],
    FPRn = sim$iterative_search[nit, 6],
    threshold = 10,
    algorithm = "iterativeMCMC",
    ss = sim$sampsize / sim$n,
    replicate = sim$replicate
  ))
  ROCdf <- rbind(ROCdf, data.frame(
    TPR = sim$order_mcmc[, 5],
    FPRn = sim$order_mcmc[, 6],
    threshold = sim$order_mcmc[, 4],
    algorithm = "finalMCMC",
    ss = sim$sampsize / sim$n,
    replicate = sim$replicate
  ))

  return(ROCdf)
}


BidagResultsToSHD <- function(newrep) {
  SHDdf <- SHDdf.init()
  SHDdf <- rbind(SHDdf, data.frame(
    SHD = newrep$SHDmedian,
    algorithm = "finalMCMC",
    ss = newrep$sampsize / newrep$n,
    replicate = newrep$replicate,
    time = newrep$totaltime
  ))
  SHDdf <- rbind(SHDdf, data.frame(
    SHD = newrep$iterative_search[nrow(newrep$iterative_search), 4],
    algorithm = "MAP PC",
    ss = newrep$sampsize / newrep$n,
    replicate = newrep$replicate,
    time = newrep$totaltime
  ))

  return(SHDdf)
}


BlipResultsToSHD <- function(newrep, repl) {
  SHDdf <- SHDdf.init()
  SHDdf <- rbind(SHDdf, data.frame(
    SHD = newrep$blip$res[3, 3],
    algorithm = "blip",
    ss = newrep$sampsize / newrep$n,
    replicate = repl,
    time = newrep$blip$res[3, 8]
  ))

  return(SHDdf)
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

    SHDdf <- rbind(SHDdf, data.frame(
      SHD = newrep$iterativeMCMC[nrow(newrep$iterativeMCMC), 4],
      algorithm = "MAP PC",
      ss = newrep$sampsize / newrep$n,
      replicate = newrep$replicate,
      time = newrep$totaltime
    ))

  }
  return(SHDdf)
}
