library(argparser)
library(pcalg)
library(bnlearn)
library(RBGL)

source("resources/code_for_binary_simulations/make_var_names.R")


p <- arg_parser("A program for running hill-climbing algorithm and save to file.")

p <- add_argument(p, "--filename", help = "output filename")
p <- add_argument(p, "--output_dir", help = "output dir", default = ".")
p <- add_argument(p, "--filename_data", help = "Dataset filename")
p <- add_argument(p, "--seed", help = "Random seed", type = "numeric", default = 1)
p <- add_argument(p, "--restart", help = "HC parameter", type = "numeric", default=0)
p <- add_argument(p, "--perturb", help = "HC parameter", type = "numeric", default=1)
p <- add_argument(p, "--score", help = "parameter")
p <- add_argument(p, "--iss", help = "Score parameter", type="numeric")
p <- add_argument(p, "--iss.mu", help = "Score parameter", type="numeric")
p <- add_argument(p, "--l", help = "Score parameter", type="numeric")
p <- add_argument(p, "--k", help = "Score parameter", type="numeric")
p <- add_argument(p, "--prior", help = "Score parameter")
p <- add_argument(p, "--beta", help = "Score parameter", type="numeric")

argv <- parse_args(p)


filename <- file.path(argv$filename)
filename_data <- argv$filename_data
seed <- argv$seed

data <- read.csv(filename_data,  check.names=FALSE)
names <-names(data)
if (argv$score %in% c("bde", "bic")){
    data <- data[-1,] # Remove range header
    data <- matrixToDataframe(data, names)
}
set.seed(seed)


output <- hc(data, 
            restart=argv$restart,
            perturb=argv$perturb,
            score=argv$score, 
            iss=argv$iss,
            iss.mu=argv$iss.mu,
            l=argv$l,
            k=argv$k,
            prior=argv$prior,
            beta=argv$beta
            )
## convert to graphneldag
gnel_dag <- as.graphNEL(output)

adjmat <- as(gnel_dag, "matrix")
colnames(adjmat) <- names

write.csv(adjmat, file = filename, row.names = FALSE, quote = FALSE)
