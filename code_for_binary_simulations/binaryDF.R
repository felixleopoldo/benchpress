scoredf.blip <- scoredf.init()
ROCdf.blip <- ROCdf.init()
SHDdf.blip <- SHDdf.init()

load("blipsimlist2n.rda") # list containing results of r.blip simulations
load("blipsimlist10n.rda") # list containing results of r.blip simulations

simlength <- length(blipsimlist2n)

for (i in 1:simlength) {
  scoredf.blip <- scoredf.add(newrep = blipsimlist2n[[i]], scoredf = scoredf.blip, algo = "blip", repl = i)
  ROCdf.blip <- ROCdf.add(blipsimlist2n[[i]], ROCdf.blip, "blip", repl = i)
  SHDdf.blip <- SHDdf.add(blipsimlist2n[[i]], SHDdf.blip, "blip", repl = i)
}
simlength <- length(blipsimlist10n)

for (i in 1:simlength) {
  scoredf.blip <- scoredf.add(newrep = blipsimlist10n[[i]], scoredf = scoredf.blip, algo = "blip", repl = i)
  ROCdf.blip <- ROCdf.add(blipsimlist10n[[i]], ROCdf.blip, "blip", repl = i)
  SHDdf.blip <- SHDdf.add(blipsimlist10n[[i]], SHDdf.blip, "blip", repl = i)
}

# NOW ADD BIDAG PART
path <- "/Users/pminkina/Downloads/simresults/blippower/" # path to simulation results
file_list <- list.files(path = path)
length(file_list)
k <- 1
for (j in 1:length(file_list)) {
  # BiDAGbin[[k]]<-readRDS(paste(path,file_list[j],sep=""))
  load(paste(path, file_list[j], sep = ""))
  BiDAGbin[[k]] <- sim

  BiDAGbin[[k]]$iterativeMCMC <- cbind(BiDAGbin[[j]]$iterativeMCMC, BiDAGbin[[j]]$iterativeMCMC[, 2] / BiDAGbin[[j]]$nedges)
  colnames(BiDAGbin[[j]]$iterativeMCMC)[6] <- "FPRn"

  BiDAGbin[[k]]$TABUiterativeMCMC <- cbind(BiDAGbin[[j]]$TABUiterativeMCMC, BiDAGbin[[j]]$TABUiterativeMCMC[, 2] / BiDAGbin[[j]]$nedges)
  colnames(BiDAGbin[[j]]$TABUiterativeMCMC)[6] <- "FPRn"

  BiDAGbin[[k]]$finalMCMC <- cbind(BiDAGbin[[j]]$finalMCMC, BiDAGbin[[j]]$finalMCMC[, 1] / BiDAGbin[[j]]$nedges, BiDAGbin[[j]]$finalMCMC[, 2] / BiDAGbin[[j]]$nedges)
  colnames(BiDAGbin[[j]]$finalMCMC)[c(5, 6)] <- c("TPR", "FPRn")

  BiDAGbin[[k]]$TABUfinalMCMC <- cbind(BiDAGbin[[j]]$TABUfinalMCMC, BiDAGbin[[j]]$TABUfinalMCMC[, 1] / BiDAGbin[[j]]$nedges, BiDAGbin[[j]]$TABUfinalMCMC[, 2] / BiDAGbin[[j]]$nedges)
  colnames(BiDAGbin[[j]]$TABUfinalMCMC)[c(5, 6)] <- c("TPR", "FPRn")


  BiDAGbin[[k]]$ss <- BiDAGbin[[k]]$sampsize / BiDAGbin[[k]]$n

  BiDAGbin[[k]]$replicate <- as.numeric(str_match(file_list[j], pattern = "r(.*?).Rda")[[2]])

  nit <- nrow(BiDAGbin[[j]]$iterativeMCMC)
  BiDAGbin[[k]]$SHDMAP <- BiDAGbin[[k]]$terativeMCMC[nit, 4]
  BiDAGbin[[k]]$SHDmdeian <- BiDAGbin[[k]]$finalMCMC[7, 3]
  nit <- nrow(BiDAGbin[[j]]$TABUiterativeMCMC)
  BiDAGbin[[k]]$SHDMAPtabu <- BiDAGbin[[k]]$TABUterativeMCMC[nit, 4]
  BiDAGbin[[k]]$SHDmediantabu <- BiDAGbin[[k]]$TABUfinalMCMC[7, 3]
  BiDAGbin[[k]]$totaltime <- as.numeric(BiDAGbin[[k]]$totaltime) * 60
  BiDAGbin[[k]]$TABUtotaltime <- as.numeric(BiDAGbin[[k]]$TABUtotaltime) * 60
  k <- k + 1
}
simlength <- length(BiDAGbin)

# this you might need for storing PC
pcgeslist <- list()
path <- "/Users/pminkina/Downloads/simresults/pcges/randomDAG2" # path to simulation results
file_list <- list.files(path = path)
k <- 1
for (j in 1:length(file_list)) {
  pcgeslist[[k]] <- readRDS(paste(path, file_list[j], sep = ""))
  pcgeslist[[k]]$ss <- pcgeslist[[k]]$sampsize / pcgeslist[[k]]$n
  pcgeslist[[k]]$n <- paste("n=", pcgeslist[[k]]$n, sep = "")
  pcgeslist[[k]]$avpar <- pcgeslist[[k]]$avParents
  pcgeslist[[k]]$maxpar <- max(apply(dag2adjacencymatrix(pcgeslist[[j]]$DAG), 2, sum))
  k <- k + 1
}

for (i in 1:simlength) {
  scoredf.blip <- scoredf.add(newrep = BiDAGbin[[i]], scoredf = scoredf.blip, algo = "MCMC", repl = 1)
}

for (i in 1:simlength) {
  SHDdf.blip <- SHDdf.add(newrep = BiDAGbin[[i]], SHDdf = SHDdf.blip, algo = "MCMC", repl = 1)
}

for (i in 1:simlength) {
  ROCdf.blip <- ROCdf.add(newrep = BiDAGbin[[i]], ROCdf = ROCdf.blip, algo = "MCMC", repl = 1)
}

sumROCdf.blip <- summarySE(ROCdf.blip, "TPR", "FPRn", groupvars = c("ss", "algorithm", "threshold"))
