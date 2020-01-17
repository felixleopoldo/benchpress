FROM continuumio/miniconda3

WORKDIR /myappdir

RUN conda update -n base -c defaults conda

RUN conda install -c bioconda bioconductor-rgraphviz
RUN conda install -c bioconda bioconductor-graph
RUN conda install -c bioconda bioconductor-rbgl

RUN echo "install.packages(\"gRbase\", dependencies=TRUE, repos=\"https://cran.rstudio.com\");" | R --no-save
RUN echo "install.packages(\"pcalg\", repos=\"https://cran.rstudio.com\")" | R --no-save
RUN echo "install.packages(\"BiDAG\", repos=\"https://cran.rstudio.com\")" | R --no-save
RUN echo "install.packages(\"bnlearn\", repos=\"https://cran.rstudio.com\")" | R --no-save
