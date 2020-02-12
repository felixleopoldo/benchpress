library(RBGL)
source("lib/code_for_binary_simulations/blip_vs_bidag_plot.R")
source("lib/code_for_binary_simulations/summarySE.R")
library(argparser)


p <- arg_parser("A program for plotting.")
p <- add_argument(p, "--dir", help = "Directory with data")

argv <- parse_args(p)

dir <- argv$dir

# Read all files in dir
filenames <- list.files(pattern = "^(scores_)", path=dir)
scoredf <- data.frame()
for (filename in filenames) {
    tmpdf <- read.csv(file.path(dir, filename))
    scoredf <- rbind(scoredf, tmpdf)
}

filenames <- list.files(pattern = "^(ROC_)", path=dir)
ROCdf <- data.frame()
for (filename in filenames) {
   tmpdf <- read.csv(file.path(dir, filename))
   ROCdf <- rbind(ROCdf, tmpdf)
}

filenames <- list.files(pattern = "^(SHD_)", path=dir)
SHDdf <- data.frame()
for (filename in filenames) {
   tmpdf <- read.csv(file.path(dir, filename))
   SHDdf <- rbind(SHDdf, tmpdf)
}

# SHDdf <- do.call("rbind", list(SHDdf_itsearch, SHDdf_order_mcmc, SHDdf_blip))
# ROCdf <- do.call("rbind", list(ROCdf_itsearch, ROCdf_order_mcmc, ROCdf_blip))
# scoredf <- do.call("rbind", list(scoresdf_itsearch, scoresdf_order_mcmc, scoresdf_blip))

sumROCdf <- summarySE(ROCdf, "TPR", "FPRn", groupvars = c("ss", "algorithm", "threshold"))
sumROCdf$algorithm <- with(sumROCdf, factor(algorithm, levels = c("blip", "iterativeMCMC", "finalMCMC")))

# write.csv(sumROCdf, file = "sumROC.csv", row.names = FALSE)
# write.csv(scoresdf, file = "scores.csv", row.names = FALSE)
# write.csv(SHDdf, file = "SHD.csv", row.names = FALSE)
# write.csv(ROCdf, file = "ROC.csv", row.names = FALSE)


# Plotting
#sumROCdf <- read.csv("sumROC.csv")
#scoredf <- read.csv("scores.csv")
#scoredf = addScoreDiffToDataframe(scoredf)
#SHDdf <- read.csv("SHD.csv")
#ROCdf <- read.csv("ROC.csv")

setEPS()

postscript(file.path(dir, "ROC.eps"))
plot_ROC(sumROCdf)
dev.off()

#postscript(file.path(dir, "scores_shift.eps"))
#scoreShiftPlot(scoredf)
#dev.off()

#postscript(file.path(dir, "scores_boxplot.eps"))
#HorisontalBoxplot(scoredf)
#dev.off()