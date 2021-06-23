library(argparser)
library(bnlearn)
source("resources/binarydatagen/generatebinaryBNf.r")

p <- arg_parser("A program for sampling dat from a binary Bayesian network and save to file.")
p <- add_argument(p, "--filename", help = "output filename", default = "data.csv")
p <- add_argument(p, "--filename_bn", help = "Bayesian network filename", default = "bn.rds")
p <- add_argument(p, "--samples", help = "Sample size", type = "numeric")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)
argv <- parse_args(p)

filename <- file.path(argv$filename)
filename_bn <- argv$filename_bn
seed <- argv$seed

bn <- readRDS(filename_bn)
samples <- argv$samples

set.seed(seed)
data <- rbn(bn, n = samples)
data <- data.matrix(data) - 1 # Since starting from 1 otherwise

# Range headers if discrete nodes
if ("bn.fit.dnet" %in% class(bn)) {
  header <- c()
  for (i in seq(length(nodes(bn)))) {
    header[i] <- dim(bn[[i]][["prob"]])[1]
  }
  data <- data.frame(rbind(header, data))
}

write.table(data, file = filename, row.names = FALSE, quote = FALSE, col.names = TRUE, sep = ",")