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

# Generate data
n <- 15
seed_number <- 42

# Generate binary BN
#
n_datasets <- 20
binBN <- list()
bindata10n <- list()
bindata2n <- list()

#for (i in seq(n_datasets)) {
#  binBN[[i]] <- generatebinaryBN(n = n, seed_number, c(0.1, 0.9), d = 2)
#  bindata10n[[i]] <- generatebinaryBN.data(n = n, binaryBN = binBN[[i]],
#                                           samplesize = 10*n)
#  bindata2n[[i]] <- generatebinaryBN.data(n = n, binaryBN = binBN[[i]],
#                                          samplesize = 2*n)
#}


saveRDS(binBN, file = "binBN.rds")
saveRDS(bindata10n, file = "bindata10n.rds")
saveRDS(bindata2n, file = "bindata2n.rds")

# # Load data
# binBN <- readRDS("binBNs.rds") # TODO: This is just temporary
# bindata10n <- readRDS("bindata10n.rds")
# bindata2n <- readRDS("bindata2n.rds")
# n <- numNodes(binBN[[1]]$DAG)
# n_datasets <- length(binBN)

## Simulate rblip
##
# This is since it did not work with cllusterApply for some reason?
blipsimlist2n <- list()
blipsimlist10n <- list()
for (j in 1:n_datasets) {
  blipsimlist10n[[j]] <- blipsim(n, binBN[[j]]$DAG, bindata10n[[j]],
                                 timesvec = c(60, 70, 80), "bdeu", rep = j)
  blipsimlist2n[[j]] <- blipsim(n, binBN[[j]]$DAG, bindata2n[[j]],
                                timesvec = c(60, 70, 80), "bdeu", rep = j)
}
save(blipsimlist10n, file = "blipsimlist10n.rda")
save(blipsimlist2n, file = "blipsimlist2n.rda")

# Trying to make r.blip parallel
#cl <- makeCluster(n_datasets)
#blip_sim_list_10n <- clusterApply(cl, c(1:n_datasets), blipsim, binBN, bindata10n,  timesvec = c(60, 70, 80), rep = 1)
#stopCluster(cl)

##
## BiDAG binary Euler
##
cl <- makeCluster(n_datasets)
bidag_sim_list_10n <- clusterApply(cl, c(1:n_datasets), simulationBiDAGvsBLIP, n = n, binBN, bindata10n)
bidag_sim_list_2n <- clusterApply(cl, c(1:n_datasets), simulationBiDAGvsBLIP, n = n, binBN, bindata2n)
stopCluster(cl)
bidag_sim_list_2n

# 1. summarize bidag
# 2. plot

##
## PC algorithm
##
path <- file.path("simresults", "pcges", "DAGtype", "avParents")
cl <- makeCluster(n_datasets)
pcalg_sim_list_10n <- clusterApply(cl, c(1:n_datasets), PCGESsim, n, binBN, bindata10n, path=path)
pcalg_sim_list_2n <- clusterApply(cl, c(1:n_datasets), PCGESsim, n, binBN, bindata2n, path=path)
stopCluster(cl)

pcalg_sim_list_10n
