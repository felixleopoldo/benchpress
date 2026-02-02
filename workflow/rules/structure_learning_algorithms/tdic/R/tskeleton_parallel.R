#' @keywords internal
#' @inheritParams <tpc::tskeleton>
tskeleton_parallel <- function (suffStat, indepTest, alpha, labels, p,
                        method = c("stable.parallel"),
                        numCores, clusterexport = NULL, cl.type,
                        m.max = Inf, fixedGaps = NULL, fixedEdges = NULL,
                        NAdelete = TRUE,
                        verbose = FALSE,
                        tiers = NULL) {

     cll <- match.call()

     ### new for parallel:
     if (missing(numCores)) {stop("Please specify 'numCores'.")}
     if (numCores < 2) {
       stop("The number of cores is insufficient to run parallel-PC")
     }
     if (!missing(p))
        stopifnot(is.numeric(p), length(p <- as.integer(p)) == 1, p >= 2)
     if (missing(labels)) {
        if (missing(p))
           stop("need to specify 'labels' or 'p'")
        labels <- as.character(seq_len(p))
     }   else {
        stopifnot(is.character(labels))
        if (missing(p))
           p <- length(labels)
        else if (p != length(labels))
           stop("'p' is not needed when 'labels' is specified, and must match length(labels)")
     }

     seq_p <- seq_len(p)
     method <- match.arg(method)

     if (is.null(fixedGaps)) {
        G <- matrix(TRUE, nrow = p, ncol = p)
     } else if (!identical(dim(fixedGaps), c(p, p)))
        stop("Dimensions of the dataset and fixedGaps do not agree.")
     else if (!identical(fixedGaps, t(fixedGaps)))
        stop("fixedGaps must be symmetric")
     else G <- !fixedGaps
     diag(G) <- FALSE

     #################################################
     ## if no tiers are specified, everything is tier 0
     if (is.null(tiers)) {
        tiers <- rep(0, p)
     } else {
        ## check if 'tiers' are correctly specified
        if (!is.numeric(tiers)) {stop("'tiers' must be a numeric vector")}
        if (length(tiers) != p) {stop("length of 'tiers' does not match 'p' or length of 'labels'")}
     }
     #################################################
     if (any(is.null(fixedEdges))) {
        fixedEdges <- matrix(rep(FALSE, p * p), nrow = p, ncol = p)
     }
     else if (!identical(dim(fixedEdges), c(p, p)))
        stop("Dimensions of the dataset and fixedEdges do not agree.")
     else if (!identical(fixedEdges, t(fixedEdges)))
        stop("fixedEdges must be symmetric")

    pval <- NULL

    # seq_p is just the vector 1:p
    # sepset is a list of p lists with p elements each,
    # so each element represents an edge, and each edge is represented twice

    sepset <- lapply(seq_p, function(.) vector("list", p))

    # pMax is a matrix with one p-value per edge, at the beginning all p-values are -Inf
    pMax <- matrix(-Inf, nrow = p, ncol = p)
    diag(pMax) <- 1
    done <- FALSE

    # ord is the size of the conditioning set
    ord <- 0L

    # n.edgetests is for recording how many cond. ind. tests have been conducted in total
    n.edgetests <- numeric(1)

    # G is a (pxp)-matrix (each entry represents an edge and each edge is represented twice);
    # at the beginning, all elements are TRUE except for the diagonal

    ### new for parallel:
    # prepare the workers

    # workers <- NULL
    # if (Sys.info()[['sysname']] == 'Windows') {
    #   workers <- makeCluster(numCores, type = "PSOCK")
    # } else if (Sys.info()[['sysname']] == 'Linux') {
    #   workers <- makeCluster(numCores, type = "MPI")}

    workers <- parallel::makeCluster(numCores, type = cl.type)

    parallel::clusterEvalQ(cl = workers, library(pcalg))
    # parallel::clusterExport(cl = workers,
    #           varlist = c("suffStat", "tiers", "fixedEdges", "indepTest",
    #                       "G", "ind", "ord", "pMax", "alpha", "seq_p"))
    if (!is.null(clusterexport)){
      print(clusterexport)
      parallel::clusterExport(cl = workers, varlist = clusterexport)
      message(c(paste("The following functions are exported to", numCores,
                    "nodes:  "), paste(clusterexport, col=" ")))
      }

    while (!done && any(G) && ord <= m.max) {
      # done is FALSE if for every remaining edge, the number of neighbours is smaller
      # than the new ord
       n.edgetests[ord1 <- ord + 1L] <- 0
       done <- TRUE

       # ind is a two-column matrix, each row represents an edge (indices of both endpoints)
       ind <- which(G, arr.ind = TRUE)

       # the next command just reorders ind
       ind <- ind[order(ind[, 1]), ]

       # how many edges are remaining?
       remEdges <- nrow(ind)
       if (verbose)
          cat("Order=", ord, "; remaining edges:", remEdges,
              "\n", sep = "")


       ### new for parallel:
       res <- parallel::parLapply(workers, 1:nrow(ind),
                        findInd,
                        G = G, ind = ind, ord = ord, pMax = pMax,
                        suffStat = suffStat,
                        fixedEdges = fixedEdges,
                        tiers = tiers, verbose = verbose,
                        indepTest = indepTest,
                        alpha = alpha,
                        seq_p = seq_p,
                        NAdelete = NAdelete)

       # updating:
       for (j in res) {
         pMax[j[[1]], j[[2]]] <- j[[3]]

         G[j[[1]], j[[2]]] <- G[j[[2]], j[[1]]]  <-
             as.logical( G[j[[1]], j[[2]]] * G[j[[2]], j[[1]]] * j[[4]] )

         if (!is.null(j[[5]])) {
           sepset[[j[[1]]]][[j[[2]]]] <- j[[5]]
          }
         done <- done * j[[6]]
         n.edgetests[ord1] <- n.edgetests[ord1] + j[[7]]
       }

       ############################
       ord <- ord + 1L
    }

   ### new for parallel:
   parallel::stopCluster(workers)


   for (i in 1:(p - 1)) {
       for (j in 2:p) pMax[i, j] <- pMax[j, i] <- max(pMax[i, j], pMax[j, i])
   }

   Gobject <- if (sum(G) == 0) {
      new("graphNEL", nodes = labels)

   } else {
      colnames(G) <- rownames(G) <- labels
      as(G, "graphNEL")
   }
   new("pcAlgo", graph = Gobject, call = cll, n = integer(0),
       max.ord = as.integer(ord - 1), n.edgetests = n.edgetests,
       sepset = sepset, pMax = pMax, zMin = matrix(NA, 1, 1))
}





