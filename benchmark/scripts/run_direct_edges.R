library(RBGL)
library(pcalg)
orientSkeleton <- function(G, suffStat, indepTest, alpha, labels, p,
               fixedGaps = NULL, fixedEdges = NULL, NAdelete = TRUE, m.max = Inf,
               u2pd = c("relaxed", "rand", "retry"),
               skel.method = c("stable", "original", "stable.fast"),
               conservative = FALSE, maj.rule = FALSE,
               solve.confl = FALSE, numCores = 1, verbose = FALSE) {



  #res <- .Call("estimateSkeleton", G, suffStat, indepTestName, indepTest, alpha, fixedEdges, options);
  #G <- res$amat

  cl <- match.call()
  print(cl)
  ## transform matrix to graph object :
  Gobject <-
    if (sum(G) == 0) {
      new("graphNEL", nodes = labels)
    } else {
    colnames(G) <- rownames(G) <- labels
    as(G, "graphNEL")
  }

  ## final object
  new("pcAlgo", graph = Gobject, call = cl, n = integer(0),
      max.ord = as.integer(ord - 1), n.edgetests = n.edgetests,
      sepset = sepset, pMax = pMax, zMin = matrix(NA, 1, 1))


  ## Orient edges
  if (!conservative && !maj.rule) {
    switch(u2pd,
            "rand" = udag2pdag(skel),
            "retry" = udag2pdagSpecial(skel)$pcObj,
            "relaxed" = udag2pdagRelaxed(skel, verbose = verbose, solve.confl = solve.confl))
  } 
}




alpha <- 0.1
data <- read.csv("1.csv")
n <- dim(data)[2]
p <- n
G <- matrix(TRUE, nrow = p, ncol = p)

pcobj <- new("pcAlgo", )

dag <- orientSkeleton(G, suffStat = list(dm = data,
                               adaptDF = FALSE),
                  indepTest = binCItest,
                  alpha = alpha,
                    labels = sapply(c(1:n), toString))