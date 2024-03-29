# Converts a graph in TETRAD (causal-cmd 1.10.0) format into an adjacency matrix.

library(argparser)
library(rjson)

p <- arg_parser("A program for generating a Tetrad graph to JSON.")
p <- add_argument(p, "--jsongraph", help = "Tetrad graph in json format")
p <- add_argument(p, "--filename", help = "Output filename")
argv <- parse_args(p)

fges_result_to_matrix <- function(graph) {
  nodes <- c()
  for (node in graph$nodes) {
    nodes <- c(nodes, node$name)
  }

  p <- length(nodes)
  m <- matrix(0, p, p)

  for (e in graph$edgesSet) {
    node1 <- e$node1$name

    node2 <- e$node2$name
    node1_ind <- match(node1, nodes) # TODO: This might not always work..
    node2_ind <- match(node2, nodes)

    # Uncertain edges (CIRCLE endpoints) are recognized as undirected.
    isdirected1to2 <- (e$endpoint1 == "TAIL") && (e$endpoint2 == "ARROW")
    isdirected2to1 <- (e$endpoint1 == "ARROW") && (e$endpoint2 == "TAIL")

    if (isdirected1to2) {
      m[node1_ind, node2_ind] <- 1
    } else if (isdirected2to1) {
      m[node2_ind, node1_ind] <- 1
    } else {
      m[node1_ind, node2_ind] <- 1
      m[node2_ind, node1_ind] <- 1
    }
  }
  colnames(m) <- nodes
  return(m)
}
graph <- fromJSON(file = argv$jsongraph)
adjmat <- fges_result_to_matrix(graph)
write.csv(adjmat, file = argv$filename, row.names = FALSE, quote = FALSE)
