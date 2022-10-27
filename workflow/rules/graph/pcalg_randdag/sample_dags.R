# Samples dags using a modified vrsion of pcalg's randDAG, where
# the maximum average number of parents can be specified.
library(BiDAG)
library(gRbase)
source("resources/binarydatagen/generate_DAG.R")

filename <- snakemake@output[["adjmat"]]
n <- as.integer(snakemake@wildcards[["n"]])
d <- as.integer(snakemake@wildcards[["d"]])

par1 <- NULL
if (snakemake@wildcards[["par1"]] != "None") {
  par1 <- as.integer(snakemake@wildcards[["par1"]])
}
par2 <- NULL
if (snakemake@wildcards[["par2"]] != "None") {
  par2 <- as.integer(snakemake@wildcards[["par2"]])
}
max_parents <- NULL
if (snakemake@wildcards[["max_parents"]] != "None") {
  max_parents <- as.integer(snakemake@wildcards[["max_parents"]])
}

DAG <- as.logical(snakemake@wildcards[["DAG"]])
method <- snakemake@wildcards[["method"]]
seed_number <- as.integer(snakemake@wildcards[["replicate"]])

set.seed(seed_number)
adjmat <- randDAGMaxParents(
  n = n, d = d, par1 = par1, par2 = par2,
  method = method, max_parents = max_parents, DAG = DAG
)

colnames(adjmat) <- as.character(colnames(adjmat))

write.table(adjmat,
  file = filename, row.names = FALSE,
  quote = FALSE, col.names = TRUE, sep = ","
)
