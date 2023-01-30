# FROM continuumio/anaconda3:2022.10


# RUN conda env create -f environment.yml

#FROM ubuntu:latest
#FROM python
FROM r-base:4.2.2
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends build-essential libpq-dev python3.11 python3-pip python3-setuptools python3-dev

#RUN pip3 install --upgrade pip



# FROM python:3.9.13-buster
# RUN apt update
# RUN apt-get -y install python3-pip 
RUN pip install contextlib2

#ENV DEBIAN_FRONTEND=noninteractive

#RUN apt-get update && apt-get install -y --no-install-recommends build-essential r-base r-cran-randomforest python3.6 python3-pip python3-setuptools python3-dev
RUN apt-get update && apt-get install -y --no-install-recommends build-essential r-base 
RUN pip install numpy
RUN pip install torch
RUN pip install functorch
RUN R -e "install.packages(\"cdt\")" --no-save
RUN apt install -y git-all
RUN git clone https://github.com/vios-s/DiffAN.git
WORKDIR /DiffAN
RUN apt install python-is-python3
RUN pip install tqdm
RUN pip install cdt
