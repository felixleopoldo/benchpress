#' Sparsity diagnostics for conditional independence tests (logging only).
#'
#' Mirrors test-wise deletion and (for discrete tests) dropping constant
#' conditioning columns, as in \code{micd::disCItwd}.

#' @param suffStat Data frame or \code{list(dm = ...)} passed to \code{indepTest}.
#' @param x,y Integer column indices of the endpoints.
#' @param S Integer vector of conditioning column indices (possibly empty).
#' @return Named numeric vector with \code{min_cell} and \code{n_table_cells}.
#'   \code{min_cell} is the minimum observed cell count in the relevant table;
#'   \code{NA} for all-continuous tests. \code{n_table_cells} is the number of
#'   non-empty cells in that table.
#' @export
ci_test_sparsity_diagnostics <- function(suffStat, x, y, S = integer(0)) {
    out <- c(min_cell = NA_integer_, n_table_cells = NA_integer_)
    df <- .ci_extract_test_frame(suffStat, x, y, S)
    if (is.null(df) || nrow(df) < 2L) {
        return(out)
    }
    df <- .ci_drop_constant_conditioners(df)
    disc <- vapply(df, .ci_is_discrete_col, logical(1L))
    if (!any(disc)) {
        return(out)
    }
    if (all(disc)) {
        counts <- as.vector(do.call(table, df))
    } else {
        disc_df <- df[, disc, drop = FALSE]
        if (ncol(disc_df) == 0L) {
            return(out)
        }
        counts <- if (ncol(disc_df) == 1L) {
            as.vector(table(disc_df[[1L]]))
        } else {
            as.vector(table(interaction(disc_df, drop = TRUE)))
        }
    }
    out["min_cell"] <- as.integer(min(counts))
    out["n_table_cells"] <- as.integer(length(counts))
    out
}

.ci_extract_test_frame <- function(suffStat, x, y, S) {
    if (is.list(suffStat) && !is.null(suffStat$dm)) {
        dat <- suffStat$dm
    } else if (is.data.frame(suffStat)) {
        dat <- suffStat
    } else {
        return(NULL)
    }
    cols <- c(x, y, S)
    dat <- dat[, cols, drop = FALSE]
    dat[complete.cases(dat), , drop = FALSE]
}

.ci_drop_constant_conditioners <- function(df) {
    if (ncol(df) <= 2L) {
        return(df)
    }
    keep <- vapply(seq_len(ncol(df)), function(j) {
        if (j <= 2L) {
            return(TRUE)
        }
        length(unique(df[[j]])) > 1L
    }, logical(1L))
    df[, keep, drop = FALSE]
}

.ci_is_discrete_col <- function(col) {
    is.factor(col) || is.logical(col)
}

#' Whether sparsity diagnostics meet a minimum cell-count threshold.
#'
#' @param sparsity Named vector from \code{ci_test_sparsity_diagnostics()}.
#' @param minCell Minimum acceptable \code{min_cell}; not used when \code{NULL}.
#' @return \code{TRUE} if the threshold is satisfied or not applicable
#'   (\code{min_cell} is \code{NA}, e.g. all-continuous tests).
#' @export
ci_test_min_cell_ok <- function(sparsity, minCell) {
    mc <- sparsity[["min_cell"]]
    is.na(mc) || mc >= minCell
}
