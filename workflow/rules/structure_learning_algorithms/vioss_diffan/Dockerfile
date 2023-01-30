
FROM r-base:4.2.2

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends build-essential libpq-dev python3.11 python3-pip python3-setuptools python3-dev
RUN apt install python-is-python3
RUN apt install -y git-all

RUN pip install contextlib2
RUN pip install numpy
RUN pip install torch
RUN pip install functorch
RUN pip install tqdm
RUN pip install cdt

RUN git clone https://github.com/vios-s/DiffAN.git

WORKDIR /DiffAN
