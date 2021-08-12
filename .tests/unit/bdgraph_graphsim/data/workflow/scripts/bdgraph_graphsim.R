library(BDgraph)

set.seed(as.integer(snakemake@wildcards[["replicate"]]))
adjmat <- graph.sim(p = as.integer(snakemake@wildcards[["p"]]), 
                    graph = snakemake@wildcards[["graph"]], 
                    prob = as.numeric(snakemake@wildcards[["prob"]]), 
                    size = as.integer(snakemake@wildcards[["size"]]), 
                    class = as.numeric(snakemake@wildcards[["class"]]), 
                    vis = FALSE )

p <- as.integer(snakemake@wildcards[["p"]])
colnames(adjmat) <- as.character(seq(p))

write.table(adjmat, file = snakemake@output[["adjmat"]], 
            row.names = FALSE, quote = FALSE, col.names = TRUE, sep = ",")