#' Check Consistency of Conditional Independence for a Triple of Nodes in a tPC
#'
#' @param a (integer) position in adjacency matrix for nodes a.
#' @param b (integer) position in adjacency matrix for nodes b.
#' @param c (integer) position in adjacency matrix for nodes c.
#' @param nbrsA (integer) position in adjacency matrix for neighbors of a.
#' @param nbrsC (integer) position in adjacency matrix for neighbors of c.
#' @param sepsetA vector containing \code{Sepset(a,c)}.
#' @param sepsetC vector containing \code{Sepset(c,a)}.
#' @param suffStat a list of sufficient statistics for independent tests; see, e.g., [pcalg::pc()].
#' @param indepTest a function for the independence test, see, e.g., [pcalg::pc()].
#' @param alpha significance level of test.
#' @param version.unf Vector of length two. If \code{version.unf[2]==1}, the inititial
#' separating set found by the PC/FCI algorithm is added to the set of separating sets;
#' if \code{version.unf[2]==2}, it is not added. In the latter case, if the set of
#' separating sets is empty, the triple is marked as unambiguous if \code{version.unf[1]==1},
#' and as ambiguous if \code{version.unf[1]==2}.
#' @param maj.rule Logical indicating if the triples are checked for ambiguity using the
#' majority rule idea, which is less strict than the standard conservative method.
#' @param verbose Logical asking for detailed output.
#' @param NAdelete logical needed for the case \code{indepTest(*)} returns \code{NA}.
#' If it is true, the corresponding edge is deleted, otherwise not.
#'
#' @return A list.
#' @noRd
#'
tcheckTriple <- function (a, b, c, nbrsA, nbrsC, sepsetA, sepsetC, suffStat,
          indepTest, alpha, version.unf = c(NA, NA), maj.rule = FALSE,
          verbose = FALSE, NAdelete=TRUE, labels = NULL) {
  nr.indep <- 0
  stopifnot(length(version.unf) == 2, version.unf %in% 1:2)
  tmp <- if (version.unf[2] == 2)
    (b %in% sepsetA || b %in% sepsetC)
  version <- 0
  if ((nn <- length(nbrsA)) > 0) {
    allComb <- expand.grid(lapply(integer(nn), function(.) 0:1))
    for (i in 1:nrow(allComb)) {
      S <- nbrsA[which(allComb[i, ] != 0)]
      pval <- indepTest(a, c, S, suffStat, labels = labels)
      if (verbose)
        cat("a: S =", labels[S], " - pval =", pval,
            "\n")
      if (is.na(pval))
        pval <- as.numeric(NAdelete)
      if (pval >= alpha) {
        nr.indep <- nr.indep + 1
        tmp <- c(tmp, b %in% S)
        version <- 1
      }
    }
  }
  if ((nn <- length(nbrsC)) > 0) {
    allComb <- expand.grid(lapply(integer(nn), function(.) 0:1))
    for (i in 1:nrow(allComb)) {
      S <- nbrsC[which(allComb[i, ] != 0)]
      pval <- indepTest(a, c, S, suffStat, labels = labels)
      if (verbose)
        cat("c: S =", labels[S], " - pval =", pval,
            "\n")
      if (is.na(pval))
              pval <- as.numeric(NAdelete)
      if (pval >= alpha) {
        nr.indep <- nr.indep + 1
        tmp <- c(tmp, b %in% S)
        version <- 1
      }
    }
  }
  if (version.unf[1] == 2 && nr.indep == 0) {
    version <- 2
  }
  if (is.null(tmp))
    tmp <- FALSE
  if (all(tmp)) {
    res <- 2
    if (b %nin% sepsetA)
      sepsetA <- c(sepsetA, b)
    if (b %nin% sepsetC)
      sepsetC <- c(sepsetC, b)
  }
  else {
    if (all(!tmp)) {
      res <- 1
      sepsetA <- setdiff(sepsetA, b)
      sepsetC <- setdiff(sepsetC, b)
    }
    else {
      if (!maj.rule) {
        res <- 3
      }
      else {
        if (sum(tmp)/length(tmp) < 0.5) {
          res <- 1
          sepsetA <- setdiff(sepsetA, b)
          sepsetC <- setdiff(sepsetC, b)
        }
        else if (sum(tmp)/length(tmp) > 0.5) {
          res <- 2
          if (b %nin% sepsetA)
            sepsetA <- c(sepsetA, b)
          if (b %nin% sepsetC)
            sepsetC <- c(sepsetC, b)
        }
        else if (sum(tmp)/length(tmp) == 0.5) {
          res <- 3
        }
      }
    }
  }
  if (verbose && res == 3)
    cat("Triple ambiguous\n")
  lapply(list(decision = res, version = version, SepsetA = sepsetA,
              SepsetC = sepsetC), as.integer)
}

'%nin%' <- function(x, table) {
  is.na(match(x, table))
}
