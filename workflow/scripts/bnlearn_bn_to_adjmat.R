library(argparser)
library(bnlearn)
source("resources/binarydatagen/generatebinaryBNf.r")

p <- arg_parser("A program for sampling dat from a binary Bayesian network and save to file.")

p <- add_argument(p, "--filename_graph", help = "Output graph filename", default = "data.csv")
p <- add_argument(p, "--filename_bn", help = "Bayesian network filename", default = "bn.rds")
argv <- parse_args(p)

bn_net <- readRDS(argv$filename_bn)
bn_net_gnel <- as.graphNEL(bn_net)
adjmat <- as(bn_net_gnel, "matrix")
write.csv(adjmat, file = argv$filename_graph, row.names = FALSE, quote = FALSE)


# for (file in list.files("resources/bn/bn.fit_networks")){
#     print(file)
#     noext <- tools::file_path_sans_ext(file)
#     print(noext)
#    bn_net <- readRDS(paste("resources/bn/bn.fit_networks/",noext,".rds", sep=""))
# bn_net_gnel <- as.graphNEL(bn_net)
# adjmat <- as(bn_net_gnel, "matrix")
# write.csv(adjmat, file = paste("resources/adjmat/myadjmats/",noext,".csv",sep=""), row.names = FALSE, quote = FALSE) 
# }