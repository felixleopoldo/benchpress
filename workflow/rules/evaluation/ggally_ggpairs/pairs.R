library(GGally)

myFun <- function(n = 5000) {
    a <- do.call(paste0, replicate(5, sample(LETTERS, n, TRUE), FALSE))
    paste0(a, sprintf("%04d", sample(9999, n, TRUE)), sample(LETTERS, n, TRUE))
}

lowerFn <- function(data, mapping, method = "lm", ...) {
    p <- ggplot(data = data, mapping = mapping) +
        geom_point(alpha = 0.8) +
        geom_smooth(method = method, color = "red", ...)
    p
}

filename <- myFun(n = 1) # temporary filemane
filename <- paste(filename[1], ".png", sep = "")
png(file = filename, width = 1500, height = 1500)

df <- read.csv(snakemake@input[["data"]], check.names = FALSE)[-1, ]
title <- paste("Graph: ", snakemake@wildcards[["adjmat"]], "\n",
    "Parameters: ", snakemake@wildcards[["bn"]], "\n",
    "Data: ", snakemake@wildcards[["data"]], "\n",
    sep = ""
)
datatype <- class(sum(na.omit(df[, 1])))
# apply that to all columns first row

if (datatype == "integer") {
    df <- df[-1, ]
    df[] <- lapply(df, factor)
    ggpairs(df,
        upper = list(continuous = ggally_density, combo = ggally_box_no_facet),
        title = title
    )
} else {
    # discrete data is converted to factors to to make different boxplots
    for (i in 1:ncol(df)) {        
        if (is.integer(sum(na.omit(df[, i])))) {
            # get columnd i and make it a factor
            df[[i]] <- as.factor(df[[i]])
        }
    }
    
    ggpairs(df,
        diag = list(continuous = "bar"),
        lower = list(continuous = wrap(lowerFn, method = "lm")), alpha = 0.8, title = title
    )
}

dev.off()
file.copy(filename, snakemake@output[["filename"]])
unlink(filename)
