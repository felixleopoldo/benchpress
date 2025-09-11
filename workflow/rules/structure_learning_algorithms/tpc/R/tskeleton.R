getNextSetMDAG <- function(n, k, set) {
    ## Purpose: Generate the next set in a list of all possible sets of size
    ##          k out of 1:n;
    ##  Also returns a boolean whether this set was the last in the list.
    ## ----------------------------------------------------------------------
    ## Arguments:
    ## - n,k: Choose a set of size k out of numbers 1:n
    ## - set: previous set in list
    ## ----------------------------------------------------------------------
    ## Author: Markus Kalisch, Date: 26 Jan 2006, 17:37

    ## chInd := changing Index
    chInd <- k - (zeros <- sum((seq(n - k + 1, n) - set) == 0))
    wasLast <- (chInd == 0)
    if (!wasLast) {
        set[chInd] <- s.ch <- set[chInd] + 1
        if (chInd < k) {
            set[(chInd + 1):k] <- seq(s.ch + 1L, s.ch + zeros)
        }
    }
    list(nextSet = set, wasLast = wasLast)
}


get_S_substantive_and_missingness <- function(S_fixed, nbrs) {
    gr <- grepl("^R_", labels[nbrs[S_fixed]])
    print(gr)

    S_substantive <- NULL
    S_missingness <- NULL
    # this fails when the subset contains only one variable

    if (length(S_fixed) == 1) {
        if (gr) {
            S_missingness <- S_fixed
            S_substantive <- c()
        } else {
            S_missingness <- c()
            S_substantive <- S_fixed
        }
    } else {
        S_substantive <- S_fixed[!gr]
        S_missingness <- S_fixed[gr]
    }
    return(list(S_substantive = S_substantive, S_missingness = S_missingness))
}

