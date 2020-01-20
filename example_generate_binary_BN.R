source("lib/binarydatagen/generatebinaryBNf.r")
source("lib/binarydatagen/binarygenlogit.R")
source("lib/binarydatagen/binarygenunif.R")
source("lib/binarydatagen/binarygenlogitints.R")

# Generate binary BN
#
n <- 5
N <- 20
seed_number <- 1
n_datasets <- 10
binBNs <- list()
bindata10n <- list()
for (i in seq(n_datasets)) {
  binBNs[[i]] <- generatebinaryBN(n = n, seed_number, c(0.1, 0.9), d = 2)
  bindata10n[[i]] <- generatebinaryBN.data(n = n, binBNs[[i]], N)
}

saveRDS(binBNs, file = "binBNs.rds")
saveRDS(bindata10n, file = "bindata10n.rds")


# example of structure learning
myscore <- scoreparameters(n = n, "bde", bindata10n, bdepar = list(chi = 1, edgepf = 1))
itmap <- iterativeMCMCsearch(n = 100, myscore)
iterations.check(itmap, binBN$DAG)

# Generate binary BN and data using the logit model logit
#
n <- 40
N <- 1e3 # need like 10k observations to get good graph!

set.seed(42)
trueDAG <- generateDAG(n, 2)
binData <- generateBinData(trueDAG, N)
scorepar <- scoreparameters(n, scoretype = "bde", data = binData, bdepar = list(chi = 1, edgepf = 1))
itMCMC <- iterativeMCMCsearch(n, scorepar)

itMCMC
DAGscore(n, scorepar, trueDAG)
# number of true edges
sum(trueDAG)
# check DAGs?
BiDAG::compareDAGs(BiDAG::adjacency2dag(itMCMC$max$DAG), BiDAG::adjacency2dag(trueDAG))

# Generate binary logit ints
#

n <- 40
N <- 1e3 # need like 10k observations to get good graph!
set.seed(42)
trueDAG <- generateDAG(n, 2)
binData <- GenerateBinDataWithInteractions(trueDAG, N)
saveRDS(binData, file = "binDataWithInteractions.rds")
is(binData)
scorepar <- scoreparameters(n, scoretype = "bde", data = binData, bdepar = list(chi = 1, edgepf = 1))
itMCMC <- iterativeMCMCsearch(n, scorepar)

itMCMC
DAGscore(n, scorepar, trueDAG)
# number of true edges
sum(trueDAG)
# check DAGs?
BiDAG::compareDAGs(BiDAG::adjacency2dag(itMCMC$max$DAG), BiDAG::adjacency2dag(trueDAG))


# Generate binary uniform
#
n <- 40
N <- 1e3 # need like 10k observations to get good graph!

set.seed(42)
trueDAG <- generateDAG(n, 2)
DAGparams <- DAGparameters(trueDAG)
binData <- BinarySampleFromDAG(DAGparams, N)
scorepar <- scoreparameters(n, scoretype = "bde", data = binData, bdepar = list(chi = 1, edgepf = 1))
itMCMC <- iterativeMCMCsearch(n, scorepar)
itMCMC
DAGscore(n, scorepar, trueDAG)
# number of true edges
sum(trueDAG)
# check DAGs?
BiDAG::compareDAGs(BiDAG::adjacency2dag(itMCMC$max$DAG), BiDAG::adjacency2dag(trueDAG))

