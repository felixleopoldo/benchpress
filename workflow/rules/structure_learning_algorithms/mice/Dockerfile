FROM bpimages/rgraphstuff:1.0 

RUN apt update -y
RUN apt install cmake -y

RUN R -e 'library(remotes); install_github("amices/mice", ref="v3.17.0")'
RUN R -e 'library(remotes); install_version("ranger", version="0.17.0")'