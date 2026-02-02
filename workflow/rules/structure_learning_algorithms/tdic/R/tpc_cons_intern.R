#' Utility for Conservative and Majority Rule in tpc
#'
#' Like \code{pcalg::\link[pcalg]{pc.cons.intern}}, but takes into account the
#' user-specified partial node/variable ordering.
#'
#' @param sk A skeleton object as returned from \code{pcalg::\link[pcalg]{skeleton}}.
#' @param suffStat Sufficient statistic: List containing all relevant elements for
#' the conditional independence decisions.
#' @param indepTest Pre-defined \code{\link[base]{function}} for testing conditional
#' independence. The function is internally called as \code{indepTest(x,y,S,suffStat)},
#' and tests conditional independence of \code{x} and \code{y} given \code{S}.
#' Here, \code{x} and \code{y} are variables, and \code{S} is a (possibly empty) vector of
#' variables (all variables are denoted by their (integer) column positions in the
#' adjacency matrix). The return value of \code{indepTest} is the p-value of the test for
#' conditional independence.
#' @param alpha Significance level for the individual conditional independence tests.
#' @param version.unf Vector of length two. If \code{version.unf[2]==1}, the inititial
#' separating set found by the PC/FCI algorithm is added to the set of separating sets;
#' if \code{version.unf[2]==2}, it is not added. In the latter case, if the set of
#' separating sets is empty, the triple is marked as unambiguous if \code{version.unf[1]==1},
#' and as ambiguous if \code{version.unf[1]==2}.
#' @param maj.rule Logical indicating if the triples are checked for ambiguity using the
#' majority rule idea, which is less strict than the standard conservative method.
#' @param forbEdges A logical matrix of dimension \code{p*p}. If \code{[i,j]} is TRUE,
#' then the directed edge \code{i -> j} is forbidden. If both \code{[i,j]} and \code{[j,i]}
#' are TRUE, then any type of edge between \code{i} and \code{j} is forbidden.
#' @param tiers Numeric vector specifying the tier / time point for each variable.
#' A smaller number corresponds to an earlier tier / time point.
#' @param context.all Numeric or character vector. Specifies the positions or names
#' of global context variables. Global context variables have no incoming edges,
#' i.e. no parents, and are themselves parents of all non-context variables in the graph.
#' @param context.tier Numeric or character vector. Specifies the positions or names of
#' tier-specific context variables. Tier-specific context variables have no incoming edges,
#' i.e. no parents, and are themselves parents of all non-context variables in the same tier.
#' @param verbose Logical asking for detailed output.
#'
#' @details See \code{pcalg::\link[pcalg]{pc.cons.intern}} for further information on the
#' majority and conservative approaches to learning v-structures.
#'
#' Specifying a tier for each variable using the \code{tier} argument has the
#' following effects:
#'
#' 1) Only those triples \code{x-y-z} are considered as potential v-structures that
#' satisfy \code{t(y)=max(t(x),t(z))}. This allows for three constellations: either \code{y} is
#' in the same tier as \code{x} and both are later than \code{z}, or \code{y} is in the same tier as z
#' and both are later than \code{x}, or all three are in the same tier. Triples where \code{y} is
#' earlier than one or both of \code{x} and \code{z} need not be considered, as \code{y} being a
#' collider would be against the partial ordering. Triples where \code{y} is later than
#' both \code{x} and \code{z} will be oriented later in the pc algorithm and are left out here to
#' minimize the number of conditional independence tests.
#'
#' 2) Conditional independence testing is restricted such that if \code{x} is in tier \code{t(x)}
#' and \code{y} is in \code{t(y)}, only those variables are allowed in the conditioning set whose
#' tier is not larger than \code{t(x)}.
#'
#' Context variables specified via \code{context.all} or \code{context.tier} are
#' not considered as candidate colliders or candidate parents of colliders.
#'
#' @return
#' \describe{
#' \item{unfTripl}{numeric vector of triples coded as numbers (via \code{pcalg::triple2numb})
#' that were marked as ambiguous.}
#' \item{sk}{The updated skeleton-object (separating sets might have been updated).}}
#'
#' @author Original code by Markus Kalisch and Diego Colombo. Modifications by Janine Witte.
#'
#' @export
#'
tpc.cons.intern <- function(
    sk, suffStat, indepTest, alpha, version.unf = c(NA, NA),
    maj.rule = FALSE, forbEdges = NULL, tiers = NULL,
    context.all = NULL, context.tier = NULL, verbose = FALSE, labels = NULL) {
    orientConflictCollider <- function(pdag, x, y, z) {
        if (pdag[x, y] == 1) {
            pdag[y, x] <- 0
        } else {
            pdag[x, y] <- pdag[y, x] <- 2
        }
        if (pdag[z, y] == 1) {
            pdag[y, z] <- 0
        } else {
            pdag[z, y] <- pdag[y, z] <- 2
        }
        pdag
    }

    g <- as(sk@graph, "matrix")
    stopifnot(all(g == t(g)))
    p <- as.numeric(dim(g)[1])
    if (is.null(tiers)) {
        tiers <- rep(1, p)
    }
    # initiate list of ambiguous triples
    unfTripl <- vers <- rep(NA, min(p * p, 1e+05))
    # the counter counts the number of ambiguous triples
    counter <- 0
    if (sum(g) > 0) {
        # indices of edges (each edge is listed twice)
        ind <- which(g == 1, arr.ind = TRUE)
        # context variables can never be colliders
        ind <- ind[!(ind[, 2] %in% union(context.all, context.tier)), , drop = FALSE]
        # context varialbes do not need to be considered as potential collider parents
        ind <- ind[!(ind[, 1] %in% union(context.all, context.tier)), , drop = FALSE]

        tripleMatrix <- matrix(NA, nrow = 0, ncol = 4)
        # go through all edges until tripleMatrix contains all unshielded triples
        for (i in seq_len(nrow(ind))) {
            a <- ind[i, 1] # candidate 'left-hand' parent of collider
            b <- ind[i, 2] # candidate collider
            allC <- setdiff(which(g[b, ] == 1), a) # candidate 'right-hand' parents of collider
            newC <- allC[g[a, allC] == 0] # only those where candidate parents are not neighbours
            newC <- setdiff(newC, union(context.all, context.tier)) # exclude context variables
            tmpMatrix <- cbind(rep(a, length(newC)), rep(b, length(newC)), newC, rep(0, length(newC))) # added the zeros
            # add these triples to tripleMatrix
            tripleMatrix <- rbind(tripleMatrix, tmpMatrix)
            colnames(tripleMatrix) <- c("", "", "", "") # added a forth ""
        }
        if ((m <- nrow(tripleMatrix)) > 0) {
            # delete duplicates by only keeping those triples where candidate 'left-hand' parent has smaller node ID than candidate 'right-hand' parent
            deleteDupl <- logical(m)
            for (i in seq_len(m)) {
                if (tripleMatrix[i, 1] > tripleMatrix[i, 3]) {
                    deleteDupl[i] <- TRUE
                }
            }
            if (any(deleteDupl)) {
                tripleMatrix <- tripleMatrix[!deleteDupl, , drop = FALSE]
            }

            # delete triples where forbEdges[a,b]==1 (a->b forbidden) or forbEdges[c,b]==TRUE (b<-c forbidden)
            if (!is.null(forbEdges)) {
                m2 <- nrow(tripleMatrix)
                deleteForb <- logical(m2)
                for (i in seq_len(m2)) {
                    if (forbEdges[tripleMatrix[i, 1], tripleMatrix[i, 2]]) {
                        deleteForb[i] <- TRUE
                    }
                    if (forbEdges[tripleMatrix[i, 3], tripleMatrix[i, 2]]) {
                        deleteForb[i] <- TRUE
                    }
                }
                if (any(deleteForb)) {
                    tripleMatrix <- tripleMatrix[!deleteForb, , drop = FALSE]
                }
            }


            # now go through all triples in earnest
            # mark the ones ot be oriented with '1' in column 4
            # add the ambiguous ones to unfTripl
            for (i in seq_len(nrow(tripleMatrix))) {
                # add extra place holders if necessary
                if (counter + 1L == length(unfTripl)) {
                    n.xtra <- min(p * p, 1e+05)
                    new.len <- counter + 1L + n.xtra
                    length(unfTripl) <- new.len
                }

                a <- tripleMatrix[i, 1]
                b <- tripleMatrix[i, 2] # candidate collider
                c <- tripleMatrix[i, 3]
                ############################# new code
                # go to next triple if the candidate collider is a context variable, or against the time structure
                if (b %in% union(context.all, context.tier)) {
                    next
                }
                if (tiers[b] != max(tiers[a], tiers[c])) {
                    next
                }
                ############################# end new code

                # find all neighbours of candidate parents for the new independence tests
                nbrsA <- which(g[, a] != 0)
                nbrsC <- which(g[, c] != 0)

                ############################# new code
                # neighbours in the future of both candidate parents are excluded
                nbrsA <- intersect(nbrsA, which(tiers <= tiers[a]))
                nbrsC <- intersect(nbrsC, which(tiers <= tiers[c]))
                ############################# end new code
                if (verbose) {
                    cat(
                        "\nTriple:", labels[a], "-", labels[b], "-", labels[c], "and sepset by skelet:",
                        unique(sk@sepset[[a]][[c]], sk@sepset[[c]][[a]]),
                        "\n"
                    )
                }

                # for the untestable triples,eg R_X _|_ X, we set r.abc$decision to 1
                #
                r.abc <- list(decision = NULL, version = NULL)
                # check if labels[a] starts with R_ and if labels[c] is labels[a] without the R_ prefix
                if (grepl("^R_", labels[a]) && labels[c] == gsub("^R_", "", labels[a])) {
                    
                    r.abc$decision <- 1
                    print(paste("Untestable triple:", labels[a], "-", labels[b], "-", labels[c]))
                }
                # and same for labels[c]
                if (grepl("^R_", labels[c]) && labels[a] == gsub("^R_", "", labels[c])) {
                    r.abc$decision <- 1
                    print(paste("Untestable triple:", labels[a], "-", labels[b], "-", labels[c]))
                }

                if (is.null(r.abc$decision)) {
                    # checkTriple goes through all subsets of nbrsA and nbrsC
                    r.abc <- tcheckTriple(a, b, c, nbrsA, nbrsC, sk@sepset[[a]][[c]],
                        sk@sepset[[c]][[a]],
                        suffStat = suffStat, indepTest = indepTest,
                        alpha = alpha, version.unf = version.unf, maj.rule = maj.rule,
                        verbose = verbose, labels = labels
                    )
                    if (r.abc$decision == 3) { # decision 3 is ambiguous
                        # add ambiguous triple to unfTripl
                        counter <- counter + 1
                        unfTripl[counter] <- triple2numb(p, a, b, c)
                        vers[counter] <- r.abc$version
                    }
                    if ((version.unf[1] == 2) && (r.abc$version == 2) && (r.abc$decision != 3)) {
                        # this triple is added to unfTripl because a and c are not independent given any subset of their neighbours
                        counter <- counter + 1
                        unfTripl[counter] <- triple2numb(p, a, b, c)
                        vers[counter] <- r.abc$version
                    }
                    ############################# new code
                    # mark this triple as 'to be oriented' if it meets the assumptions
                    if ((r.abc$decision == 1) &&
                        ((version.unf[1] == 1) | (version.unf[1] == 2) & r.abc$version == 1)) {
                        tripleMatrix[i, 4] <- 1
                    }
                }
                ############################# end new code
            }
        }

        ############################# new code
        tripleMatrix <- tripleMatrix[tripleMatrix[, 4] == 1, , drop = FALSE]
        if (nrow(tripleMatrix) > 0) {
            pdag <- g
            for (i in 1:nrow(tripleMatrix)) {
                x <- tripleMatrix[i, 1]
                y <- tripleMatrix[i, 2]
                z <- tripleMatrix[i, 3]
                pdag <- orientConflictCollider(pdag, x, y, z)
            }
            sk@graph <- as(pdag, "graphNEL")
        }
        ############################# end new code
    }
    length(unfTripl) <- counter
    return(list(unfTripl = unfTripl, sk = sk))
}
