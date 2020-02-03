# Samples dags and saves to file
library(argparser)

source("lib/binarydatagen/generatebinaryBNf.r")

p <- arg_parser("A program for generating a random directed acyclig graph.")

p <- add_argument(p, "--filename", help = "output filename", default = "bns.rds")
p <- add_argument(p, "--input_filename", help = "Filename for DAGs", default = "dags.rds")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric")
p <- add_argument(p, "--output_dir", help = "output dir", default = ".")

argv <- parse_args(p)

dir <- argv$output_dir
filename <- file.path(dir, argv$filename)
seed_number <- argv$seed
filename_dags <- argv$input_filename

DAGs <- readRDS(filename_dags)

n_datasets <- length(DAGs)
binBNs <- list()
for (i in seq(n_datasets)) {
    binBNs[[i]] <- generateBinaryBN(DAGs[[i]], c(0.1, 0.9))
}

saveRDS(binBNs, file = filename)

