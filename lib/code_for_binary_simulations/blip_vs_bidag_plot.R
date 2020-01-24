# ROC
library(gridExtra)
library(grid)
library(ggplot2)
#library(lattice)
# Code from http://rpubs.com/sjackman/grid_arrange_shared_legend
# grid_arrange_shared_legend <- function(...) {
#   plots <- list(...)
#   g <- ggplotGrob(plots[[1]] + theme(legend.position="bottom"))$grobs
#   legend <- g[[which(sapply(g, function(x) x$name) == "guide-box")]]
#   lheight <- sum(legend$height)
#   grid.arrange(
#     do.call(arrangeGrob, lapply(plots, function(x)
#       x + theme(legend.position="none"))),
#     legend,
#     ncol = 1,
#     heights = unit.c(unit(1, "npc") - lheight, lheight))
# }
grid_arrange_shared_legend <- function(..., ncol = length(list(...)), nrow = 1, position = c("bottom", "right")) {

  plots <- list(...)
  position <- match.arg(position)
  g <- ggplotGrob(plots[[1]] + theme(legend.position = position))$grobs
  legend <- g[[which(sapply(g, function(x) x$name) == "guide-box")]]
  lheight <- sum(legend$height)
  lwidth <- sum(legend$width)
  gl <- lapply(plots, function(x) x + theme(legend.position="none"))
  gl <- c(gl, ncol = ncol, nrow = nrow)

  combined <- switch(position,
                     "bottom" = arrangeGrob(do.call(arrangeGrob, gl),
                                            legend,
                                            ncol = 1,
                                            heights = unit.c(unit(1, "npc") - lheight, lheight)),
                     "right" = arrangeGrob(do.call(arrangeGrob, gl),
                                           legend,
                                           ncol = 2,
                                           widths = unit.c(unit(1, "npc") - lwidth, lwidth)))

  grid.newpage()
  grid.draw(combined)

  # return gtable invisibly
  invisible(combined)
}


sumROCdf.blip$algorithm <- with(sumROCdf.blip, factor(algorithm, levels = c("blip", "iterativeMCMC", "finalMCMC")))

width.er <- 2 # Added by Felix

p1 <- ggplot(data = subset(sumROCdf.blip[order(sumROCdf.blip$threshold), ], ss == 10), aes(x = FPRn, y = TPR, group = threshold, col = algorithm)) +
  geom_errorbar(aes(ymin = q1, ymax = q3, col = algorithm), width = width.er) +
  geom_path(aes(group = algorithm, col = algorithm)) +
  geom_point(aes(group = algorithm, col = algorithm, shape = algorithm), size = 2) +
  xlim(c(-width.er, 0.3 + width.er)) + ylim(c(0, 1)) +
  scale_shape_manual(labels = c("r.blip", "MAP MCMC", "sample MCMC"), values = c(5, 3, 15)) +
  scale_size_manual(labels = c("r.blip", "MAP MCMC", "sample MCMC"), values = c(3, 1, 1)) +
  scale_colour_manual(labels = c("r.blip", "MAP MCMC", "sample MCMC"), values = c("#4daf4a", "red", "purple")) +
  ggtitle("n=100, sample size 10n")
p2 <- ggplot(data = subset(sumROCdf.blip[order(sumROCdf.blip$threshold), ], ss == 2), aes(x = FPRn, y = TPR, group = threshold, col = algorithm)) +
  geom_errorbar(aes(ymin = q1, ymax = q3, col = algorithm), width = width.er) +
  geom_path(aes(group = algorithm, col = algorithm)) +
  geom_point(aes(group = algorithm, col = algorithm, shape = algorithm), size = 2) +
  xlim(c(-width.er, 0.9 + width.er)) + ylim(c(0, 1)) +
  scale_shape_manual(labels = c("r.blip", "MAP MCMC", "sample MCMC"), values = c(5, 3, 15)) +
  scale_size_manual(labels = c("r.blip", "MAP MCMC", "sample MCMC"), values = c(3, 1, 1)) +
  scale_colour_manual(labels = c("r.blip", "MAP MCMC", "sample MCMC"), values = c("#4daf4a", "red", "purple")) +
  ggtitle("n=100, sample size 2n")

grid_arrange_shared_legend(p1, p2, ncol = 2, nrow = 1, position = "bottom")

pdf(file = "ROCbidagvsblip.pdf", width = 6, height = 3, onefile = FALSE)

grid_arrange_shared_legend(p1, p2, ncol = 2, nrow = 1, position = "bottom")

dev.off()


scoredf.blip <- cbind(scoredf.blip, 0)
colnames(scoredf.blip)[6] <- "shift"
scoredf.blip <- cbind(scoredf.blip, 0)
colnames(scoredf.blip)[7] <- "shiftBLIP"

for (i in unique(scoredf.blip$replicate)) {
  rowns <- which(scoredf.blip$ss == 2 & scoredf.blip$replicate == i)
  truescore <- scoredf.blip$logscore[rowns[2]]
  scoredf.blip$shift[rowns] <- scoredf.blip$logscore[rowns] - truescore
  rowns <- which(scoredf.blip$ss == 10 & scoredf.blip$replicate == i)
  truescore <- scoredf.blip$logscore[rowns[2]]
  scoredf.blip$shift[rowns] <- scoredf.blip$logscore[rowns] - truescore
}

