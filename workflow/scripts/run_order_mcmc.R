library(argparser)
library(BiDAG)
library(rjson)

p <- arg_parser("A program for running porder MCMC and save results to file.")
p <- add_argument(p, "--filename",      help = "Filename")
p <- add_argument(p, "--filename_startspace", help = "Start space")
p <- add_argument(p, "--output_dir",    help = "Output directory", default = ".")
p <- add_argument(p, "--filename_data", help = "Dataset filename")
p <- add_argument(p, "--seed",          help = "Random seed", type = "numeric", default = 1)
p <- add_argument(p, "--plus1",         help = "Search space expansion", type = "numeric", default = 1)
p <- add_argument(p, "--chi",           help = "score parameter")
p <- add_argument(p, "--edgepf",        help = "score parameter")
p <- add_argument(p, "--am",            help = "score parameter")
p <- add_argument(p, "--aw",            help = "score parameter")
p <- add_argument(p, "--scoretype",     help = "score parameter")

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
chi <- NULL
if (argv$chi != "None") {
  chi <- as.numeric(argv$chi)
}

edgepf <- NULL
if (argv$edgepf != "None") {
  edgepf <- as.numeric(argv$edgepf)
}

aw <- NULL
if (argv$aw != "None") {
  aw <- as.numeric(argv$aw)
}

am <- NULL
if (argv$am != "None") {
  am <- as.numeric(argv$am)
}

if(argv$scoretype == "bdecat"){
    myscore <- scoreparameters(dim(data)[2], "bdecat", data, bdecatpar = list(chi = chi,
                            edgepf = edgepf))
} 
if(argv$scoretype == "bde"){
    myscore <- scoreparameters(dim(data)[2], "bde", data, bdepar = list(chi = chi,
                                                                        edgepf = edgepf))
} 
if(argv$scoretype == "bge"){
    myscore <- scoreparameters(dim(data)[2], "bge", data, bgepar = list(am = am,
                                                                        aw = aw))
}

#myscore <- scoreparameters(dim(data)[2], "bdecat", data,
#                            bdepar = list(chi = argv$bdecatpar_chi,
#                            edgepf = argv$bdecatpar_edgepf))

order_mcmc_res <- orderMCMC(dim(data)[2], myscore,
                              startspace = startspace,
                              plus1 = argv$plus1 && TRUE,
                              MAP = FALSE,
                              chainout = TRUE,
                              scoreout = TRUE)

endspace <- order_mcmc_res$space$adjacency # This might not be what we want


# This returns a string which is a list of flattened adjacency matrices.
adjvecliststr <- rjson::toJSON(order_mcmc_res$chain$incidence)

write(adjvecliststr, file = filename)



