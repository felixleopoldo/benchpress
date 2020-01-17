# Simulation study
source("binarydatagen/binarygenlogitints.R")

set.seed(42)

n <- 5
N <- 13 # need like 10k observations to get good graph!
n_e_parents <- 2
n_datasets <- 1

#for (i in seq(n_datasets)) {

# Sample DAG
trueDAG <- generateDAG(n, n_e_parents)
# number of true edges
sum(trueDAG)

# Sample binary data
binData <- GenerateBinDataWithInteractions(trueDAG, N)

# Itarative MCMC search
scorepar <- scoreparameters(n, scoretype = "bde", data = binData, bdepar = list(chi = 1, edgepf = 1))
itMCMC <- iterativeMCMCsearch(n, scorepar,verbose = TRUE, MAP = TRUE)

DAGscore(n, scorepar, trueDAG)
# check DAGs
BiDAG::compareDAGs(BiDAG::adjacency2dag(itMCMC$max$DAG), BiDAG::adjacency2dag(trueDAG))

#}
