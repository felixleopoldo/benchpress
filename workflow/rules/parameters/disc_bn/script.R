# Samples a binary Bayesian network given a DAG.
library(argparser)

source("resources/binarydatagen/generateNStatesBNf.r")


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
    adj <- t(adj)
    colnames(adj) <- g@nodes
    return(adj)
}

p <- arg_parser("A program for generating a random directed acyclig graph.")
p <- add_argument(p, "--filename", help = "output filename")
p <- add_argument(p, "--filename_dag", help = "Filename for DAG")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric")
p <- add_argument(p, "--min", help = "Min baseline probability", type = "numeric")
p <- add_argument(p, "--max", help = "Max baseline probability", type = "numeric")
p <- add_argument(p, "--nstates", help = "Number of states", type = "numeric")
p <- add_argument(p, "--collider_effect", help = "Use OR-gate collider effects for nodes with multiple parents", flag = TRUE)
p <- add_argument(p, "--strong_effects", help = "Make all parent-child relationships strong (not just colliders)", flag = TRUE)
p <- add_argument(p, "--noisy_or", help = "Use noisy-OR parameterization for proper explaining away effects", flag = TRUE)
argv <- parse_args(p)

filename <- file.path(argv$filename)
seed_number <- argv$seed
filename_dag <- argv$filename_dag

print("filename_dag:")
print(filename_dag)
adjmat <- read.csv(filename_dag, check.names = FALSE)
print("adjmat:")
print(adjmat)
n <- dim(adjmat)[2]
labels <- colnames(adjmat)
rownames(adjmat) <- colnames(adjmat)

# Create DAG with original labels preserved, then use integer indices for internal operations
# The labels will be preserved in the DAG nodes, making them available in the adjacency matrix
DAG <- adjacency2dag(adjmat, nodes = labels)



# Validate and convert arguments
nstates_val <- as.numeric(argv$nstates)
min_val <- as.numeric(argv$min)
max_val <- as.numeric(argv$max)

collider_effect_val <- isTRUE(argv$collider_effect)
strong_effects_val <- isTRUE(argv$strong_effects)
noisy_or_val <- isTRUE(argv$noisy_or)

print("Arguments:")
print(paste("nstates:", nstates_val))
print(paste("min:", min_val))
print(paste("max:", max_val))
print(paste("collider_effect:", collider_effect_val))
print(paste("strong_effects:", strong_effects_val))
print(paste("noisy_or:", noisy_or_val))

if (is.na(nstates_val) || !is.numeric(nstates_val) || nstates_val < 2) {
  stop(paste("nstates must be a numeric value >= 2, got:", argv$nstates))
}
if (is.na(min_val) || is.na(max_val) || !is.numeric(min_val) || !is.numeric(max_val)) {
  stop(paste("min and max baseline parameters must be numeric values, got min:", argv$min, "max:", argv$max))
}

set.seed(seed_number)
# Node names should be available from the adjacency matrix column names
discBN <- generateNStatesBN(DAG, nstates = nstates_val, baseline = c(min_val, max_val), collider_effect = collider_effect_val, strong_effects = strong_effects_val, noisy_or = noisy_or_val)
# Ensure node labels are set correctly (should already be set, but just in case)
nodes(discBN$DAG) <- labels
colnames(discBN$adj) <- labels

print("discBN:")
print(discBN)   
print("nstates:")
print(discBN$nstates)

saveRDS(discBN, file = filename)
