library(RBGL)
library(ggplot2)
library(argparser)

source("lib/code_for_binary_simulations/blip_vs_bidag_plot.R")
source("lib/code_for_binary_simulations/summarySE.R")

p <- arg_parser("A program for plotting.")
p <- add_argument(p, "--directory", help = "directory with data")
p <- add_argument(p, "--roc_files_blip", help = "ROC csv files", nargs = Inf)
p <- add_argument(p, "--roc_files_itsearch_map", help = "ROC csv files", nargs = Inf)
p <- add_argument(p, "--roc_files_itsearch_sample", help = "ROC csv files", nargs = Inf)
p <- add_argument(p, "--roc_files_order_mcmc_sample", help = "ROC csv files", nargs = Inf)
p <- add_argument(p, "--roc_files_order_mcmc_map", help = "ROC csv files", nargs = Inf)
p <- add_argument(p, "--roc_files_pcalg", help = "ROC csv files", nargs = Inf)

argv <- parse_args(p)

directory <- argv$directory

filenames <- list.files(pattern = "^(ROC_)", path = directory)

ROCdf <- data.frame()
for (filename in filenames) {
  tmpdf <- read.csv(file.path(directory, filename))
  ROCdf <- dplyr::bind_rows(ROCdf, tmpdf)
}

# Summarizes TPR over iterations as quantiles an saves mean TPR as TPR
sumROCdf <- summarySE(ROCdf, "TPR",
                      othervars = "FPRn",
                      groupvars = c("ss", "algorithm", "threshold"),
                      na.rm =TRUE)

write.csv(ROCdf, file = file.path(directory, "ROC.csv"), row.names = FALSE)

setEPS()
postscript(file.path(directory, "ROC.eps"))


if (length(argv$roc_files_blip) > 1 && !is.na(argv$roc_files_blip)) {
  ROCdf_blip <- data.frame()
  for (filename in argv$roc_files_blip) {
    tmpdf <- read.csv(filename)
    ROCdf_blip <- dplyr::bind_rows(ROCdf_blip, tmpdf) # jon df with different columns
  }
  geom_blip = geom_point(data = ROCdf_blip, aes(FPRn, TPR), colour = 'red', size = 3)
}

dev.off()
