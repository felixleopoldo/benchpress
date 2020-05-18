library(argparser)

source("lib/code_for_binary_simulations/algorithm_wrappers.R")

p <- arg_parser("A program for running porder MCMC and save results to file.")
p <- add_argument(p, "--filename", help = "Filename") 
p <- add_argument(p, "--filename_startspace", help = "Start space")
p <- add_argument(p, "--output_dir", help = "Output directory", default = ".")
p <- add_argument(p, "--filename_dag", help = "DAGs filename") # This should not be here
p <- add_argument(p, "--filename_data", help = "Dataset filename")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)

argv <- parse_args(p)
directory <- argv$output_dir
filename <- file.path(argv$filename)
seed <- argv$seed

set.seed(seed)
dag <- readRDS(argv$filename_dag)
data <- read.csv(argv$filename_data)
startspace <- readRDS(argv$filename_startspace)

#start_space_name = basename(argv$filename_startspace)
#start_space_name = tools::file_path_sans_ext(argv$filename_startspace)
startspace_name = sub(pattern = "(.*)\\..*$", replacement = "\\1", basename(argv$filename_startspace))

# append filename of startspace to the titles
order_mcmc_sample <- runOrderMCMC(data, dag, startspace)
write.csv(order_mcmc_sample, file = filename, row.names = FALSE)