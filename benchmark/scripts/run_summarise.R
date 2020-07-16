library(argparser)
library(BiDAG)
library(pcalg)
p <- arg_parser("A program for running iterativeMCMC and save to file.")
p <- add_argument(p, "--adjmat_true", help = "True adjacency filename")
p <- add_argument(p, "--adjmat_est", help = "Estimated adjacency matrix filename")
p <- add_argument(p, "--filename_data", help = "Dataset filename")
p <- add_argument(p, "--filename", help = "Output filename")
p <- add_argument(p,
                  "--range_header_data",
                  help = "1 if the second row of the data indicates the variable ranges",
                  default = 0)
#p <- add_argument(p, "--score_type", help = "bde/..")
p <- add_argument(p, "--bdecatpar_chi", help = "bde parameter", type = "numeric", default = 1)
p <- add_argument(p, "--bdecatpar_edgepf", help = "bde parameter", type = "numeric", default = 1)

argv <- parse_args(p)

#print(argv)

data <- NULL
if (argv$range_header_data == 1) {
  data <- read.csv(argv$filename_data, sep = " ") # this is gobnilp data
} else {
  data <- read.csv(argv$filename_data) # this is different with gobnilp data
}

n <- dim(data)[2]

true_adjmat <- as.matrix(read.csv(argv$adjmat_true))
estimated_adjmat <- as.matrix(read.csv(argv$adjmat_est))

#print(dim(data))
#print("True adjmat")
#print(true_adjmat)
#print("Estimated adjmat")
#print(estimated_adjmat)

rownames(true_adjmat) <- seq(n)
colnames(true_adjmat) <- seq(n)

rownames(estimated_adjmat) <- seq(n)
colnames(estimated_adjmat) <- seq(n)

true_dag <- adjacency2dag(true_adjmat)
estimated_dag <- adjacency2dag(estimated_adjmat)

true_cpdag <- pcalg::dag2cpdag(true_dag)
estimated_cpdag <- pcalg::dag2cpdag(estimated_dag)

true_nedges <- sum(true_adjmat)

compres <- compareDAGs(estimated_cpdag, true_cpdag)
names(compres) <- c("SHD", "TP", "FP")

#myscore_tmp <- scoreparameters(ncol(data), "bdecat", data, bdecatpar = list(chi = bdecatpar.chi, edgepf = bdecatpar.edgepf))
myscore_tmp <- scoreparameters(ncol(data), "bdecat", data,
                              bdecatpar = list(chi = argv$bdecatpar_chi,
                                               edgepf = argv$bdecatpar_edgepf))

#blipadj <- bnfit2matrix(blipfit)
#blipadj <- rearrangeMatrix(blipadj, varnames)


logscore <- DAGscore(ncol(data), myscore_tmp, estimated_adjmat) # this was bnscore, dont know why...

res <- list()
res$res <- data.frame(TPR = compres["TP"] / true_nedges, # should be for all times
                            FPRn = compres["FP"] / true_nedges,
                            logscore = logscore,
                            SHD = compres["SHD"])


write.csv(res$res, file = argv$filename, row.names = FALSE, quote = FALSE)