# Sample data
# This yold take as input
# structuralprior, structuralpriorparams, hyperprior, hyperpriorparams, nsamples
# the info might be stoed in the same table as tha data or linked to it in a
# database so that simulation results could be reproduce.
# it could also just take dag and params, i.e. graphical model as input.
#
# I think everything solves if all dags, paramets, data has ids which are
# connected to how they were generated.

library(argparser)
library(bnlearn)
source("lib/binarydatagen/generatebinaryBNf.r")

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
data <- rbn(bn, n=samples)
data <- data.matrix(data)-1 # Since starting from 1 otherwise

# Range headers
header <- c()
for (i in seq(length(nodes(bn)))) {
    header[i] <- dim(bn[[i]][["prob"]])[1]
}

data <- data.frame(rbind(header, data))

#write.csv(data, file = filename, row.names = FALSE,)
write.table(data, file = filename, row.names = FALSE, quote = FALSE, col.names=TRUE)