FROM bpimages/pcalg:2.7-8

RUN apt update -y
RUN apt install cmake -y

# These packages are required for the MVPC package
RUN R -e 'library(remotes); install_version("mipfp", "3.2.1")'
RUN R -e 'library(remotes); install_version("numDeriv", "2016.8-1")'
RUN R -e 'library(remotes); install_version("Rsolnp", "1.16")'
RUN R -e 'library(remotes); install_version("cmm", "0.12")'
RUN R -e 'library(remotes); install_version("DescTools", "0.99.28")'
RUN R -e 'library(remotes); install_version("e1071", "1.7-2")'
RUN R -e 'library(remotes); install_version("ks", "1.11.6")'
RUN R -e 'library(remotes); install_version("weights", "1.0")' # requires cmake
RUN R -e 'library(remotes); install_version("mice", "3.4.0")'
RUN R -e 'library(remotes); install_version("gdata", "2.18.0")'
RUN R -e 'library(remotes); install_version("Hmisc", "4.2-0")'
RUN R -e 'library(remotes); install_version("ggplot2", "3.1.1")'
RUN R -e 'library(remotes); install_version("Formula", "1.2-3")'
RUN R -e 'library(remotes); install_version("survival", "2.44-1.1")'
RUN R -e 'library(remotes); install_version("lattice", "0.20-38")'
RUN R -e 'library(remotes); install_version("mvtnorm", "1.0-11")'
RUN R -e 'BiocManager::install("BiocGenerics")'

RUN apt install git -y
RUN echo hello
RUN git clone https://github.com/felixleopoldo/MVPC.git
WORKDIR /MVPC

RUN git checkout d901361

