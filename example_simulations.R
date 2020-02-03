library(r.blip)
library(parallel)


source("lib/binarydatagen/generatebinaryBNf.r")
source("lib/binarydatagen/binarygenlogit.R")
source("lib/binarydatagen/binarygenunif.R")
source("lib/binarydatagen/binarygenlogitints.R")
source("lib/binarydatagen/binarygenlogitints.R")
source("lib/code_for_binary_simulations/rblip.R")
source("lib/code_for_binary_simulations/sim_bidag_binary_euler.R")
source("lib/code_for_binary_simulations/PC_GES_sim.R")
source("lib/code_for_binary_simulations/bnlearn_help_fns.R")
source("lib/code_for_binary_simulations/summarySE.R")
source("lib/code_for_binary_simulations/df_fns.R")
source("lib/code_for_binary_simulations/blip_vs_bidag_plot.R")

# 1. Simulate DAGs (should be in standard format)
# 2. Simulate parameters (this can be in any format since only data and graphs
#    are needed for graph evaluation)
# 3. Simulate data (should be in standard format)
# 4. Sample graphs
# 5. Turn samples into datafram format
# 6. Plot statistics


# Generate data
n <- 15
seed_number <- 1

# Generate binary BN
#
n_datasets <- 4
DAGs <- list()
binBN <- list()
bindata2n <- list()
bindata10n <- list()
avParents <- 2

for (i in seq(n_datasets)) {
  DAGs[[i]] <- generateDAGMaxParents(n = n, d = avParents)
  binBN[[i]] <- generateBinaryBN(DAGs[[i]], c(0.1, 0.9))
  bindata2n[[i]] <- generatebinaryBN.data(n = n, binaryBN = binBN[[i]], samplesize = 2*n)
  bindata10n[[i]] <- generatebinaryBN.data(n = n, binaryBN = binBN[[i]], samplesize = 10*n)
}

saveRDS(DAGs, file = "DAGs.rds")
saveRDS(binBN, file = "binBN.rds")
saveRDS(bindata2n, file = "bindata2n.rds")
saveRDS(bindata10n, file = "bindata10n.rds")

##  Load data
binBN <- readRDS("binBN.rds") # TODO: This is just temporary
bindata2n <- readRDS("bindata2n.rds")
bindata10n <- readRDS("bindata10n.rds")


## Simulate rblip
##
# This is since it did not work with cllusterApply for some reason?
blipsimlist2n <- list()
blipsimlist10n <- list()
for (j in 1:n_datasets) {
  blipsimlist2n[[j]] <- blipsim(n, binBN[[j]]$DAG, bindata2n[[j]], timesvec = c(60, 70, 80), "bdeu", rep = j)
  blipsimlist10n[[j]] <- blipsim(n, binBN[[j]]$DAG, bindata10n[[j]], timesvec = c(60, 70, 80), "bdeu", rep = j)
}

saveRDS(blipsimlist2n, file = "blipsimlist2n.Rda")
saveRDS(blipsimlist10n, file = "blipsimlist10n.Rda")

## BiDAG binary Euler

# Make simBiDAG run extendBidagSimResult of use some parfor
# loop instead and run it there.
cl <- makeCluster(n_datasets)
bidag_sim_list_2n <- clusterApply(cl, c(1:n_datasets), simulationBiDAG, n = n, DAGs, bindata2n)
bidag_sim_list_10n <- clusterApply(cl, c(1:n_datasets), simulationBiDAG, n = n, DAGs, bindata10n)
stopCluster(cl)

saveRDS(bidag_sim_list_2n, "bidag_sim_list_2n.Rda")
saveRDS(bidag_sim_list_10n, "bidag_sim_list_10.Rda")

# Create data frames

scoredf <- scoredf.init()
ROCdf <- ROCdf.init()
SHDdf <- SHDdf.init()

blipsimlist2n <- readRDS("blipsimlist2n.Rda")
blipsimlist10n <- readRDS("blipsimlist10n.Rda")
n_datasets <- length(blipsimlist10n)

for (i in 1:n_datasets) {
  # Sample size 2n
  scoredf <- scoredf.add(newrep = blipsimlist2n[[i]], scoredf = scoredf, algo = "blip", repl = i)
  ROCdf <- ROCdf.add(blipsimlist2n[[i]], ROCdf, "blip", repl = i)
  SHDdf <- SHDdf.add(blipsimlist2n[[i]], SHDdf, "blip", repl = i)

  # Sample size 10n
  scoredf <- scoredf.add(newrep = blipsimlist10n[[i]], scoredf = scoredf, algo = "blip", repl = i)
  ROCdf <- ROCdf.add(blipsimlist10n[[i]], ROCdf, "blip", repl = i)
  SHDdf <- SHDdf.add(blipsimlist10n[[i]], SHDdf, "blip", repl = i)
}


