library(R.utils)

# Helper functions

# Convert a string accoding to a given function, or NULL if the string is "None"
convert_or_null <- function(x, func) {
  if (x == "None") {
    return(NULL)
  } else {
    return(func(x))
  }
}

# Adds a timeout to a function. If the timeout is reached, an empty graph and time file are written.
add_timeout <- function(wrapper) {
  if (snakemake@wildcards[["timeout"]] == "None") {
    wrapper()
  } else {
    res <- NULL
    tryCatch(
      {
        res <- withTimeout(
          {
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
