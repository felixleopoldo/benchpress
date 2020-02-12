# ROC
library(gridExtra)
library(grid)
library(ggplot2)

# Code from http://rpubs.com/sjackman/grid_arrange_shared_legend
grid_arrange_shared_legend <- function(..., ncol = length(list(...)), nrow = 1, position = c("bottom", "right")) {

  plots <- list(...)
  position <- match.arg(position)
  g <- ggplotGrob(plots[[1]] + theme(legend.position = position))$grobs
  legend <- g[[which(sapply(g, function(x) x$name) == "guide-box")]]
  lheight <- sum(legend$height)
  lwidth <- sum(legend$width)
  gl <- lapply(plots, function(x) x + theme(legend.position = "none"))
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

# Plotting ROC curves
plot_ROC <- function(data, title=""){
  width.er <- 1 # Added by Felix
  #p1 <-
  ggplot(data = data, aes(x = FPRn, y = TPR, group = threshold, col = algorithm)) +
  geom_errorbar(aes(ymin = q1, ymax = q3, col = algorithm), width = width.er) +
  geom_path(aes(group = algorithm, col = algorithm)) +
  geom_point(aes(group = algorithm, col = algorithm, shape = algorithm), size = 2) +
  xlim(c(0, 1)) + ylim(c(0, 1)) +
  #xlim(c(0, 0.3 + width.er)) + ylim(c(0, 1)) +
  scale_shape_manual(labels = c("r.blip", "MAP MCMC", "sample MCMC"), values = c(5, 3, 15)) +
  scale_size_manual(labels = c("r.blip", "MAP MCMC", "sample MCMC"), values = c(3, 1, 1)) +
  scale_colour_manual(labels = c("r.blip", "MAP MCMC", "sample MCMC"), values = c("#4daf4a", "red", "purple")) +
  ggtitle(title)

  # p2 <- ggplot(data = subset(sumROCdf[order(sumROCdf$threshold), ], ss == 2), aes(x = FPRn, y = TPR, group = threshold, col = algorithm)) +
  #   geom_errorbar(aes(ymin = q1, ymax = q3, col = algorithm), width = width.er) +
  #   geom_path(aes(group = algorithm, col = algorithm)) +
  #   geom_point(aes(group = algorithm, col = algorithm, shape = algorithm), size = 2) +
  #   xlim(c(0, 0.9 + width.er)) + ylim(c(0, 1)) +
  #   scale_shape_manual(labels = c("r.blip", "MAP MCMC", "sample MCMC"), values = c(5, 3, 15)) +
  #   scale_size_manual(labels = c("r.blip", "MAP MCMC", "sample MCMC"), values = c(3, 1, 1)) +
  #   scale_colour_manual(labels = c("r.blip", "MAP MCMC", "sample MCMC"), values = c("#4daf4a", "red", "purple")) +
  #   ggtitle("n=100, sample size 2n")


  #grid_arrange_shared_legend(p1, p2, ncol = 2, nrow = 1, position = "bottom")
}

#
# Plotting shift (The difference in score between the sampled and the true graph)
#
scoreShiftPlot <- function(scoredf) {
  #subset(subset(scoredf, ss == 2), replicate == 1)
  boxplot(shift ~ algo, subset(scoredf, ss == 2))
}

addScoreDiffToDataframe <- function(scoredf){
  scoredf <- cbind(scoredf, 0)
  colnames(scoredf)[6] <- "shift"
  scoredf <- cbind(scoredf, 0)
  colnames(scoredf)[7] <- "shiftBLIP"

  for (i in unique(scoredf$replicate)) {
    rowns <- which(scoredf$ss == 2 & scoredf$replicate == i)
    truescore <- scoredf$logscore[rowns[2]]
    scoredf$shift[rowns] <- scoredf$logscore[rowns] - truescore
    rowns <- which(scoredf$ss == 10 & scoredf$replicate == i)
    truescore <- scoredf$logscore[rowns[2]]
    scoredf$shift[rowns] <- scoredf$logscore[rowns] - truescore
  }

  for (i in unique(scoredf$replicate)) {
    rowns <- which(scoredf$ss == 2 & scoredf$replicate == i)
    truescore <- scoredf$logscore[rowns[1]]
    scoredf$shiftBLIP[rowns] <- scoredf$logscore[rowns] - truescore
    rowns <- which(scoredf$ss == 10 & scoredf$replicate == i)
    truescore <- scoredf$logscore[rowns[1]]
    scoredf$shiftBLIP[rowns] <- scoredf$logscore[rowns] - truescore
  }
  return(scoredf)
}

PlotScoreBidagVsBlip <- function(scoredf) {

  boxplot(shiftBLIP ~ algo + ss, subset(subset(scoredf, ss == 10), algo == "MAP PC"))
  boxplot(shiftBLIP ~ algo + ss, subset(subset(scoredf, ss == 2), algo == "MAP PC"))

  scoredf <- subset(scoredf, algo %in% c("MAP PC", "final MCMC", "blip"))
  scoredf$algorithm <- scoredf$algo
  scoredf$algorithm <- with(scoredf, factor(algorithm, levels = c("MAP MCMC", "sample MCMC")))
  scoredf$ss <- as.factor(scoredf$ss)
  p1 <- ggplot(
    data = subset(scoredf, algo == "MAP PC"),
    aes(x = ss, y = shiftBLIP, group = ss)
  ) +
    geom_boxplot(aes(fill = ss))

  #pdf(file = "SCOREbidagvsblip.pdf", width = 6, height = 3, onefile = FALSE)

  grid_arrange_shared_legend(p1, p2, ncol = 2, nrow = 1, position = "bottom")

}
HorisontalBoxplot <- function(scoredf) {
  # Plot difference BIDAG vs. blip
  col2 <- c("#d7b5d8", "#df65b0")
  boxplot(shiftBLIP ~ ss, subset(scoredf, algo == "MAP PC"),
    col = col2, names = c("2n", "10n"), ylab = "sample size",
    xlab = "difference in score (BiDAG-r.blip)", horizontal = TRUE
  )
  abline(v = 0, lty = 2, col = "grey")
}

# Plot SHD
#
PlotStructuralHammingDistance <- function(SHDdf) {
  SHDdf <- subset(SHDdf, algorithm %in% c("MAP PC", "finalMCMC", "blip"))
  SHDdf$algorithm <- with(SHDdf, factor(algorithm, levels = c("MAP PC", "finalMCMC", "blip")))
  unique(SHDdf$algorithm)

  p1 <- ggplot(
    data = subset(SHDdf, ss == 10),
    aes(x = algorithm, y = SHD, col = algorithm)
  ) +
    geom_boxplot(aes(fill = algorithm)) + ggtitle("n=100, N=10n")

  p2 <- ggplot(
    data = subset(SHDdf, ss == 2),
    aes(x = algorithm, y = SHD, col = algorithm)
  ) +
    geom_boxplot(aes(fill = algorithm)) + ggtitle("n=100,N=2n")

  grid_arrange_shared_legend(p1, p2, ncol = 2, nrow = 1, position = "bottom")


  # Dont know what this does
  # p1 <- ggplot(
  #   data = subset(SHDdf, ss == 10),
  #   aes(x = algorithm, y = SHD, col = algorithm)
  # ) + scale_fill_manual(
  #   labels = c("BiDAG MAP", "BiDAG sample", "r.blip"),
  #   values = c("red", "purple", "orange")
  # ) +
  #   scale_color_manual(
  #     labels = c("BiDAG MAP", "BiDAG sample", "r.blip"),
  #     values = c("#fb8072", "#bebada", "#fdb863")
  #   ) +
  #   scale_x_discrete(labels = c("BiDAG MAP", "BiDAG sample", "r.blip")) +
  #   ylim(c(0, 200)) + ggtitle("n=100, sample size 10n")
  #
  #
  # p2 <- ggplot(
  #   data = subset(SHDdf, ss == 2),
  #   aes(x = algorithm, y = SHD, col = algorithm)
  # ) + scale_fill_manual(
  #   labels = c("BiDAG MAP", "BiDAG sample", "r.blip"),
  #   values = c("red", "purple", "orange")
  # ) +
  #   scale_color_manual(
  #     labels = c("BiDAG MAP", "BiDAG sample", "r.blip"),
  #     values = c("#fb8072", "#bebada", "#fdb863")
  #   ) +
  #   scale_x_discrete(labels = c("BiDAG MAP", "BiDAG sample", "r.blip")) +
  #   ylim(c(0, 300))
  #
  # grid_arrange_shared_legend(p1, p2, ncol = 2, nrow = 1, position = "bottom")
}
