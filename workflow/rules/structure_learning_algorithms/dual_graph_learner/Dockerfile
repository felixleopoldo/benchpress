FROM r-base:4.3.0

RUN apt update -y
RUN apt install default-jre -y


RUN R -e "install.packages('stringr', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('igraph', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('data.table', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('graph', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('huge', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('ZIM', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('mvtnorm', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('speedglm', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('ncvreg', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('bnlearn', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('doParallel', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('SIS', repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('snowfall', repos='http://cran.us.r-project.org')"

RUN apt install wget -y
RUN wget https://cran.r-project.org/src/contrib/Archive/XMRF/XMRF_1.0.tar.gz
RUN echo hej
RUN R -e 'install.packages("XMRF_1.0.tar.gz", repos = NULL, type="source")'

RUN apt install wget -y
RUN wget https://cran.r-project.org/src/contrib/Archive/equSA/equSA_1.2.1.tar.gz
RUN echo hej
RUN R -e 'install.packages("equSA_1.2.1.tar.gz", repos = NULL, type="source")'

RUN R -e "install.packages('R.utils', repos='http://cran.us.r-project.org')"