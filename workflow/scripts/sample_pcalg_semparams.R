library(pcalg)

# This function gives edges weights between the bounds
# with both positive and negative signs
wFUN <- function(m, lb, ub){ # function for edge weights
    runif(m, lb, ub)*sample(c(-1, 1), m, replace = TRUE)
}

seed <- as.integer(snakemake@wildcards[["seed"]])
min <- as.integer(snakemake@wildcards[["min"]])
max <- as.integer(snakemake@wildcards[["max"]])
filename <- snakemake@output[["bn"]] 

n <- as.integer(snakemake@wildcards[["dim"]])
exp_parents <- as.integer(snakemake@wildcards[["av_parents"]])

set.seed(seed)
trueDAGedges <- as(pcalg::randDAG(  n = n, 
                                    d = 2*exp_parents, 
                                    wFUN = list(wFUN, min, max)), 
                                    "matrix")

colnames(trueDAGedges) <- seq(n)

write.csv(trueDAGedges, file = filename, row.names = FALSE, quote = FALSE)
