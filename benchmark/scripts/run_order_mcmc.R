library(argparser)
library(BiDAG)

#source("lib/code_for_binary_simulations/algorithm_wrappers.R")

p <- arg_parser("A program for running porder MCMC and save results to file.")
p <- add_argument(p, "--filename", help = "Filename")
p <- add_argument(p, "--filename_startspace", help = "Start space")
p <- add_argument(p, "--output_dir", help = "Output directory", default = ".")
#p <- add_argument(p, "--filename_dag", help = "DAGs filename") # This should not be here
p <- add_argument(p, "--filename_data", help = "Dataset filename")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)
p <- add_argument(p, "--plus1", help = "Search space expansion", type = "numeric", default = 1)
p <- add_argument(p, "--bdecatpar_chi", help = "bde parameter", type = "numeric", default = 1)
p <- add_argument(p, "--bdecatpar_edgepf", help = "bde parameter", type = "numeric", default = 1)

argv <- parse_args(p)
directory <- argv$output_dir
filename <- file.path(argv$filename)
seed <- argv$seed

set.seed(seed)
data <- read.csv(argv$filename_data, sep=" ")
data <- data[-1,] # Remove range header
startspace <- read.csv(argv$filename_startspace)
rownames(startspace) <- seq(dim(data)[2])
colnames(startspace) <- seq(dim(data)[2])

#startspace_graph <- adjacency2dag(startspace)

#print(startspace_graph)
#start_space_name = basename(argv$filename_startspace)
#start_space_name = tools::file_path_sans_ext(argv$filename_startspace)
#startspace_name = sub(pattern = "(.*)\\..*$", replacement = "\\1", basename(argv$filename_startspace))

# append filename of startspace to the titles

myscore <- scoreparameters(dim(data)[2], "bde", data,
                            bdepar = list(chi = argv$bdecatpar_chi,
                            edgepf = argv$bdecatpar_edgepf))

order_mcmc_res <- orderMCMC(dim(data)[2], myscore,
                              startspace = startspace,
                              plus1 = argv$plus1 && TRUE,
                              MAP = FALSE,
                              chainout = TRUE,
                              scoreout = TRUE)

#order_mcmc_sample <- runOrderMCMC(data, dag, myscore,
#                                  startspace = startspace,
#                                  plus1 = argv$plus1 && TRUE,
#                                  MAP = FALSE,
#                                  chainout = TRUE
#                                  )

#print(order_mcmc_res)
endspace <- order_mcmc_res$space$adjacency # This might not be what we want
#print(endspace)

#DAG05 <- dag.threshold(dim(data)[2], order_mcmc_res$chain$incidence, pbarrier = 0.5, pdag = FALSE, burnin = 0.5)

#library(jsonlite)
#jsontraj <- jsonlite::toJSON(order_mcmc_res$chain$incidence, pretty = TRUE)
#write(jsontraj, filename)

library(rjson)
# This returns a string which is a list of flattened adjacency matrices.
adjvecliststr <- rjson::toJSON(order_mcmc_res$chain$incidence)

write(adjvecliststr, file = filename)




#print(order_mcmc_res$chain$incidence)
#print(is(order_mcmc_res$chain$incidence))

# This should probably return a trajectory of graphs instead of a single one.
# Convert it to eg json and save.
# The estimation can be done using another script.

# sample.check(dim(data)[2], order_mcmc_res$chain$incidence, DAG, pdag = TRUE, pbarrier = c(0.99, 0.95, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2))

#rownames(endspace) <- seq(dim(data)[2])
#colnames(endspace) <- seq(dim(data)[2])
#print(is(endspace))
#print(endspace)


#write.csv(endspace, file = filename, row.names = FALSE, quote = FALSE)

#write.csv(order_mcmc_sample, file = filename, row.names = FALSE, )
