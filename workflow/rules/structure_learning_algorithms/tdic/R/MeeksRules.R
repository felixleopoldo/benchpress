#' Last Step of tPC Algorithm: Apply Meek's rules
#'
#' This is a modified version of \code{pcalg::\link[pcalg:udag2pdag]{udag2pdagRelaxed}}.
#' It applies Meek's rules to the partially oriented graph obtained after orienting edges
#' between time points / tiers.
#'
#' @param gInput 'pcAlgo'-object containing skeleton and conditional indepedence information.
#' @param verbose FALSE: No output; TRUE: Details
#' @param unfVect Vector containing numbers that encode ambiguous triples (as returned by
#' [tpc_cons_intern()]. This is needed in the conservative and majority rule PC algorithms.
#' @param solve.confl If \code{TRUE}, the orientation rules work with lists for candidate
#' sets and allow bi-directed edges to resolve conflicting edge orientations. Note that
#' therefore the resulting object is order-independent but might not be a PDAG because
#' bi-directed edges can be present.
#' @param rules A vector of length 4 containing \code{TRUE} or \code{FALSE} for each rule.
#' \code{TRUE} in position i means that rule i (Ri) will be applied. By default, all rules are used.
#'
#' @details If \code{unfVect = NULL} (no ambiguous triples), the four orientation
#' rules are applied to each eligible structure until no more edges can be
#' oriented. Otherwise, unfVect contains the numbers of all ambiguous triples in
#' the graph as determined by [tpc_cons_intern()]. Then the orientation
#' rules take this information into account. For example, if \code{a -> b - c} and \code{<a,b,c>}
#'   is an unambigous triple and a non-v-structure, then rule 1 implies \code{b -> c}. On
#'   the other hand, if \code{a -> b - c} but \code{<a,b,c>} is an ambiguous triple, then the edge
#'   \code{b - c} is not oriented.
#'
#'   If \code{solve.confl = FALSE}, earlier edge orientations are overwritten by
#'   later ones.
#'
#'   If \code{solv.confl = TRUE}, both the v-structures and the orientation rules
#'   work with lists for the candidate edges and allow bi-directed edges if there are
#'   conflicting orientations. For example, two v-structures \code{a -> b <- c} and
#'   \code{b -> c <- d} then yield \code{a -> b <-> c <- d}. This option can be used to get an
#'   order-independent version of the PC algorithm (see Colombo and Maathuis (2014)).
#'
#'   We denote bi-directed edges, for example between two variables i and j, in the
#'   adjacency matrix M of the graph as \code{M[i,j]=2} and \code{M[j,i]=2}. Such edges should be
#'   interpreted as indications of conflicts in the algorithm, for example due to
#'   errors in the conditional independence tests or violations of the faithfulness
#'   assumption.
#'
#' @return An object of class \code{\link[pcalg]{pcAlgo-class}}.
#'
#' @references C. Meek (1995). Causal inference and causal explanation with
#' background knowledge. In: Proceedings of the Eleventh Conference on Uncertainty
#' in Artificial Intelligence (UAI-95), pp. 403-411. Morgan Kaufmann Publishers.
#'
#' D. Colombo and M.H. Maathuis (2014). Order-independent constraint-based causal
#' structure learning. Journal of Machine Learning Research 15:3741-3782.
#'
#' @author Original code by Markus Kalisch, modifications by Janine Witte.
#'
#' @importFrom utils combn
#' @importFrom methods as
#'
#' @export
#'
#' @examples
#' data(dat_sim)
#' sk.fit <- skeleton(suffStat = list(C = cor(dat_sim), n = nrow(dat_sim)),
#'              indepTest = gaussCItest, labels = names(dat_sim), alpha = 0.05)
#' MeekRules(sk.fit)
#'
MeekRules <- function (gInput, verbose = FALSE, unfVect = NULL,
                       solve.confl = FALSE, rules = rep(TRUE, 4)) {

  rule1 <- function(pdag, solve.confl = FALSE, unfVect = NULL) {
    search.pdag <- pdag
    ind <- which(pdag == 1 & t(pdag) == 0, arr.ind = TRUE)
    for (i in seq_len(nrow(ind))) {
      a <- ind[i, 1]
      b <- ind[i, 2]
      isC <- which(search.pdag[b, ] == 1 & search.pdag[ ,b] == 1 &
                     search.pdag[a, ] == 0 & search.pdag[ ,a] == 0)
      if (length(isC) > 0) {
        for (ii in seq_along(isC)) {
          c <- isC[ii]
          if (!solve.confl | (pdag[b, c] == 1 & pdag[c,
                                                     b] == 1)) {
            if (!is.null(unfVect)) {
              if (!any(unfVect == triple2numb(p, a, b, c), na.rm = TRUE) &&
                  !any(unfVect == triple2numb(p, c, b, a), na.rm = TRUE)) {
                pdag[b, c] <- 1
                pdag[c, b] <- 0
              }
            }
            else {
              pdag[b, c] <- 1
              pdag[c, b] <- 0
            }
            if (verbose)
              cat("\nRule 1':", a, "->",
                  b, " and ", b, "-", c, " where ",
                  a, " and ", c, " not connected and ",
                  a, b, c, " faithful triple: ",
                  b, "->", c, "\n")
          }
          else if (pdag[b, c] == 0 & pdag[c, b] == 1) {
            if (!is.null(unfVect)) {
              if (!any(unfVect == triple2numb(p, a, b, c), na.rm = TRUE) &&
                  !any(unfVect == triple2numb(p, c, b, a), na.rm = TRUE)) {
                pdag[b, c] <- 2
                pdag[c, b] <- 2
                if (verbose)
                  cat("\nRule 1':", a, "->",
                      b, "<-", c, " but ",
                      b, "->", c, "also possible and",
                      a, b, c, " faithful triple: ",
                      a, "->", b, "<->", c,
                      "\n")
              }
            }
            else {
              pdag[b, c] <- 2
              pdag[c, b] <- 2
              if (verbose)
                cat("\nRule 1':", a, "->",
                    b, "<-", c, " but ", b,
                    "->", c, "also possible and",
                    a, b, c, " faithful triple: ",
                    a, "->", b, "<->", c, "\n")
            }
          }
        }
      }
      if (!solve.confl)
        search.pdag <- pdag
    }
    pdag
  }
  rule2 <- function(pdag, solve.confl = FALSE) {
    search.pdag <- pdag
    ind <- which(search.pdag == 1 & t(search.pdag) == 1,
                 arr.ind = TRUE)
    for (i in seq_len(nrow(ind))) {
      a <- ind[i, 1]
      b <- ind[i, 2]
      isC <- which(search.pdag[a, ] == 1 & search.pdag[, a] == 0 &
                     search.pdag[, b] == 1 & search.pdag[b, ] == 0)
      for (ii in seq_along(isC)) {
        c <- isC[ii]
        if (!solve.confl | (pdag[a, b] == 1 & pdag[b,
                                                   a] == 1)) {
          pdag[a, b] <- 1
          pdag[b, a] <- 0
          if (verbose)
            cat("\nRule 2: Chain ", a, "->",
                c, "->", b, ":", a, "->",
                b, "\n")
        }
        else if (pdag[a, b] == 0 & pdag[b, a] == 1) {
          pdag[a, b] <- 2
          pdag[b, a] <- 2
          if (verbose)
            cat("\nRule 2: Chain ", a, "->",
                c, "->", b, ":", a, "<->",
                b, "\n")
        }
      }
      if (!solve.confl)
        search.pdag <- pdag
    }
    pdag
  }
  rule3 <- function(pdag, solve.confl = FALSE, unfVect = NULL) {
    search.pdag <- pdag
    ind <- which(search.pdag == 1 & t(search.pdag) == 1,
                 arr.ind = TRUE)
    for (i in seq_len(nrow(ind))) {
      a <- ind[i, 1]
      b <- ind[i, 2]
      c <- which(search.pdag[a, ] == 1 & search.pdag[, a] == 1 &
                   search.pdag[, b] == 1 & search.pdag[b, ] == 0)
      if (length(c) >= 2) {
        cmb.C <- combn(c, 2)
        cC1 <- cmb.C[1, ]
        cC2 <- cmb.C[2, ]
        for (j in seq_along(cC1)) {
          c1 <- cC1[j]
          c2 <- cC2[j]
          if (search.pdag[c1, c2] == 0 && search.pdag[c2,
                                                      c1] == 0) {
            if (!is.null(unfVect)) {
              if (!any(unfVect == triple2numb(p, c1, a, c2), na.rm = TRUE) &&
                  !any(unfVect == triple2numb(p, c2, a, c1), na.rm = TRUE)) {
                if (!solve.confl | (pdag[a, b] == 1 &
                                    pdag[b, a] == 1)) {
                  pdag[a, b] <- 1
                  pdag[b, a] <- 0
                  if (!solve.confl)
                    search.pdag <- pdag
                  if (verbose)
                    cat("\nRule 3':", a, c1, c2,
                        "faithful triple: ", a, "->",
                        b, "\n")
                  break
                }
                else if (pdag[a, b] == 0 & pdag[b, a] ==
                         1) {
                  pdag[a, b] <- pdag[b, a] <- 2
                  if (verbose)
                    cat("\nRule 3':", a, c1, c2,
                        "faithful triple: ", a, "<->",
                        b, "\n")
                  break
                }
              }
            }
            else {
              if (!solve.confl | (pdag[a, b] == 1 & pdag[b,
                                                         a] == 1)) {
                pdag[a, b] <- 1
                pdag[b, a] <- 0
                if (!solve.confl)
                  search.pdag <- pdag
                if (verbose)
                  cat("\nRule 3':", a, c1, c2,
                      "faithful triple: ", a, "->",
                      b, "\n")
                break
              }
              else if (pdag[a, b] == 0 & pdag[b, a] ==
                       1) {
                pdag[a, b] <- pdag[b, a] <- 2
                if (verbose)
                  cat("\nRule 3':", a, c1, c2,
                      "faithful triple: ", a, "<->",
                      b, "\n")
                break
              }
            }
          }
        }
      }
    }
    pdag
  }
  rule4 <- function(pdag, solve.confl = FALSE, unfVect = NULL) {
    search.pdag <- pdag
    # find an undirected edge - this will be the left vertical edge in the
    # square
    ind <- which(search.pdag == 1 & t(search.pdag) == 1, arr.ind = TRUE)
    for (i in seq_len(nrow(ind))) {
      a <- ind[i, 1]
      b <- ind[i, 2]
      # find all nodes that share an undirected edge with a and a directed edge
      # with b (c into b)
      all_c <- which(search.pdag[a, ] == 1 & ## !!! ##
                   search.pdag[ ,a] == 1 &
                   search.pdag[ ,b] == 1 &
                   search.pdag[b, ] == 0)
      for (c in all_c) { ## !!! ##
        # find all nodes that share an undirected edge with a, a directed edge
        # with c (d into c) and no edge with b
        all_d <- which(search.pdag[a, ] == 1 & ## !!! ##
                     search.pdag[ ,a] == 1 &
                     search.pdag[ ,c] == 1 &
                     search.pdag[c, ] == 0 &
                     search.pdag[b, ] == 0 &
                     search.pdag[ ,b] ==0)
        for (d in all_d) { ## !!! ##
          if (!is.null(unfVect)) {
            # make sure that the upper left v-structure is not ambiguous; if it
            # is ambiguous, go to next pair
            if (!any(unfVect == triple2numb(p, b, a, d), na.rm = TRUE) &&
                !any(unfVect == triple2numb(p, d, a, b), na.rm = TRUE)) {
              if (!solve.confl | (pdag[a, b] == 1 & pdag[b, a] == 1)) {
                # i.e. if we ignore conflicts, or if we are about to make the
                # first change to the a-b edge in pdag
                # make the edge directed into b in pdag
                pdag[a, b] <- 1
                pdag[b, a] <- 0
                if (!solve.confl)
                  # if solve.confl is not activated, we can use pdag as the new
                  # search.pdag
                  search.pdag <- pdag
                if (verbose)
                  cat("\nRule 4:", a, "-", b, "<-", c, "<-", d, "and", a, "-",
                      c, ": ", a, "->", b, "\n")
                break
              }
              else if (pdag[a, b] == 0 & pdag[b, a] == 1) {
                # if we checked b-a before and there is now a directed edge from
                # b to a in pdag, orient as bi-directed
                pdag[a, b] <- pdag[b, a] <- 2
                if (verbose)
                  cat("\nRule 4:", a, "-", b, "<-", c, "<-", d, "and", a, "-",
                       c, ": ", a, "<->", b, "\n")
                break
              }
            }
          }
          else { # i.e. if is.null(unfVect)
            if (!solve.confl | (pdag[a, b] == 1 & pdag[b, a] == 1)) {
              # i.e. if we ignore conflicts, or if we are about to make the
              # first change to the a-b edge in pdag
              pdag[a, b] <- 1
              pdag[b, a] <- 0
              if (!solve.confl)
                search.pdag <- pdag
              if (verbose)
                cat("\nRule 4:", a, "-", b, "<-", c, "<-", d, "and", a, "-", c,
                    ": ", a, "->", b, "\n")
              break
            } else if (pdag[a, b] == 0 & pdag[b, a] == 1) {
              # if we checked b-a before and there is now a directed edge from b
              # to a in pdag, orient as bi-directed
              pdag[a, b] <- pdag[b, a] <- 2
              if (verbose)
                cat("\nRule 4:", a, "-", b, "<-", c, "<-", d, "and", a, "-", c,
                    ": ", a, "<->", b, "\n")
              break
            }
          }
        }
      }
    }
    pdag
  }

  if (numEdges(gInput@graph) == 0)
    return(gInput)
  g <- as(gInput@graph, "matrix")
  p <- nrow(g)
  pdag <- g

  repeat {
    old_pdag <- pdag
    if (rules[1]) {
      pdag <- rule1(pdag, solve.confl = solve.confl, unfVect = unfVect)
    }
    if (rules[2]) {
      pdag <- rule2(pdag, solve.confl = solve.confl)
    }
    if (rules[3]) {
      pdag <- rule3(pdag, solve.confl = solve.confl, unfVect = unfVect)
    }
    if (rules[4]) {
      pdag <- rule4(pdag, solve.confl = solve.confl, unfVect = unfVect)
    }
    if (all(pdag == old_pdag))
      break
  }
  gInput@graph <- as(pdag, "graphNEL")
  gInput
}
