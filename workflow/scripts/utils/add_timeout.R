library(R.utils)
add_timeout <- function(wrapper) {

  if (snakemake@wildcards[["timeout"]] == "None") {
    wrapper()
  } else {
    res <- NULL
    tryCatch({
      res <- withTimeout({
        wrapper()
      },
        timeout = snakemake@wildcards[["timeout"]]
      )
    },
    TimeoutException = function(ex) {
      message(paste("Timeout after ", snakemake@wildcards[["timeout"]],
        " seconds. Writing empty graph and time files.",
        sep = ""
      ))
      file.create(file.path(snakemake@output[["adjmat"]]))
      cat("None", file = snakemake@output[["time"]], sep = "\n")
      cat("None", file = snakemake@output[["ntests"]], sep = "\n")
    }
  )
  }
}
