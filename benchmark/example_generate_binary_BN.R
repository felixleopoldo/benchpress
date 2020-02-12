source("lib/binarydatagen/generatebinaryBNf.r")
source("lib/binarydatagen/binarygenlogit.R")
source("lib/binarydatagen/binarygenunif.R")
source("lib/binarydatagen/binarygenlogitints.R")
source("lib/binarydatagen/binarygenlogitints.R")

n <- 50
seed_number <- 42

# Generate binary BN
#
n_datasets <- 10
binBNs <- list()
bindata10n <- list()
bindata2n <- list()

for (i in seq(n_datasets)) {
  binBNs[[i]] <- generatebinaryBN(n = n, seed_number, c(0.1, 0.9), d = 2)
  bindata10n[[i]] <- generatebinaryBN.data(n = n, binaryBN = binBNs[[i]],
                                           samplesize = 10*n)
  bindata2n[[i]] <- generatebinaryBN.data(n = n, binaryBN = binBNs[[i]],
                                          samplesize = 2*n)
}

saveRDS(binBNs, file = "binBNs.rds")
saveRDS(bindata10n, file = "bindata10n.rds")
saveRDS(bindata2n, file = "bindata2n.rds")

# Generate binary BN and data using the logit model logit
#
set.seed(seed_number)
binData <- generateBinDataLogit(trueDAG, N)

# Generate binary logit ints
#
set.seed(42)
binData <- GenerateBinDataWithInteractions(trueDAG, N)
saveRDS(binData, file = "binDataWithInteractions.rds")


# Generate binary uniform
#
set.seed(42)
DAGparams <- DAGparameters(trueDAG)
binData <- BinarySampleFromDAG(DAGparams, N)
