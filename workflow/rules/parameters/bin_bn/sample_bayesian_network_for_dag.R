# Samples a binary Bayesian network given a DAG.
library(argparser)

source("resources/binarydatagen/generatebinaryBNf.r")

adjacency2dag <- function(adj, nodes = NULL) {
    l <- ncol(adj)
    if (is.null(nodes)) {
        if (!all(is.character(colnames(adj)))) {
            V <- c(1:l)
            edL <- vector("list", length = l)
            names(edL) <- sapply(V, toString)
        } else {
            edL <- vector("list", length = l)
            names(edL) <- colnames(adj)
            V <- colnames(adj)
        }
        for (i in 1:l) edL[[i]] <- list(edges = which(adj[i, ] == 1))
    } else {
        V <- nodes
        edL <- vector("list", length = l)
        names(edL) <- V
        for (i in 1:l) edL[[i]] <- list(edges = which(adj[i, ] == 1))
    }
    gR <- new("graphNEL",
        nodes = sapply(V, toString), edgeL = edL,
        edgemode = "directed"
    )
    return(gR)
}

dag2adjacencymatrix <- function(g) {
    l <- length(g@edgeL)
    adj <- matrix(rep(0, l * l), nrow = l, ncol = l)
    for (i in 1:l) {
        adj[g@edgeL[[i]]$edges, i] <- 1
    }
    rownames(adj) <- g@nodes
    return(t(adj))
}

p <- arg_parser("A program for generating a random directed acyclig graph.")
p <- add_argument(p, "--filename", help = "output filename")
p <- add_argument(p, "--filename_dag", help = "Filename for DAG")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric")
p <- add_argument(p, "--min", help = "Min baseline probability", type = "numeric")
p <- add_argument(p, "--max", help = "Max baseline probability", type = "numeric")
p <- add_argument(p, "--collider_effect", help = "Use OR-gate collider effects for nodes with multiple parents", flag = TRUE)
p <- add_argument(p, "--strong_effects", help = "Make all parent-child relationships strong", flag = TRUE)
argv <- parse_args(p)

filename <- file.path(argv$filename)
seed_number <- argv$seed
filename_dag <- argv$filename_dag

adjmat <- read.csv(filename_dag, check.names = FALSE)
n <- dim(adjmat)[2]
labels <- colnames(adjmat)
rownames(adjmat) <- colnames(adjmat)

# First we have to use integers as labels. Then convert back to the original labels below.
rownames(adjmat) <- seq(n)
colnames(adjmat) <- seq(n)

DAG <- adjacency2dag(adjmat)#, nodes = colnames(adjmat))

collider_effect_val <- isTRUE(argv$collider_effect)
strong_effects_val <- isTRUE(argv$strong_effects)

set.seed(seed_number)
binBN <- generateBinaryBN(DAG, baseline = c(argv$min, argv$max), collider_effect = collider_effect_val, strong_effects = strong_effects_val)
# Set the node labels
nodes(binBN$DAG) <- labels
colnames(binBN$adj) <- labels

saveRDS(binBN, file = filename)
