library(RBGL)
library(pcalg)
orientSkeleton <- function(G, suffStat, indepTest, alpha, labels, p,
               fixedGaps = NULL, fixedEdges = NULL, NAdelete = TRUE, m.max = Inf,
               u2pd = c("relaxed", "rannd", "retry"),
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
  skel <- new("pcAlgo", graph = Gobject)
  #new("pcAlgo", graph = Gobject, call = cl, n = integer(0),
  #    max.ord = as.integer(ord - 1), n.edgetests = n.edgetests,
  #    sepset = sepset, pMax = pMax, zMin = matrix(NA, 1, 1))
  

  u2pd <- "rand"
  ## Orient edges
  if (!conservative && !maj.rule) {
    switch(u2pd,
            "rand" = udag2pdag(skel),
            "retry" = udag2pdagSpecial(skel)$pcObj,
            "relaxed" = udag2pdagRelaxed(skel, verbose = verbose, solve.confl = solve.confl))
  } 
}

alpha <- 0.1
data <- read.csv("2.csv")

n <- dim(data)[2]
p <- n


p = n= 4
labels <- seq(n)
G <- matrix(FALSE, nrow = p, ncol = p)

G[1,3] <- TRUE
G[3,1] <- TRUE
G[1,2] <- TRUE
G[2,1] <- TRUE
G[2,3] <- TRUE
G[3,2] <- TRUE

#G[3,4] <- TRUE
#G[4,3] <- TRUE
#G[5,3] <- TRUE
#G[3,5] <- TRUE
G
Gobject <-
  if (sum(G) == 0) {
    new("graphNEL", nodes = labels)
  } else {
  colnames(G) <- rownames(G) <- labels
  as(G, "graphNEL")
}
Gobject

pcobj <- new("pcAlgo", graph=Gobject,  n = as.integer(1))
pcobj

dag <- udag2pdag(pcobj)
dag <- udag2pdagRelaxed(pcobj)

#dag <- orientSkeleton(G, suffStat = list(dm = data, adaptDF = FALSE),
#                  indepTest = binCItest,
#                  alpha = alpha,
#                   labels = sapply(c(1:n), toString))

dag