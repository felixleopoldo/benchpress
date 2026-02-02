#' Tiered PC Algorithm
#'
#' Constraint-based causal discovery using the PC algorithm while accounting for a
#' partial node ordering, e.g. a partial temporal ordering when the data were
#' collected in different waves of a cohort study.
#' Andrews RM, Foraita R, Didelez V, Witte J (2021) <arXiv:2108.13395>
#' provide a guide how to use tpc to analyse cohort data.
#'
#' @docType package
#'
#' @keywords internal
#' @aliases tpc-package
"_PACKAGE"

utils::globalVariables(c("remEdges"))

## usethis namespace: start
#' @importFrom graph numEdges
#' @importFrom graphics legend
#' @importFrom methods as new
#' @importFrom parallel clusterEvalQ clusterExport makeCluster parLapply stopCluster
#' @import pcalg
#' @importFrom utils combn
#  use_import_from("parallel", 'makeCluster')
## usethis namespace: end
NULL
