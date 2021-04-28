# Samples dags and saves to file
library(BiDAG)
library(gRbase)
source("resources/binarydatagen/generate_DAG.R")
source("resources/code_for_binary_simulations/make_name.R")

filename <- snakemake@output[["adjmat"]] 
n <- as.integer(snakemake@wildcards[["n"]]) 
d <- as.integer(snakemake@wildcards[["d"]]) 
par1 <- as.numeric(snakemake@wildcards[["par1"]]) 
par2  <- as.numeric(snakemake@wildcards[["par2"]]) 
method <- snakemake@wildcards[["method"]]
max_parents <- as.integer(snakemake@wildcards[["max_parents"]]) 
seed_number <- as.integer(snakemake@wildcards[["replicate"]]) 

set.seed(seed_number)
adjmat <- randDAGMaxParents(n = n, d = d, par1=par1, par2=par2, method=method, max_parents=max_parents)

#write.csv(adjmat, file = filename, quote = FALSE, row.names = FALSE)

colnames(adjmat) <- as.character(colnames(adjmat))

write.table(adjmat, file = filename, row.names = FALSE, quote = FALSE, col.names=TRUE, sep=",")
#write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)
