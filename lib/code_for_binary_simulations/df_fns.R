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
  sim_list$replicate <- sim_list$i
  sim_list$ss <- sim_list$sampsize / sim_list$n

  # PCalg search start
  sim_list$iterativeMCMC <- cbind(sim_list$iterativeMCMC, sim_list$iterativeMCMC[, 2] / sim_list$nedges)
  colnames(sim_list$iterativeMCMC)[6] <- "FPRn"
  sim_list$finalMCMC <- cbind(sim_list$finalMCMC, sim_list$finalMCMC[, 1] / sim_list$nedges, sim_list$finalMCMC[, 2] / sim_list$nedges)
  colnames(sim_list$finalMCMC)[c(5, 6)] <- c("TPR", "FPRn")

  nit <- nrow(sim_list$iterativeMCMC)
  sim_list$SHDMAP <- sim_list$terativeMCMC[nit, 4]
  sim_list$SHDmdeian <- sim_list$finalMCMC[7, 3]
  sim_list$totaltime <- as.numeric(sim_list$totaltime) * 60

  # Tabu search start
  sim_list$TABUiterativeMCMC <- cbind(sim_list$TABUiterativeMCMC, sim_list$TABUiterativeMCMC[, 2] / sim_list$nedges)
  colnames(sim_list$TABUiterativeMCMC)[6] <- "FPRn"
  sim_list$TABUfinalMCMC <- cbind(sim_list$TABUfinalMCMC, sim_list$TABUfinalMCMC[, 1] / sim_list$nedges, sim_list$TABUfinalMCMC[, 2] / sim_list$nedges)
  colnames(sim_list$TABUfinalMCMC)[c(5, 6)] <- c("TPR", "FPRn")

  nit <- nrow(sim_list$TABUiterativeMCMC)
  sim_list$SHDMAPtabu <- sim_list$TABUterativeMCMC[nit, 4]
  sim_list$SHDmediantabu <- sim_list$TABUfinalMCMC[7, 3]
  sim_list$TABUtotaltime <- as.numeric(sim_list$TABUtotaltime) * 60

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

#' Title
#'
#' @param newrep Simulation result data frame (from BiDAG?)
#' @param ROCdf
#' @param algo
#' @param repl
#'
#' @return
#' @export
#'
#' @examples
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