findInd <- function(i, G, ind, ord, pMax, fixedEdges, tiers, verbose, suffStat,
                    indepTest, alpha, seq_p, NAdelete){

  # every edge is visited twice, so that each of the endpoints gets to be the node whose
  # neighbours are considered
  if (verbose && (verbose >= 2 || i%%100 == 0))
    cat("|i=", i, "|iMax=", remEdges, "\n")
  # endpoint 1 of current edge
  x <- ind[i, 1]
  # endpoint 2 of current edge
  y <- ind[i, 2]
  pMax_i <- pMax[x, y]
  edge_i <- TRUE
  sepset_i <- FALSE
  done_i <- TRUE
  n.edgetests_i <- 0

  if (G[y, x] && !fixedEdges[y, x]) {
    # only edges are considered that are still in the current skeleton
    # else go to next remaining edge
    # in nbrsBool, the neighbours of the current node are TRUE
    # nbrsBool <- if (method == "stable")
    #   G.l[[x]] #
    # else G[, x]
    nbrsBool <- G[, x]
    #################################################
    max_tier <- max(tiers[c(x,y)])
    # this excludes neighbours in later tiers from the conditioning set
    nbrsBool[tiers > max_tier] <- FALSE
    #################################################
    nbrsBool[y] <- FALSE
    # nbrs contains the indices of all eligible neighbours
    nbrs <- seq_p[nbrsBool]
    length_nbrs <- length(nbrs)
    # next steps only possible if there are enough neighbours to form conditioning sets of
    # cardinality length_nbrs
    if (length_nbrs >= ord) { #else go to next remaining edge
      if (length_nbrs > ord)
        # done is reset to FALSE if for any node with remaining edges, the number of
        # neighbours is at least as large as the order that will come next
        done_i <- FALSE
      S <- seq_len(ord)
      repeat { # the repeat loop goes over all subsets of the neighbours with length ord
        # n.edgetests[ord1] <- n.edgetests[ord1] + 1
        n.edgetests_i <- n.edgetests_i + 1
        pval <- indepTest(x, y, nbrs[S], suffStat)
        if (verbose)
          cat("x=", x, " y=", y, " S=", nbrs[S],
              ": pval =", pval, "\n")
        if (is.na(pval))
          pval <- as.numeric(NAdelete)
        # pMax is the maximum p-value of all the tests conditioning on different subsets
        # of the neighbours
        # what is pMax for?
        #if (pMax[x, y] < pval)
          #pMax[x, y] <- pval
        if (pMax_i < pval) {pMax_i <- pval}

        if (pval >= alpha) {
          #G[x, y] <- G[y, x] <- FALSE
          #sepset[[x]][[y]] <- nbrs[S]
          edge_i <- FALSE
          sepset_i <- nbrs[S]
          break # exit repeat loop (?)
        }
        else {
          # chose ord elements from the neighbours as the new S
          nextSet <- getNextSet(length_nbrs, ord, S)
          if (nextSet$wasLast)
            break
          S <- nextSet$nextSet
        }
      } # end repeat
    } # end if
  } # end if

  out <- list(x, y, pMax_i, edge_i, sepset_i, done_i, n.edgetests_i)
  return(out)
}
