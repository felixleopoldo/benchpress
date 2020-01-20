source("lib/code_for_binary_simulations/rblip.R")
source("lib/code_for_binary_simulations/sim_bidag_binary_euler.R")
source("lib/code_for_binary_simulations/PC_GES_sim.R")
library(parallel)
## Simulate rblip
##
binBN <- readRDS("binBNs.rds") # TODO: This is just temporary
bindata10n <- readRDS("bindata10n.rds")
timesvec = c(60, 120, 240)
rep = 1

##### test just 1 repliate
n <- 5
j <- 1
blipsim(n, binBN[[j]]$DAG, bindata10n[[j]], timesvec = c(60, 120, 240), rep = 1)

blipsimlist10n <- list()
for (j in 1:100) {
  blipsimlist10n[[j]] <- blipsim(n, binBN[[j]]$DAG, bindata10n[[j]],
                                 timesvec = c(60, 120, 240), rep = j)
  save(blipsimlist10n, file = "blippower10n.Rda")
}

blipsimlist2n <- list()
for (j in 1:100) {
  blipsimlist2n[[j]] <- blipsim(n, binBN[[j]]$DAG, bindata2n[[j]],
                                timesvec = c(60, 120, 240), rep = j)
  save(blipsimlist2n, file = "blippower2n.Rda")
}




##
## BiDAG biary Euler
##

i <- 1 # data simulation index
n <- 5 # number of nodes
DAGfiles <- "binBNs.rds"
datafiles <- "bindata10n.rds"
DAGs <- readRDS(DAGfiles) # TODO: This is just temporary
datas <- readRDS(datafiles)

# This is just since somethong went wrong on too many datasets (~100).
for (indc in 0:9) {
  ind <- c(1:10 + indc * 10)
  print(ind)
  print(indc)
  cl <- makeCluster(10)
  outputClApply <- clusterApply(cl, ind, simulationBiDAGvsBLIP, n = n, DAGs, datas)
  stopCluster(cl)
}
outputClApply

for (indc in 0:9) {
  ind <- c(1:10 + indc * 10)
  print(ind)
  print(indc)
  cl <- makeCluster(10)
  outputClApply <- clusterApply(cl, ind, simulationBiDAGvsBLIP, n = n, "binBNpower.rds", "bindata10npower.rds")
  stopCluster(cl)
}

for (indc in 0:9) {
  ind <- c(1:10 + indc * 10)
  cl <- makeCluster(10)
  outputClApply <- clusterApply(cl, ind, simulationBiDAGvsBLIP, n = n, "binBNpower.rds", "bindata2npower.rds")
  stopCluster(cl)
}


##
## PC GES
##

# simulation settings, graph properties
DAGtype <- "randomDAG"
n <- 20
sampsize <- 10 * n

for (indc in 0:9) {
  ind <- c(1:10 + indc * 10)
  cl <- makeCluster(10)
  outputClApply <- clusterApply(cl, ind, PCGESsim, n, "DAGfile.rds", "datafile.rds")
  stopCluster(cl)
}