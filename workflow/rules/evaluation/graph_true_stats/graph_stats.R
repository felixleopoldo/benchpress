library(pcalg)
adjmat <- read.csv(snakemake@input[["matrix_filename"]])

graphnel <- as(t(adjmat), "graphNEL") ## convert to graph

n_edges <- sum(adjmat)
if (isSymmetric(as.matrix(adjmat))) {
  n_edges <- n_edges / 2
}

sp <- strsplit(snakemake@wildcards[["adjmat_string"]], split = "seed=")

seed <- "None"
if (length(sp[[1]]) == 2) {
  seed <- as.integer(sp[[1]][2])
}

maxin <- max(colSums(adjmat))

df <- data.frame(
  "adjmat" = snakemake@wildcards[["adjmat_string"]],
  "n_inedges" = n_edges,
  "n_nodes" = ncol(adjmat),
  "max_indegree" = maxin,
  "seed" = seed
)

write.csv(df, snakemake@output[["stats_filename"]],
  row.names = FALSE, quote = FALSE
)
