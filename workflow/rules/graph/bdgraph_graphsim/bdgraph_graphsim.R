# Samples a graph using graph.sim frm th BDgraph package

library(BDgraph)

size <- NULL
if (snakemake@wildcards[["size"]] != "None") {
  size <- as.integer(snakemake@wildcards[["size"]])
}

class <- NULL
if (snakemake@wildcards[["class"]] != "None") {
  size <- as.numeric(snakemake@wildcards[["class"]])
}


set.seed(as.integer(snakemake@wildcards[["replicate"]]))
adjmat <- graph.sim(
  p = as.integer(snakemake@wildcards[["p"]]),
  graph = snakemake@wildcards[["graph"]],
  prob = as.numeric(snakemake@wildcards[["prob"]]),
  size = size,
  class = class,
  vis = FALSE
)

p <- as.integer(snakemake@wildcards[["p"]])
colnames(adjmat) <- as.character(seq(p))

write.table(adjmat,
  file = snakemake@output[["adjmat"]],
  row.names = FALSE, quote = FALSE, col.names = TRUE, sep = ","
)
