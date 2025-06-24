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
png(file = filename, width = 2000, height = 2000)

df <- read.csv(snakemake@input[["data"]], check.names = FALSE)[-1, ]
title <- paste("Graph: ", snakemake@wildcards[["adjmat"]], "\n",
    "Parameters: ", snakemake@wildcards[["bn"]], "\n",
    "Data: ", snakemake@wildcards[["data"]], "\n",
    sep = ""
)
datatype <- class(sum(na.omit(t(df)[, 1])))
# apply that to all columns first row
#print(head(df, 5))
#print(na.omit(t(df)[, 1]))
#print(na.omit(df[2, ]))
#print(paste0("sum of first row: ", sum(na.omit(t(df)[, 1]))))

if (datatype == "integer") {
    print("datatypes is integer")
    df <- df[-1, ]
    df[] <- lapply(df, factor)
    ggpairs(df,
        upper = list(continuous = ggally_density, combo = ggally_box_no_facet),
        title = title
    )
} else {
    
    # discrete data is converted to factors to to make different boxplots
    for (i in 1:ncol(df)) {
 #       print(paste0("checking column ", i, " datatype: ", class(sum(na.omit(df[, i])))))      
  #      print(sum(na.omit(df[, i])))
        if (is.integer(sum(na.omit(df[, i])))) {
            # get columnd i and make it a factor
            tmp <- df[[i]]
            df[[i]] <- as.factor(df[[i]])
            if(nlevels(df[[i]]) > 10) {
                df[[i]] <- tmp # if more than 10 levels, keep it as integer, or numeric..
            }
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
