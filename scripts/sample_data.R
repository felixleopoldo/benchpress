# Sample data
#
library(argparser)

source("lib/binarydatagen/generatebinaryBNf.r")

p <- arg_parser("A program for running r.blip and save to file.")

p <- add_argument(p, "--filename", help = "output filename")
p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
p <- add_argument(p, "--filename_bn", help = "Bayesian networks filename", default = "bns.rds")
p <- add_argument(p, "--samples", help = "Sample size", type = "numeric")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)

argv <- parse_args(p)

dir <- argv$output_dir
filename <- file.path(dir, argv$filename)
filename_bn <- argv$filename_bn

bns <- readRDS(filename_bn)
samples <- argv$samples
n_datasets <- length(bns)


bindata <- list()
for (i in seq(n_datasets)) {
  bn <- bns[[i]]
  n = numNodes(bn$DAG)
  bindata[[i]] <- generatebinaryBN.data(n = n, binaryBN = bn, samplesize = samples)
  # write.csv(bindata[[i]], paste("data", i, ".csv", sep = ""), row.names = FALSE)
}
saveRDS(bindata, file = filename)