#' PC Algorithm Accounting for a Partial Node Ordering
#'
#' Like [pcalg::pc()], but takes into account a user-specified partial
#' ordering of the nodes/variables. This has two effects:
#' 1) The conditional independence between \code{x} and \code{y} given \code{S} is
#' ot tested if any variable in \code{S} lies in the future of both \code{x} and \code{y};
#' 2) edges cannot be oriented from a higher-order to a lower-order node. In addition,
#' the user may specify individual forbidden edges and context variables.
#'
#' @param suffStat A [base::list()] of sufficient statistics, containing all necessary
#' elements for the conditional independence decisions in the function [indepTest()].
#' @param indepTest A function for testing conditional independence. It is internally
#' called as \code{indepTest(x,y,S,suffStat)}, and tests conditional independence of
#' \code{x} and \code{y} given \code{S}. Here, \code{x} and \code{y} are variables, and
#' \code{S} is a (possibly empty) vector of variables (all variables are denoted by their
#' (integer) column positions in the adjacency matrix). \code{suffStat} is a list,
#' see the argument above. The return value of \code{indepTest} is the p-value of the
#' test for conditional independence.
#' @param alpha significance level (number in \emph{(0,1)} for the individual conditional
#' independence tests.
#' @param labels (optional) character vector of variable (or "node") names.
#' Typically preferred to specifying \code{p}.
#' @param p (optional) number of variables (or nodes). May be specified if \code{labels}
#' are not, in which case \code{labels} is set to \code{1:p}.
#' @param skel.method Character string specifying method; the default, "stable" provides
#' an order-independent skeleton, see [tpc::tskeleton()].
#' @param forbEdges A logical matrix of dimension p*p. If \code{[i,j]} is TRUE, then the
#' directed edge i->j is forbidden. If both \code{[i,j]} and \code{[j,i]} are TRUE, then any type of
#' edge between i and j is forbidden.
#' @param m.max Maximal size of the conditioning sets that are considered in the
#' conditional independence tests.
#' @param conservative Logical indicating if conservative PC should be used.
#' Defaults to FALSE. See [pcalg::pc()] for details.
#' @param maj.rule Logical indicating if the majority rule should be used. Defaults
#' to TRUE. See [pcalg::pc()] for details.
#' @param tiers Numeric vector specifying the tier / time point for each variable.
#' Must be of length 'p', if specified, or have the same length as 'labels', if specified.
#' A smaller number corresponds to an earlier tier / time point.
#' @param context.all Numeric or character vector. Specifies the positions or names
#' of global context variables. Global context variables have no incoming edges, i.e.
#' no parents, and are themselves parents of all non-context variables in the graph.
#' @param context.tier Numeric or character vector. Specifies the positions or
#' names of tier-specific context variables. Tier-specific context variables have no
#' incoming edges, i.e. no parents, and are themselves parents of all non-context variables
#' in the same tier.
#' @param verbose if \code{TRUE}, detailed output is provided.
#' @param numCores The numbers of CPU cores to be used.
#' @param cl.type The cluster type. Default value is \code{"PSOCK"}.
#' For High-performance clusters use \code{"MPI"}. See also \code{parallel::\link[parallel]{makeCluster}}.
#' @param clusterexport Character vector. Lists functions to be exported to nodes if numCores > 1.
#'
#' @details See \code{pcalg::\link[pcalg]{pc}} for further information on the PC algorithm.
#' The PC algorithm is named after its developers Peter Spirtes and Clark Glymour
#' (Spirtes et al., 2000).
#'
#' Specifying a tier for each variable using the \code{tier} argument has the
#' following effects:
#' 1) In the skeleton phase and v-structure learing phases,
#' conditional independence testing is restricted such that if x is in tier t(x)
#' and y is in t(y), only those variables are allowed in the conditioning set whose
#' tier is not larger than t(x).
#' 2) Following the v-structure phase, all
#' edges that were found between two tiers are directed into the direction of the
#' higher-order tier. If context variables are specified using \code{context.all}
#' and/or \code{context.tier}, the corresponding orientations are added in this step.
#'
#' @return An object of \code{\link[base]{class}} "\code{pcAlgo}"
#' (see [pcalg::pcalgo] containing an estimate of the equivalence class of
#' the underlying DAG.
#'
#' @author Original code by Markus Kalisch, Martin Maechler, and Diego Colombo.
#' Modifications by Janine Witte (Kalisch et al., 2012).
#'
#' @references   M. Kalisch, M. Maechler, D. Colombo, M.H. Maathuis and P. Buehlmann (2012).
#' Causal Inference Using Graphical Models with the R Package pcalg.
#' Journal of Statistical Software 47(11): 1--26.
#'
#' P. Spirtes, C. Glymour and R. Scheines (2000). Causation, Prediction,
#' and Search, 2nd edition. The MIT Press. https://philarchive.org/archive/SPICPA-2.
#'
#' @export
#'
#' @examples
#' # load simulated cohort data
#' data(dat_sim)
#' n <- nrow(dat_sim)
#' lab <- colnames(dat_sim)
#'
#' # estimate skeleton without taking background information into account
#' tpc.fit <- tpc(
#'     suffStat = list(C = cor(dat_sim), n = n),
#'     indepTest = gaussCItest, alpha = 0.01, labels = lab
#' )
#' pc.fit <- pcalg::pc(
#'     suffStat = list(C = cor(dat_sim), n = n),
#'     indepTest = gaussCItest, alpha = 0.01, labels = lab,
#'     maj.rule = TRUE, solve.conf = TRUE
#' )
#' identical(pc.fit@graph, tpc.fit@graph) # TRUE
#' # estimate skeleton with temporal ordering as background information
#' tiers <- rep(c(1, 2, 3), times = c(3, 3, 3))
#' tpc.fit2 <- tpc(
#'     suffStat = list(C = cor(dat_sim), n = n),
#'     indepTest = gaussCItest, alpha = 0.01, labels = lab, tiers = tiers
#' )
#'
#' tpc.fit3 <- tpc(
#'     suffStat = list(C = cor(dat_sim), n = n),
#'     indepTest = gaussCItest, alpha = 0.01, labels = lab, tiers = tiers,
#'     skel.method = "stable.parallel",
#'     numCores = 2, clusterexport = c("cor", "ecdf")
#' )
#'
#' if (requireNamespace("Rgraphviz", quietly = TRUE)) {
#'     data("true_sim")
#'     oldpar <- par(mfrow = c(1, 3))
#'     plot(true_sim, main = "True DAG")
#'     plot(tpc.fit, main = "PC estimate")
#'     plot(tpc.fit2, main = "tPC estimate")
#'     par(oldpar)
#' }
#'
#' # require that there is no edge between A1 and A1, and that any edge between A2 and B2
#' # or A2 and C2 is directed away from A2
#' forb <- matrix(FALSE, nrow = 9, ncol = 9)
#' rownames(forb) <- colnames(forb) <- lab
#' forb["A1", "A3"] <- forb["A3", "A1"] <- TRUE
#' forb["B2", "A2"] <- TRUE
#' forb["C2", "A2"] <- TRUE
#'
#' tpc.fit3 <- tpc(
#'     suffStat = list(C = cor(dat_sim), n = n),
#'     indepTest = gaussCItest, alpha = 0.01, labels = lab,
#'     forbEdges = forb, tiers = tiers
#' )
#'
#' if (requireNamespace("Rgraphviz", quietly = TRUE)) {
#'     # compare estimated CPDAGs
#'     data("true_sim")
#'     oldpar <- par(mfrow = c(1, 2))
#'     plot(tpc.fit2, main = "old tPC estimate")
#'     plot(tpc.fit3, main = "new tPC estimate")
#'     par(oldpar)
#' }
#' # force edge from A1 to all other nodes measured at time 1
#' # into the graph (note that the edge from A1 to A2 is then
#' # forbidden)
#' tpc.fit4 <- tpc(
#'     suffStat = list(C = cor(dat_sim), n = n),
#'     indepTest = gaussCItest, alpha = 0.01, labels = lab,
#'     tiers = tiers, context.tier = "A1"
#' )
#'
#' if (requireNamespace("Rgraphviz", quietly = TRUE)) {
#'     # compare estimated CPDAGs
#'     data("true_sim")
#'     plot(tpc.fit4, main = "alternative tPC estimate")
#' }
#'
#' # force edge from A1 to all other nodes into the graph
#' tpc.fit5 <- tpc(
#'     suffStat = list(C = cor(dat_sim), n = n),
#'     indepTest = gaussCItest, alpha = 0.01, labels = lab,
#'     tiers = tiers, context.all = "A1"
#' )
#'
#' if (requireNamespace("Rgraphviz", quietly = TRUE)) {
#'     # compare estimated CPDAGs
#'     data("true_sim")
#'     plot(tpc.fit5, main = "alternative tPC estimate")
#' }
#'
tpc <- function(suffStat, indepTest, alpha, labels, p,
                skel.method = c("stable", "stable.parallel"),
                forbEdges = NULL, m.max = Inf,
                conservative = FALSE, maj.rule = TRUE,
                tiers = NULL, context.all = NULL, context.tier = NULL,
                verbose = FALSE,
                numCores = NULL, cl.type = "PSOCK",
                clusterexport = NULL) {
    cl <- match.call()
    if (!missing(p)) {
        stopifnot(is.numeric(p), length(p <- as.integer(p)) == 1, p >= 2)
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
        } else {
            message("No need to specify 'p', when 'labels' is given")
        }
    }

    if (is.null(tiers)) {
        ## if no tiers are specified, everything is tier 1
        tiers <- rep(1, p)
    } else {
        ## check if 'tiers' are correctly specified
        if (!is.numeric(tiers)) {
            stop("'tiers' must be a numeric vector")
        }
        if (length(tiers) != p) {
            stop("length of 'tiers' does not match 'p' or length of 'labels'")
        }
    }

    if (!is.null(context.all)) {
        if (is.character(context.all)) {
            if (!all(context.all %in% labels)) {
                stop("'context.all' includes variable names not in 'labels'")
            }
            context.all <- which(labels %in% context.all)
        }

        if (is.numeric(context.all)) {
            if (!all(context.all %in% (1:p))) {
                stop("'context.all' contains elements that are smaller than 1 or larger than 'p'")
            }
            if (!all(tiers[context.all] == min(tiers))) {
                stop("'context.all' variables must be in the first tier")
            }
        } else {
            stop("'context.all' must be an integer vector or character vector")
        }
    }

    if (!is.null(context.tier)) {
        if (is.character(context.tier)) {
            if (!all(context.tier %in% labels)) {
                stop("'context.tier' includes variable names not in 'labels'")
            }
            context.tier <- which(labels %in% context.tier)
        }
        if (is.numeric(context.tier)) {
            if (!all(context.tier %in% 1:p)) {
                stop("'context.tier' contains elements that are smaller than 1 or larger than 'p'")
            }
        } else {
            stop("'context.tier' must be a numeric or character vector")
        }
    }

    if (!is.null(context.tier) & !is.null(context.all)) {
        if (length(intersect(context.tier, context.all)) > 0) {
            stop(paste(
                "The following variables are in both 'context.tier' and 'context.all': ",
                paste(intersect(context.tier, context.all), collapse = ",")
            ))
        }
    }


    if (conservative && maj.rule) {
        stop("Choose either conservative PC or majority rule PC!")
    }
    if ((!conservative) && (!maj.rule)) {
        stop("Choose one of conservative PC and majority rule PC!")
    }

    if (!is.null(numCores) & is.null(cl.type)) stop("Specify cluster type.")


    ## generate fixedEdges and fixedGaps according to context.all and context.tier
    fixedEdges <- matrix(FALSE, p, p)
    fixedGaps <- matrix(FALSE, p, p)

    ## context.all
    if (!is.null(context.all)) {
        for (i in context.all) {
            fixedEdges[i, ] <- TRUE
            fixedEdges[, i] <- TRUE
            for (j in context.all) {
                fixedEdges[i, j] <- FALSE
                fixedEdges[j, i] <- FALSE
                fixedGaps[i, j] <- TRUE
                fixedGaps[j, i] <- TRUE
            }
        }
    }
    ## context.tier
    if (!is.null(context.tier)) {
        for (i in context.tier) {
            for (j in c(context.tier, context.all)) {
                fixedGaps[i, j] <- TRUE
                fixedGaps[j, i] <- TRUE
            }
            k <- tiers[i]
            fixedEdges[i, tiers == k] <- TRUE
            fixedEdges[tiers == k, i] <- TRUE
            fixedGaps[i, tiers != k] <- TRUE
            fixedGaps[tiers != k, i] <- TRUE
        }
    }

    if (!is.null(forbEdges)) {
        ## check if forbEdges contradicts context.tier or context.all
        checkMatrix <- fixedEdges
        for (i in context.all) {
            checkMatrix[, i] <- FALSE
        }
        for (i in context.tier) {
            k <- tiers[i]
            checkMatrix[tiers == k, i] <- FALSE
        }

        if (sum(checkMatrix * forbEdges) > 0) {
            ConflictList <- which((checkMatrix * forbEdges) > 0, arr.ind = TRUE)
            ConflictList[, 1] <- labels[ConflictList[, 1]]
            ConflictList[, 2] <- labels[as.numeric(ConflictList[, 2])]
            colnames(ConflictList) <- NULL
            cat("Note: 'forbEdges' overrules 'context.tier' and 'context.all'.
          Edges between the following pairs of nodes are forbidden by
          'forbEdges' even though 'context.tier' and/or 'context.all'
          suggest they should be present:\n")
            print(ConflictList)
        }

        ## matrix of forbidden adjacencies (no type of edge allowed between a and
        ## b):
        forbAdj <- forbEdges * t(forbEdges)

        ## modify fixedEdges and fixedGaps according to forbEdges
        fixedGaps <- (fixedGaps + forbAdj) > 0
        fixedEdges <- (fixedEdges - forbAdj) > 0

        ## generate list of forbidden arrows (where the other direction is allowed)
        forbArrows <- forbEdges - forbEdges * t(forbEdges)
        forbArrowsL <- which(forbArrows > 0, arr.ind = TRUE)
        forbArrowList <- lapply(
            seq_len(nrow(forbArrowsL)),
            function(i) forbArrowsL[i, ]
        )
    } else {
        forbArrowList <- list()
    }

    # skel.method <- "stable"
    skel.method <- match.arg(skel.method)

    # skel <- tskeleton(suffStat, indepTest, alpha, labels = labels,
    #                   method = skel.method, m.max = m.max,
    #                   fixedGaps = fixedGaps, fixedEdges = fixedEdges,
    #                   tiers = tiers, verbose = verbose)
    #
    # skel@call <- cl

    if (skel.method == "stable.parallel") {
        if (is.null(numCores)) {
            stop("Please specify 'numCores'.")
        }
        skel <- tskeleton_parallel(suffStat, indepTest, alpha,
            labels = labels,
            method = skel.method,
            fixedGaps = fixedGaps,
            fixedEdges = fixedEdges,
            tiers = tiers,
            m.max = m.max, verbose = verbose,
            numCores = numCores,
            cl.type = cl.type,
            clusterexport = clusterexport
        )
    } else {
        print("Running tskeleton_ic")
        skel <- tskeleton_ic(suffStat, indepTest, alpha,
            labels = labels,
            method = skel.method, fixedGaps = fixedGaps, fixedEdges = fixedEdges,
            m.max = m.max, verbose = verbose, tiers = tiers
        )
    }

    print("******* Phase I done *****.")
    print("skeleton:")
    print(as(skel@graph, "matrix"))
    skel@call <- cl

    if (numEdges(skel@graph) == 0) {
        return(skel)
    }
    print("****** Phase II starting ******")
    print("suffstat")
    print(head(suffStat))
    ## step II, orientation of v-structures:
    skelII <- tpc.cons.intern(skel, suffStat, indepTest, alpha,
        version.unf = c(2, 1), maj.rule = maj.rule,
        verbose = verbose, tiers = tiers, context.all = context.all, context.tier = context.tier,
        forbEdges = forbEdges, labels = labels
    )

    print("*** Phase III")
    ## step III, orientation of edges between tiers:
    gIII <- as(skelII$sk@graph, "matrix")
    for (t in unique(tiers)) {
        gIII[tiers > t, tiers == t] <- 0
    }
    ## context variables:
    for (i in context.all) {
        gIII[, i] <- 0
    }
    for (i in context.tier) {
        k <- tiers[i]
        gIII[tiers == k, i] <- 0
    }
    ## edges in forbArrowList:
    for (r in forbArrowList) {
        gIII[r[1], r[2]] <- 0
    }

    print("**** Phase IV")
    # step IV, Meek's rules
    skelIII <- skelII$sk
    skelIII@graph <- as(gIII, "graphNEL")
    MeekRules(skelIII,
        verbose = verbose, unfVect = skelII$unfTripl,
        solve.confl = TRUE
    )
}
