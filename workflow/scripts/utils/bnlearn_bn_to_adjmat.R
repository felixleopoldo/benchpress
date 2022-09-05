# Extracts the graph (as adjacency matrix) from a bn.fit network

library(argparser)
library(bnlearn)
source("resources/binarydatagen/generatebinaryBNf.r")

p <- arg_parser("Sampling dat from a binary Bayesian network and save to file.")
p <- add_argument(p, "--filename_graph",
  help = "Output graph filename", default = "data.csv"
)
p <- add_argument(p, "--filename_bn",
  help = "Bayesian network filename", default = "bn.rds"
)
argv <- parse_args(p)

bn_net <- readRDS(argv$filename_bn)
bn_net_gnel <- as.graphNEL(bn_net)
adjmat <- as(bn_net_gnel, "matrix")
write.csv(adjmat, file = argv$filename_graph, row.names = FALSE, quote = FALSE)
