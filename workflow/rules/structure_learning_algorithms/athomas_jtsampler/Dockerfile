# Source https://github.com/melmasri/jtsampler
FROM ubuntu:20.04

RUN apt update -y
RUN apt install default-jre -y
RUN apt install time -y
RUN apt install make -y
RUN apt install default-jdk -y

COPY jtsampler jtsampler
WORKDIR /jtsampler
RUN make


