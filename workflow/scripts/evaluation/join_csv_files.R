# Joins the benchmark results from an algorithms into one file

library(dplyr)

fix_columns <- function(df) {
  df <- na_if(df, "None")

  if ("plus1it" %in% colnames(df)) {
    df["plus1it"] <- as.numeric(df["plus1it"])
  }
  if ("posterior" %in% colnames(df)) {
    df["posterior"] <- as.numeric(df["posterior"])
  }
  if ("penalty" %in% colnames(df)) {
    df["penalty"] <- as.numeric(df["penalty"])
  }
  if ("clq" %in% colnames(df)) {
    df["clq"] <- as.numeric(df["clq"])
  }
  if ("sep" %in% colnames(df)) {
    df["sep"] <- as.numeric(df["sep"])
  }
  return(df)
}

df <- data.frame()

for (filename in snakemake@input[["res"]]) {
  tmpdf <- read.csv(filename, na.strings=c("None") ) 
  tmpdf <- fix_columns(tmpdf)
  df <- dplyr::bind_rows(df, tmpdf)
}

output = snakemake@output[[1]]
write.csv(df, file = output, row.names = FALSE)

# This removes the seed from the adjmat and bn columns to enable proper grouping 
# when plotting. Otherwise every seed gets its own group which is not meaningful.
system(paste("sed --in-place 's/\\/seed=[0-9]\\+//g' ", output, delimiter = ""))