#' Estimate the Skeleton of a DAG while Accounting for a Partial Ordering
#'
#' Like \code{pcalg::\link[pcalg]{skeleton}}, but takes a user-specified partial node
#' ordering into account. The conditional independence
#' between \code{x} and \code{y} given \code{S} is not tested if any variable in
#' \code{S} lies in the future of both \code{x} and \code{y}.
#'
#' @param suffStat A list of sufficient statistics, containing all necessary elements for
#' the conditional independence decisions in the function \code{indepTest}.
#' @param indepTest Predefined \code{\link[base]{function}} for testing conditional
#' independence. It is internally called as \code{indepTest(x,y,S,suffStat)}, and tests
#' conditional independence of \code{x} and \code{y} given \code{S}. Here, \code{x} and
#' \code{y} are variables, and \code{S} is a (possibly empty) vector of variables (all
#' variables are denoted by their (integer) column positions in the adjacency matrix).
#' \code{suffStat} is a list, see the argument above. The return value of \code{indepTest}
#' is the p-value of the test for conditional independence.
#' @param alpha Significance level (number in \emph{(0,1)} for the individual conditional
#' independence tests.
#' @param labels (optional) character vector of variable (or "node") names.
#' Typically preferred to specifying \code{p}.
#' @param p (optional) number of variables (or nodes). May be specified if \code{labels}
#' are not, in which case \code{labels} is set to \code{1:p}.
#' @param method Character string specifying method; the default, "stable" provides an
#' \emph{order-independent} skeleton, see 'Details' below.
#' @param m.max Maximal size of the conditioning sets that are considered in the
#' conditional independence tests.
#' @param fixedGaps logical \emph{symmetric} matrix of dimension \code{p*p}. If entry
#' \code{[i,j]} is true, the edge \emph{i-j} is removed before starting the
#' algorithm. Therefore, this edge is guaranteed to be \emph{absent} in the
#' resulting graph.
#' @param fixedEdges a logical \emph{symmetric} matrix of dimension \code{p*p}. If entry
#' \code{[i,j]} is true, the edge \emph{i-j} is never considered for removal.
#' Therefore, this edge is guaranteed to be \emph{present} in the resulting graph.
#' @param NAdelete logical needed for the case \code{indepTest(*)} returns \code{NA}.
#' If it is true, the corresponding edge is deleted, otherwise not.
#' @param tiers Numeric vector specifying the tier / time point for each variable.
#' Must be of length 'p', if specified, or have the same length as 'labels', if specified.
#' A smaller number corresponds to an earlier tier / time point. Conditional independence
#' testing is restricted such that if \code{x} is in tier \code{t(x)} and \code{y} is
#' in \code{t(y)}, only those variables are allowed in the conditioning set whose tier is
#' not larger than \code{t(x)}.
#' @param verbose if \code{TRUE}, detailed output is provided.
#'
#' @details See \code{pcalg::\link[pcalg]{skeleton}} for further information on the
#' skeleton algorithm.
#'
#' @return An object of class "pcAlgo" (see \code{pcalg::\link[pcalg]{pcAlgo}})
#' containing an estimate of the skeleton of the underlying DAG, the conditioning
#' sets (sepset) that led to edge removals and several other parameters.
#'
#' @author
#' Original code by Markus Kalisch, Martin Maechler, Alain Hauser and Diego Colombo.
#' Modifications by Janine Witte.
#'
#' @importFrom methods as new
#'
#' @export
#'
#' @examples
#' # load simulated cohort data
#' data("dat_sim")
#' n <- nrow(dat_sim)
#' lab <- colnames(dat_sim)
#' # estimate skeleton without taking background information into account
#' tskel.fit <- tskeleton(
#'     suffStat = list(C = cor(dat_sim), n = n),
#'     indepTest = gaussCItest, alpha = 0.01, labels = lab
#' )
#' skel.fit <- pcalg::skeleton(
#'     suffStat = list(C = cor(dat_sim), n = n),
#'     indepTest = gaussCItest, alpha = 0.01, labels = lab
#' )
#' identical(skel.fit@graph, tskel.fit@graph) # TRUE
#'
#' # estimate skeleton with temporal ordering as background information
#' tiers <- rep(c(1, 2, 3), times = c(3, 3, 3))
#' tskel.fit2 <- tskeleton(
#'     suffStat = list(C = cor(dat_sim), n = n),
#'     indepTest = gaussCItest, alpha = 0.01, labels = lab, tiers = tiers
#' )
#'
#' # in this case, the skeletons estimated with and without
#' # background knowledge are identical, but fewer conditional
#' # independence tests were performed when background
#' # knowledge was taken into account
#' identical(tskel.fit@graph, tskel.fit2@graph) # TRUE
#' tskel.fit@n.edgetests
#' tskel.fit2@n.edgetests
#'
tskeleton <- function(suffStat, indepTest, alpha, labels, p,
                      method = c("stable", "original"), m.max = Inf,
                      fixedGaps = NULL, fixedEdges = NULL, NAdelete = TRUE,
                      tiers = NULL, verbose = FALSE) {
    cl <- match.call()
    if (!missing(p)) {
        stopifnot(is.numeric(p), length(p <- as.integer(p)) ==
            1, p >= 2)
    }
    if (missing(labels)) {
        if (missing(p)) {
            stop("need to specify 'labels' or 'p'")
        }
        labels <- as.character(seq_len(p))
    } else {
        stopifnot(is.character(labels))
        if (missing(p)) {
            p <- length(labels)
        } else if (p != length(labels)) {
            stop("'p' is not needed when 'labels' is specified, and must match length(labels)")
        }
    }
    seq_p <- seq_len(p)
    method <- match.arg(method)
    if (is.null(fixedGaps)) {
        G <- matrix(TRUE, nrow = p, ncol = p)
    } else if (!identical(dim(fixedGaps), c(p, p))) {
        stop("Dimensions of the dataset and fixedGaps do not agree.")
    } else if (!identical(fixedGaps, t(fixedGaps))) {
        stop("fixedGaps must be symmetric")
    } else {
        G <- !fixedGaps
    }
    diag(G) <- FALSE
    #################################################
    ## if no tiers are specified, everything is tier 0
    if (is.null(tiers)) {
        tiers <- rep(0, p)
    } else {
        ## check if 'tiers' are correctly specified
        if (!is.numeric(tiers)) {
            stop("'tiers' must be a numeric vector")
        }
        if (length(tiers) != p) {
            stop("length of 'tiers' does not match 'p' or length of 'labels'")
        }
    }
    #################################################
    if (any(is.null(fixedEdges))) {
        fixedEdges <- matrix(rep(FALSE, p * p), nrow = p, ncol = p)
    } else if (!identical(dim(fixedEdges), c(p, p))) {
        stop("Dimensions of the dataset and fixedEdges do not agree.")
    } else if (!identical(fixedEdges, t(fixedEdges))) {
        stop("fixedEdges must be symmetric")
    }

    pval <- NULL
    # seq_p is just the vector 1:p
    # sepset is a list of p lists with p elements each,
    # so each element represents an edge, and each edge is represented twice
    sepset <- lapply(seq_p, function(.) vector("list", p))
    # pMax is a matrix with one p-value per edge, at the beginning all p-values
    # are -Inf
    pMax <- matrix(-Inf, nrow = p, ncol = p)
    diag(pMax) <- 1
    done <- FALSE
    # ord is the size of the conditioning set
    ord <- 0L
    # n.edgetests is for recording how many cond. ind. tests have been conducted
    # in total
    n.edgetests <- numeric(1)
    # G is a (pxp)-matrix (each entry represents an edge and each edge is
    # represented twice); at the beginning, all elements are TRUE except for the
    # diagonal
    while (!done && any(G) && ord <= m.max) {
        # done is FALSE if for every remaining edge, the number of neighbours is
        # smaller than the new ord
        n.edgetests[ord1 <- ord + 1L] <- 0
        done <- TRUE
        # ind is a two-column matrix, each row represents an edge (indices of
        # both endpoints)
        ind <- which(G, arr.ind = TRUE)
        # the next command just reorders ind
        ind <- ind[order(ind[, 1]), ]
        # how many edges are remaining?
        remEdges <- nrow(ind)
        if (verbose) {
            cat("Order=", ord, "; remaining edges:", remEdges,
                "\n",
                sep = ""
            )
        }
        if (method == "stable") {
            # G is split into p vectors, each vector respresenting the neighbours
            # of one node
            G.l <- split(G, gl(p, p))
        }
        for (i in 1:remEdges) {
            # every edge is visited twice, so that each of the endpoints gets to
            # be the node whose neighbours are considered
            if (verbose && (verbose >= 2 || i %% 100 == 0)) {
                cat("|i=", i, "|iMax=", remEdges, "\n")
            }
            # endpoint 1 of current edge
            x <- ind[i, 1]
            # endpoint 2 of current edge
            y <- ind[i, 2]


            if (G[y, x] && !fixedEdges[y, x]) {
                print(paste0("x: ", labels[x], " y: ", labels[y]))
                print("G:")
                print(G)
         
                # only edges are considered that are still in the current skeleton
                # else go to next remaining edge
                # in nbrsBool, the neighbours of the current node are TRUE
                nbrsBool_x <- if (method == "stable") {
                    G.l[[x]]
                } #
                else {
                    G[, x]
                }

                nbrsBool_y <- if (method == "stable") {
                    G.l[[y]]
                } #
                else {
                    G[, y]
                }

                print("nbrsBool_x:")
                print(nbrsBool_x)
                print("nbrsBool_y:")
                print(nbrsBool_y)
                #################################################
                # this excludes neighbours in a later tier than x from the
                # conditioning set
                nbrsBool_x[tiers > tiers[x]] <- FALSE
                nbrsBool_y[tiers > tiers[y]] <- FALSE

                print("nbrsBool_x after tiers:")
                print(nbrsBool_x)
                print("nbrsBool_y after tiers:")
                print(nbrsBool_y)

                #################################################
                
                nbrsBool_x[y] <- FALSE
                nbrsBool_y[x] <- FALSE
                # nbrs contains the indices of all eligible neighbours
                nbrs_x <- seq_p[nbrsBool_x]
                nbrs_y <- seq_p[nbrsBool_y]

                print("Neighbours of x:")
                print(labels[nbrs_x])
                print("Neighbours of y:")
                print(labels[nbrs_y])
                # now find the R-variables and correspoding index of x and y (if they are not themselves R-variables)
                
               
                R_x_index <- which(labels[nbrs_x] == paste0("R_", labels[x]))
                R_y_index <- which(labels[nbrs_y] == paste0("R_", labels[y]))

                
                nbrsBool_Rx <- if (method == "stable") {
                    G.l[[R_x_index]]
                } #
                else {
                    G[[R_x_index]]
                }
                nbrsBool_Ry <- if (method == "stable") {
                    G.l[[R_y_index]]
                } #
                else {
                    G[[R_y_index]]
                }

                nbrsBool_Rx[tiers > tiers[R_x_index]] <- FALSE
                nbrsBool_Ry[tiers > tiers[R_y_index]] <- FALSE
                                # The neighbours of the R-variables for x and y:
                nbrsBool_Rx[x] <- FALSE
                nbrsBool_Ry[y] <- FALSE

                nbrs_Rx <- seq_p[nbrsBool_Rx]
                nbrs_Ry <- seq_p[nbrsBool_Ry]

                R_vars_x <- labels[nbrs_x[R_x_index]]
                R_vars_y <- labels[nbrs_y[R_y_index]]

                #print(paste0("R_x_index: ", R_x_index, " R_y_index: ", R_y_index))
                print(paste0("R_vars_x: ", R_vars_x, " R_vars_y: ", R_vars_y))
           


                # union of nbrs_x and nbrs_y
                nbrs_all <- union(nbrs_x, nbrs_y, nbrs_Rx, nbrs_Ry)

                # now remove the R- variables if the substantive variables are in the conditioning set
                nbrs <- nbrs_all #[!grepl("^R_", labels[nbrs_all])]
              
                length_nbrs <- length(nbrs)
                # next steps only possible if there are enough neighbours to form
                # conditioning sets of cardinality length_nbrs
                if (length_nbrs >= ord) { # else go to next remaining edge
                    if (length_nbrs > ord) {
                        # done is reset to FALSE if for any node with remaining edges,
                        # the number of neighbours is at least as large as the order
                        # that will come next
                        done <- FALSE
                    }
                    S <- seq_len(ord)
                    # split S into substantive and missingness variables

                    repeat { # the repeat loop goes over all subsets of the
                        # neighbours with length ord
                        n.edgetests[ord1] <- n.edgetests[ord1] + 1

                        S_fixed <- S
                        # Somewhere here we add back the R-variables if the variable in S has missingness.


                        # first chech if a corresponding missingess variable is in the conditioning set.
                        # if so, remove it from the conditioning set just to perform the test.
                        # This is motivated by the faithful observability assumption.
                        # X _|_ Y | R_X would be X _|_ Y
                        # Hovever, X _|_ R_Y | Y is not considered as it is not testable. Return pval=1 directly?
                        # It is hard to bann such relations in constraints
                        # For self-making missingness: R_X _|_ X we can bann edges X-R_X.

                        # check if the edge is forbidden
                        pval <- NULL
                        if (verbose) {
                            cat(
                                "\nTesting: x=", labels[x], " y=", labels[y], " S=", labels[nbrs[S_fixed]], "\n"
                            )
                        }

                        tmp <- get_S_substantive_and_missingness(S_fixed, nbrs)
                        S_substantive <- tmp$S_substantive
                        S_missingness <- tmp$S_missingness

                        R_x <- NULL
                        if (paste0("R_", labels[x]) %in% labels) {
                            R_x <- paste0("R_", labels[x])
                            R_x_index <- which(labels == R_x)
                        }

                        R_y <- NULL

                        if (paste0("R_", labels[y]) %in% labels) {
                            R_y <- paste0("R_", labels[y])
                            R_y_index <- which(labels == R_y)
                        }

                        print("R(x):")
                        print(R_x)
                        print("R(y):")
                        print(R_y)
                        print("S:")
                        print(labels[nbrs[S_fixed]])
                        print("S_substantive:")
                        print(labels[nbrs[S_substantive]])
                        print("S_missingness:")
                        print(labels[nbrs[S_missingness]])

                        # now get all missingness indicators of S and x and y
                        # And get theyr parents. This is the set to take all subsets of.
                        # we may need a anouther loop.
                        
                        # self_masking <- paste0("R_", labels[x]) == labels[y] || paste0("R_", labels[y]) == labels[x]

                        untestable <- NULL
                        faith_obs <- FALSE

                        # if R_X (or R_Y) is in the independent set, and X (or Y) is in the conditioning set, set pval=1
                        # check if some of x starts with R_
                        if (grepl("^R_", labels[x])) {
                            # print(paste0("Checking if substantive variable of ", labels[x], " is in the independent set"))
                            node_name <- gsub("^R_", "", labels[x])
                            S_index_node_name <- which(labels[S_fixed] == node_name)

                            # print(paste0("node_name: ", node_name))
                            # print(paste0("nbrs[S]: ", labels[nbrs[S]]))
                            if (node_name %in% labels[nbrs[S_fixed]]) {
                                print(paste0(labels[x], " is in the independent set, and ", node_name, " is in the conditioning set"))
                                # remove x from the conditioning set
                                print(paste0("Removing ", node_name, " from the conditioning set"))
                                S_fixed <- S_fixed[S_fixed != S_index_node_name]
                            }
                        }

                        if (grepl("^R_", labels[y])) {
                            # print(paste0("Checking if substantive variable of ", labels[y], " is in the independent set"))
                            node_name <- gsub("^R_", "", labels[y])
                            S_index_node_name <- which(labels[S_fixed] == node_name)
                            if (node_name %in% labels[nbrs[S_fixed]]) {
                                print(paste0(labels[y], " is in the independent set, and ", node_name, " is in the conditioning set"))
                                # remove y from the conditioning set
                                print(paste0("Removing ", node_name, " from the conditioning set"))
                                print(paste0("Current conditioning set: ", labels[nbrs[S_fixed]]))
                                S_fixed <- S_fixed[S_fixed != S_index_node_name]
                                print(paste0("New conditioning set: ", labels[nbrs[S_fixed]]))
                            }
                        }
                        # if the missingness variable of x or y is in the conditioning set, remove it from S
                        if (paste0("R_", labels[x]) %in% labels[nbrs[S]]) {
                            # print("Checking X")
                            # print(paste0("R_", labels[x], " is in the conditioning set"))

                            # get the index of the missingness variable in the conditioning set
                            index_missingness <- which(labels[S_fixed] == paste0("R_", labels[x]))
                            # print(paste0("index_missingness: ", index_missingness))

                            S_fixed <- S_fixed[S_fixed != index_missingness]
                            # print(paste0("Removed missingness variable from conditioning set: ", paste0(labels[index_missingness])))
                            # print(paste0("New conditioning set: ", labels[nbrs[S_faith_obs]]))
                            faith_obs <- TRUE
                        }

                        if (paste0("R_", labels[y]) %in% labels[nbrs[S_fixed]]) {
                            # print("Checking Y")
                            # print(paste0("R_", labels[y], " is in the conditioning set"))

                            # If one missingess variable was already removed above, we need to update the conditioning set
                            # S_tmp <- S
                            # if (faith_obs) {
                            ##    S_tmp <- S_faith_obs
                            # }
                            # print(paste0("nbrs[S]: ", labels[nbrs[S]]))
                            # get the index of the missingness variable in the conditioning set
                            index_missingness <- which(labels[S_fixed] == paste0("R_", labels[y]))
                            # print(paste0("index_missingness: ", index_missingness))
                            S_fixed <- S_fixed[S_fixed != index_missingness]
                            # print(paste0("Removed missingness variable from conditioning set: ", paste0("R_", labels[y])))
                            # print(paste0("New conditioning set: ", labels[nbrs[S_faith_obs]]))
                            faith_obs <- TRUE
                        }



                        if (faith_obs) {
                            print(paste0("Faithful observability assumption removes the missingness variable from the conditioning set for implmentational reasons: x=", labels[x], " y=", labels[y], " S=", labels[nbrs[S_fixed]]))
                            pval <- indepTest(x, y, nbrs[S_fixed], suffStat)
                        } else {
                            pval <- indepTest(x, y, nbrs[S_fixed], suffStat)
                        }

                        if (verbose) {
                            if (faith_obs) {
                                cat(
                                    "x=", labels[x], " y=", labels[y], " S=", labels[nbrs[S_fixed]],
                                    ": pval =", pval, "\n"
                                )
                            } else {
                                cat(
                                    "x=", labels[x], " y=", labels[y], " S=", labels[nbrs[S_fixed]],
                                    ": pval =", pval, "\n"
                                )
                            }
                        }

                        if (is.na(pval)) {
                            pval <- as.numeric(NAdelete)
                        }
                        # pMax is the maximum p-value of all the tests conditioning
                        # on different subsets of the neighbours
                        # what is pMax for?
                        if (pMax[x, y] < pval) {
                            pMax[x, y] <- pval
                        }
                        if (pval >= alpha) {
                            G[x, y] <- G[y, x] <- FALSE
                            sepset[[x]][[y]] <- nbrs[S]
                            break # exit repeat loop (?)
                        } else {
                            # chose ord elements from the neighbours as the new S
                            nextSet <- getNextSet( # TODO: Look at this function
                                length_nbrs, ord,
                                S
                            )
                            if (nextSet$wasLast) {
                                break
                            }
                            S <- nextSet$nextSet
                        }
                    } # end repeat
                } # end if
            } # end if
        } # end for
        ord <- ord + 1L
    }
    for (i in 1:(p - 1)) {
        for (j in 2:p) pMax[i, j] <- pMax[j, i] <- max(pMax[i, j], pMax[j, i])
    }
    Gobject <- if (sum(G) == 0) {
        new("graphNEL", nodes = labels)
    } else {
        colnames(G) <- rownames(G) <- labels
        as(G, "graphNEL")
    }
    new("pcAlgo",
        graph = Gobject, call = cl, n = integer(0),
        max.ord = as.integer(ord - 1), n.edgetests = n.edgetests,
        sepset = sepset, pMax = pMax, zMin = matrix(NA, 1, 1)
    )
}