for (i in unique(scoredf.blip$replicate)) {
  rowns <- which(scoredf.blip$ss == 2 & scoredf.blip$replicate == i)
  truescore <- scoredf.blip$logscore[rowns[1]]
  scoredf.blip$shiftBLIP[rowns] <- scoredf.blip$logscore[rowns] - truescore
  rowns <- which(scoredf.blip$ss == 10 & scoredf.blip$replicate == i)
  truescore <- scoredf.blip$logscore[rowns[1]]
  scoredf.blip$shiftBLIP[rowns] <- scoredf.blip$logscore[rowns] - truescore
}

subset(subset(scoredf.blip, ss == 2), replicate == 1)
boxplot(shift ~ algo, subset(scoredf.blip, ss == 2))
col2 <- c("#d7b5d8", "#df65b0")
boxplot(shiftBLIP ~ ss, subset(scoredf.blip, algo == "MAP PC"),
  col = col2, names = c("2n", "10n"), ylab = "sample size",
  xlab = "difference in score (BiDAG-r.blip)", horizontal = TRUE
)
abline(v = 0, lty = 2, col = "grey")
pdf(file = "scoreshiftblip.pdf", width = 6, height = 3, onefile = FALSE)
boxplot(shiftBLIP ~ ss, subset(scoredf.blip, algo == "MAP PC"),
  col = col2, names = c("2n", "10n"), ylab = "sample size",
  xlab = "difference in score (BiDAG-r.blip)", horizontal = TRUE
)
abline(v = 0, lty = 2, col = "grey")
dev.off()


boxplot(shiftBLIP ~ algo + ss, subset(subset(scoredf.blip, ss == 10), algo == "MAP PC"))
boxplot(shiftBLIP ~ algo + ss, subset(subset(scoredf.blip, ss == 2), algo == "MAP PC"))

scoredf.blip <- subset(scoredf.blip, algo %in% c("MAP PC", "final MCMC", "blip"))
scoredf.blip$algorithm <- scoredf.blip$algo
scoredf.blip$algorithm <- with(scoredf.blip, factor(algorithm, levels = c("MAP MCMC", "sample MCMC")))
scoredf.blip$ss <- as.factor(scoredf.blip$ss)
p1 <- ggplot(
  data = subset(scoredf.blip, algo == "MAP PC"),
  aes(x = ss, y = shiftBLIP, group = ss)
) +
  geom_boxplot(aes(fill = ss))

pdf(file = "SCOREbidagvsblip.pdf", width = 6, height = 3, onefile = FALSE)

grid_arrange_shared_legend(p1, p2, ncol = 2, nrow = 1, position = "bottom")

dev.off()

# SHD
SHDdf.blip <- subset(SHDdf.blip, algorithm %in% c("MAP PC", "finalMCMC", "blip"))
SHDdf.blip$algorithm <- with(SHDdf.blip, factor(algorithm, levels = c("MAP PC", "finalMCMC", "blip")))
unique(SHDdf.blip$algorithm)

p1 <- ggplot(
  data = subset(SHDdf.blip, ss == 10),
  aes(x = algorithm, y = SHD, col = algorithm)
) +
  geom_boxplot(aes(fill = algorithm)) + ggtitle("n=100, N=10n")

p2 <- ggplot(
  data = subset(SHDdf.blip, ss == 2),
  aes(x = algorithm, y = SHD, col = algorithm)
) +
  geom_boxplot(aes(fill = algorithm)) + ggtitle("n=100,N=2n")

grid_arrange_shared_legend(p1, p2, ncol = 2, nrow = 1, position = "bottom")


scale_fill_manual(
  labels = c("BiDAG MAP", "BiDAG sample", "r.blip"),
  values = c("red", "purple", "orange")
) +
  scale_color_manual(
    labels = c("BiDAG MAP", "BiDAG sample", "r.blip"),
    values = c("#fb8072", "#bebada", "#fdb863")
  ) +
  scale_x_discrete(labels = c("BiDAG MAP", "BiDAG sample", "r.blip")) +
  ylim(c(0, 200)) + ggtitle("n=100, sample size 10n")


scale_fill_manual(
  labels = c("BiDAG MAP", "BiDAG sample", "r.blip"),
  values = c("red", "purple", "orange")
) +
  scale_color_manual(
    labels = c("BiDAG MAP", "BiDAG sample", "r.blip"),
    values = c("#fb8072", "#bebada", "#fdb863")
  ) +
  scale_x_discrete(labels = c("BiDAG MAP", "BiDAG sample", "r.blip")) +
  ylim(c(0, 300))

grid_arrange_shared_legend(p1, p2, ncol = 2, nrow = 1, position = "bottom")

# ROC
for (i in 1:simlength) {
  ROCdf.blip <- ROCdf.add(newrep = BiDAGbin[[i]], ROCdf = ROCdf.blip, algo = "MCMC", repl = 1)
}

summaryROCdf <- summarySE(ROCdf.blip, "TPR", "FPRn", groupvars = c("ss", "algorithm", "threshold"))
summaryROCdf$algorithm <- with(summaryROCdf, factor(algorithm, levels = c("iterativeMCMC", "finalMCMC", "blip")))

