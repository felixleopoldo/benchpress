.pooled_is_discrete <- function(x) {
    is.factor(x) || is.logical(x)
}

#' Attach a \code{"test_used"} tag to a CI-test p-value.
.tag_test <- function(p, test_used) {
    attr(p, "test_used") <- test_used
    p
}

.pooled_test_frame <- function(data, x, y, S) {
    cols <- c(x, y, S)
    dat <- data[, cols, drop = FALSE]
    dat <- dat[stats::complete.cases(dat), , drop = FALSE]
    if (ncol(dat) > 2L) {
        keep <- vapply(seq_len(ncol(dat)), function(j) {
            if (j <= 2L) {
                return(TRUE)
            }
            length(unique(dat[[j]])) > 1L
        }, logical(1L))
        dat <- dat[, keep, drop = FALSE]
    }
    if (nrow(dat) < 3L) {
        return(NULL)
    }
    dat
}

.pooled_partial_f_ci <- function(response, add_terms, s_terms, dat) {
    rhs_full <- unique(c(add_terms, s_terms))
    rhs_red <- unique(s_terms)

    f_full <- if (length(rhs_full) == 0L) {
        stats::as.formula(paste(response, "~ 1"))
    } else {
        stats::as.formula(paste(response, "~", paste(rhs_full, collapse = " + ")))
    }
    f_red <- if (length(rhs_red) == 0L) {
        stats::as.formula(paste(response, "~ 1"))
    } else {
        stats::as.formula(paste(response, "~", paste(rhs_red, collapse = " + ")))
    }

    if (identical(deparse(f_full), deparse(f_red))) {
        return(NA_real_)
    }

    fit_full <- tryCatch(stats::lm(f_full, data = dat), error = function(e) NULL)
    fit_red <- tryCatch(stats::lm(f_red, data = dat), error = function(e) NULL)
    if (is.null(fit_full) || is.null(fit_red)) {
        return(NA_real_)
    }

    a <- tryCatch(stats::anova(fit_red, fit_full), error = function(e) NULL)
    if (is.null(a) || nrow(a) < 2L) {
        return(NA_real_)
    }
    p <- a$`Pr(>F)`[2L]
    if (is.na(p)) {
        return(NA_real_)
    }
    p
}

#' Pooled CI test for mixed data.
#'
#' When at least one endpoint is continuous, the continuous variable is the lm
#' response and the test is a partial F-test (\code{test_used = "mixed_lm_f"}).
#'
#' When both endpoints are discrete but the conditioning set contains a
#' continuous variable, there is no continuous response for the pooled lm, so the
#' test falls back to the conditional-Gaussian likelihood-ratio test
#' (\code{micd::mixCItwd}, the Andrews & Ramsey style CG test), exactly as the
#' original \code{flexCItwd} did. This supports discrete children of continuous
#' parents (e.g. medication conditioned on age). Tagged \code{"mixed_cg_lrt"}.
pooledMixedCItest <- function(x, y, S, data) {
    x_discrete <- .pooled_is_discrete(data[[x]])
    y_discrete <- .pooled_is_discrete(data[[y]])

    if (x_discrete && y_discrete) {
        return(.tag_test(
            micd::mixCItwd(x = x, y = y, S = S, suffStat = data),
            "mixed_cg_lrt"
        ))
    }

    dat <- .pooled_test_frame(data, x, y, S)
    if (is.null(dat)) {
        return(.tag_test(NA_real_, "mixed_lm_f"))
    }

    x_name <- names(data)[x]
    y_name <- names(data)[y]
    s_names <- if (length(S) > 0L) names(data)[S] else character(0L)
    s_names <- s_names[s_names %in% names(dat)]
    s_names <- setdiff(s_names, c(x_name, y_name))

    if (!x_discrete && !y_discrete) {
        return(.tag_test(.pooled_partial_f_ci(x_name, y_name, s_names, dat), "mixed_lm_f"))
    }
    if (x_discrete && !y_discrete) {
        return(.tag_test(.pooled_partial_f_ci(y_name, x_name, s_names, dat), "mixed_lm_f"))
    }
    .tag_test(.pooled_partial_f_ci(x_name, y_name, s_names, dat), "mixed_lm_f")
}