# It might be enough that DF is stored in a generic way. Eg in .csv,
# since this is what we will use for plotting. So if we use E.g. other programs,
# we can just read this .csv file.

bidag_sim_list_2n <- readRDS("bidag_sim_list_2n.Rda")
bidag_sim_list_10n <- readRDS("bidag_sim_list_10.Rda")

for (j in 1:n_datasets) {
  # Sample size 2n
  scoredf <- scoredf.add(newrep = bidag_sim_list_2n[[j]], scoredf = scoredf, algo = "MCMC", repl = j)
  SHDdf <- SHDdf.add(newrep = bidag_sim_list_2n[[j]], SHDdf = SHDdf, algo = "MCMC", repl = j)
  ROCdf <- ROCdf.add(newrep = bidag_sim_list_2n[[j]], ROCdf = ROCdf, algo = "MCMC", repl = j)
  # Sample size 10n
  scoredf <- scoredf.add(newrep = bidag_sim_list_10n[[j]], scoredf = scoredf, algo = "MCMC", repl = j)
  SHDdf <- SHDdf.add(newrep = bidag_sim_list_10n[[j]], SHDdf = SHDdf, algo = "MCMC", repl = j)
  ROCdf <- ROCdf.add(newrep = bidag_sim_list_10n[[j]], ROCdf = ROCdf, algo = "MCMC", repl = j)
}

sumROCdf <- summarySE(ROCdf, "TPR", "FPRn", groupvars = c("ss", "algorithm", "threshold"))
sumROCdf$algorithm <- with(sumROCdf, factor(algorithm, levels = c("blip", "iterativeMCMC", "finalMCMC")))

sumROCdf
SHDdf
scoredf
ROCdf
write.csv(sumROCdf, file = "sumROCdf.csv", row.names = FALSE)
write.csv(scoredf, file = "scoredf.csv", row.names = FALSE)
write.csv(SHDdf, file = "SHDdf.csv", row.names = FALSE)
write.csv(ROCdf, file = "ROCdf.csv", row.names = FALSE)


# 1. Store method setting in a database table
# 2. Create R scripts
# 3. Create database table with all available graphs
# 4. Create table with all available data

sumROCdf <- read.csv("sumROCdf.csv")
scoredf <- read.csv("scoredf.csv")
scoredf = addScoreDiffToDataframe(scoredf)
SHDdf <- read.csv("SHDdf.csv")
ROCdf <- read.csv("ROCdf.csv")

# Plotting
#
plot_ROC(sumROCdf)
dev.off()
scoreShiftPlot(scoredf) # working properly
dev.off()
HorisontalBoxplot(scoredf) # not working
dev.off()

#PlotScoreBidagVsBlip(scoredf)
#dev.off()

PlotStructuralHammingDistance(SHDdf = SHDdf)
dev.off()


##
## PC algorithm
##

basename <- file.path("simresults", "pcges", "DAGtype", "avParents")
DAGtype <- "randomDAG"
dir.create(basename)
basename

if (n < 200) {
  pcalphas <- c(0.01, 0.05, 0.1,0.2, 0.35)
} else {
  pcalphas <- c(0.01, 0.05, 0.1, 0.2, 0.25)
}

cl <- makeCluster(n_datasets)
pcalg_sim_list_2n <- clusterApply(cl, c(1:n_datasets), PCGESsim, n, binBN, bindata2n, pcalphas)
stopCluster(cl)
pcalg_sim_list_2n

for (i in seq(n_datasets)) {
  sampsize <- dim(bindata2n[[i]])[1]
  filename <- paste("PCGESsim", "n", n, "p", avParents, "s", sampsize / n, "r", i,".Rda", sep = "_")
  print(file.path(basename, filename))
  saveRDS(pcalg_sim_list_10n[[i]], file = file.path(basename, filename))
}

cl <- makeCluster(n_datasets)
pcalg_sim_list_10n <- clusterApply(cl, c(1:n_datasets), PCGESsim, n, binBN, bindata10n, pcalphas)
stopCluster(cl)

for (i in seq(n_datasets)) {
  sampsize <- dim(bindata10n[[i]])[1]
  filename <- paste("PCGESsim", "n", n, "p", avParents, "s", sampsize / n, "r", i,".Rda", sep = "_")
  saveRDS(pcalg_sim_list_10n[[i]], file = file.path(basename, filename))
}


# Summarizing PCALG simulations
#
# this you might need for storing PC
pcgeslist <- list()
# path <- "./simresults/pcges/randomDAG2" # path to simulation results
path <- "./simresults/pcges/randomDAG/2/" # path to simulation results

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

pcgeslist