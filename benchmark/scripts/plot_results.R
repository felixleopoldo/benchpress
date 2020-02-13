library(RBGL)
library(ggplot2)

source("lib/code_for_binary_simulations/blip_vs_bidag_plot.R")
source("lib/code_for_binary_simulations/summarySE.R")
library(argparser)


p <- arg_parser("A program for plotting.")
p <- add_argument(p, "--directory", help = "directory with data")
p <- add_argument(p, "--roc_files", help = "ROC csv file", nargs = Inf)

argv <- parse_args(p)
print(argv)
directory <- argv$directory

# Read all files in directory
filenames <- list.files(pattern = "^(scores_)", path=directory)
scoredf <- data.frame()
for (filename in filenames) {
    tmpdf <- read.csv(file.path(directory, filename))
    scoredf <- rbind(scoredf, tmpdf)
}

ROCdf <- data.frame()
for (filename in argv$roc_files) {
   tmpdf <- read.csv(filename)
   ROCdf <- rbind(ROCdf, tmpdf)
}

filenames <- list.files(pattern = "^(SHD_)", path=directory)
SHDdf <- data.frame()
for (filename in filenames) {
   tmpdf <- read.csv(file.path(directory, filename))
   SHDdf <- rbind(SHDdf, tmpdf)
}

#sumROCdf <- summarySE(ROCdf, "TPR", "FPRn", groupvars = c("ss", "algorithm", "threshold"))
#sumROCdf$algorithm <- with(sumROCdf, factor(algorithm, levels = c("blip", "iterativeMCMC", "finalMCMC")))


sumROCdf <- summarySE(ROCdf, "TPR", "FPRn", groupvars = c("ss", "algorithm", "threshold"))
#alg_factor <- factor(sumROCdf[, "algorithm"])
#sumROCdf$algorithm <- with(sumROCdf, factor(algorithm, levels = levels(alg_factor)))

write.csv(sumROCdf, file = file.path(directory, "sumROC.csv"), row.names = FALSE)
write.csv(scoredf, file = file.path(directory, "scores.csv"), row.names = FALSE)
write.csv(ROCdf, file = file.path(directory, "ROC.csv"), row.names = FALSE)
write.csv(SHDdf, file = file.path(directory, "SHD.csv"), row.names = FALSE)

# Plotting

setEPS()
postscript(file.path(directory, "ROC.eps"))
ggplot(data = sumROCdf, aes(x = FPRn, y = TPR, group = threshold, col = algorithm)) +
geom_errorbar(aes(ymin = q1, ymax = q3, col = algorithm), width = 1) +
geom_path(aes(group = algorithm, col = algorithm)) +
geom_point(aes(group = algorithm, col = algorithm, shape = algorithm), size = 2) +
xlim(c(0, 1)) + ylim(c(0, 1)) +
#scale_shape_manual(labels = levels(alg_factor), values = c(5, 3, 15)) +
#scale_size_manual(labels = levels(alg_factor), values = c(3, 1, 1)) +
#scale_colour_manual(labels = levels(alg_factor), values = c("#4daf4a", "red", "purple")) +

ggtitle("ROC")
dev.off()

#postscript(file.path(directory, "scores_shift.eps"))
#scoreShiftPlot(scoredf)
#dev.off()

#postscript(file.path(directory, "scores_boxplot.eps"))
#HorisontalBoxplot(scoredf)
#dev.off()