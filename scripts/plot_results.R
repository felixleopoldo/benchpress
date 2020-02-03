library(argparser)
library(RBGL)
source("lib/code_for_binary_simulations/blip_vs_bidag_plot.R")


# Plotting

sumROCdf <- read.csv("sumROC.csv")
scoredf <- read.csv("scores.csv")
scoredf = addScoreDiffToDataframe(scoredf)
SHDdf <- read.csv("SHD.csv")
ROCdf <- read.csv("ROC.csv")

setEPS()
postscript("ROC.eps")
plot_ROC(sumROCdf)
dev.off()

postscript("scores_shift.eps")
scoreShiftPlot(scoredf) # working properly

dev.off()
postscript("scores_boxplot.pdf")
HorisontalBoxplot(scoredf) # not working
dev.off()