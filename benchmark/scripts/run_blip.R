## Simulate rblip
##

library(argparser)

library(RBGL)
library(r.blip)
source("lib/code_for_binary_simulations/rblip.R")
source("lib/code_for_binary_simulations/df_fns.R")
source("lib/code_for_binary_simulations/algorithm_wrappers.R")

p <- arg_parser("A program for running r.blip and save to file.")

p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
p <- add_argument(p, "--filename_dag", help = "DAGs filename")
p <- add_argument(p, "--filename", help = "Output filename")
p <- add_argument(p, "--filename_data", help = "Dataset filename")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)

p <- add_argument(p, "--time", help = "Blip max time", type = "numeric")
p <- add_argument(p, "--scorer.method", help="scorer.method", default = "is")
p <- add_argument(p, "--solver.method", help="solver.method", default = "winasobs")
p <- add_argument(p, "--indeg", help="max in degree", type = "numeric", default = 6)
p <- add_argument(p, "--cores", help="cores", type = "numeric", default = 1)
p <- add_argument(p, "--allocated", help="allocated", type = "numeric", default = 80)
p <- add_argument(p, "--scorefunction", help="score function", default = "bic")
p <- add_argument(p, "--alpha", help="alpha", type = "numeric", default = 1.0)
p <- add_argument(p, "--verbose", help="see r.blip doc", type = "numeric", default = 0)
p <- add_argument(p, "--bdecatpar.chi", help="see r.blip doc", type = "numeric", default = 1)
p <- add_argument(p, "--bdecatpar.edgepf", help="see r.blip doc", type = "numeric", default = 1)

argv <- parse_args(p)

directory <- argv$output_dir
dir.create(directory)
filename <- file.path(argv$filename)
filename_dag <- argv$filename_dag   
filename_data <- argv$filename_data

dag <- readRDS(filename_dag)
data <- read.csv(filename_data)
seed <- argv$seed
set.seed(seed)

blip <- runBlip(data, dag, time=argv$time, 
                           scorer.method=argv$scorer.method,
                           solver.method=argv$solver.method,
                           indeg=argv$indeg,
                           cores=argv$cores,
                           allocated=argv$allocated,
                           scorefunction=argv$scorefunction,
                           alpha=argv$alpha,
                           verbose=argv$verbose,
                           bdecatpar.chi=argv$bdecatpar.chi,
                           bdecatpar.edgepf=argv$bdecatpar.edgepf
                           )
write.csv(blip, file = filename, row.names = FALSE)

