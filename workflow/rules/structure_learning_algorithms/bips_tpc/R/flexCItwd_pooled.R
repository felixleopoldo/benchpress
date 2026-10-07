#' Like flexCItwd, but mixed tests use pooled lm instead of mixCItwd.
#'
#' All-continuous and all-discrete branches are unchanged from flexCItwd.
#' Mixed tests use pooledMixedCItest (linear models only; no logistic regression).
#'
#' The returned p-value carries a \code{"test_used"} attribute recording which
#' branch ran: \code{"gauss"} (all-continuous), \code{"disc_gsq"} (all-discrete
#' G-square), \code{"mixed_lm_f"} (mixed, pooled lm partial F-test), or
#' \code{"mixed_cg_lrt"} (both endpoints discrete with a continuous conditioner,
#' conditional-Gaussian LRT via \code{micd::mixCItwd}).
#' \code{.tag_test} is defined in \code{pooled_mixed_ci.R} (sourced first).

flexCItwd_pooled <- function(x, y, S = NULL, data, labels = NULL) {
    conpos <- Rfast::which.is(data, "numeric")
    dispos <- Rfast::which.is(data, "factor")

    if (all(c(x, y, S) %in% conpos)) {
        x2 <- as.numeric(which(conpos %in% x))
        y2 <- as.numeric(which(conpos %in% y))
        S2 <- if (is.null(S)) {
            S
        } else {
            which(conpos %in% S)
        }
        return(.tag_test(
            micd::gaussCItwd(x = x2, y = y2, S = S2, suffStat = data[, conpos]),
            "gauss"
        ))
    }

    if (all(c(x, y, S) %in% dispos)) {
        if (!is.null(labels) && length(S) > 0L && any(grepl("^R_", labels[S]))) {
            S <- S[!grepl("^R_", labels[S])]
        }

        disc_data <- lapply(data[, dispos, drop = FALSE], function(col) {
            col <- as.integer(col)
            if (min(col, na.rm = TRUE) != 0L) {
                col - min(col, na.rm = TRUE)
            } else {
                col
            }
        })
        disc_data <- do.call(cbind, disc_data)

        x2 <- as.numeric(which(dispos %in% x))
        y2 <- as.numeric(which(dispos %in% y))
        S2 <- if (is.null(S)) {
            S
        } else {
            which(dispos %in% S)
        }
        suffStat <- list(dm = disc_data, adaptDF = TRUE)
        return(.tag_test(
            micd::disCItwd(x = x2, y = y2, S = S2, suffStat = suffStat),
            "disc_gsq"
        ))
    }

    pooledMixedCItest(x, y, S, data)
}
