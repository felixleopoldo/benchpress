library(pcalg)
library(igraph)

adjmat <- read.csv(snakemake@input[["matrix_filename"]], check.names = FALSE)

n_edges <- sum(adjmat)
if (isSymmetric(unname(as.matrix(adjmat)))) {
    print("Graph is symmetric")
    n_edges <- n_edges / 2
}

sp <- strsplit(snakemake@wildcards[["adjmat_string"]], split = "seed=")

seed <- "None"
if (length(sp[[1]]) == 2) {
    seed <- as.integer(sp[[1]][2])
}

maxin <- max(colSums(adjmat)) # count in-degrees
max_clique_size <- NA
avg_clique_size <- NA
min_clique_size <- NA

# Find the maximal cliques for undirected graphs
if (isSymmetric(unname(as.matrix(adjmat)))) {
    my_igraph <- graph_from_adjacency_matrix(
        as.matrix(adjmat),
        mode = "undirected",
        diag = FALSE
    )

    cliques <- max_cliques(my_igraph)
    max_clique_size <- max(sapply(cliques, length))
    avg_clique_size <- mean(sapply(cliques, length))
    min_clique_size <- min(sapply(cliques, length))
}

df <- data.frame(
    "adjmat" = snakemake@wildcards[["adjmat_string"]],
    "n_inedges" = n_edges,
    "n_nodes" = ncol(adjmat),
    "max_indegree" = maxin,
    "min_clique_size" = min_clique_size,
    "max_clique_size" = max_clique_size,
    "avg_clique_size" = avg_clique_size,
    "seed" = seed
)

write.csv(df, snakemake@output[["stats_filename"]],
    row.names = FALSE, quote = FALSE
)
