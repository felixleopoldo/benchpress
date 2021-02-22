library(pcalg)
# This function gives edges weights between the bounds
# with both positive and negative signs
wFUN <- function(m, lb, ub){ # function for edge weights
    runif(m, lb, ub)*sample(c(-1, 1), m, replace = TRUE)
}

print(snakemake@wildcards)
n <- as.integer(snakemake@wildcards[["dim"]])
exp_parents <- as.integer(snakemake@wildcards[["av_parents"]])
seed <- as.integer(snakemake@wildcards[["replicate"]])
filename <- snakemake@output[["adjmat"]]

print(n)
#trueDAG <- 1*(trueDAGedges != 0) # the edge presence in the DAG# generate random DAG
set.seed(seed)
trueDAGedges <- as(pcalg::randDAG(  n = n, 
                                    d = 2*exp_parents, 
                                    wFUN = list(wFUN, 0, 10)), 
                                    "matrix")
adjmat <- 1*(trueDAGedges != 0)


colnames(adjmat) <- seq(n)

write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)
