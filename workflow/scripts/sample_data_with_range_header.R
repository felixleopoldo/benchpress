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

source("resources/binarydatagen/generatebinaryBNf.r")

p <- arg_parser("A program for sampling data from a binary Bayesian network and save to file.")

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

n = numNodes(bn$DAG)
set.seed(seed)
bindata <- generatebinaryBN.data(n = n, binaryBN = bn, samplesize = samples)

myrow <- rep(2, n)
bindata_range_header <- data.frame(rbind(myrow, as.matrix(bindata)))

colnames(bindata_range_header) <- seq(n)
write.table(bindata_range_header, file = filename, row.names = FALSE, quote = FALSE, col.names=TRUE, sep=",")

