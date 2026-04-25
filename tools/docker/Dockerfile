FROM ubuntu:questing

ARG TARGETARCH

RUN apt-get update && \
  DEBIAN_FRONTEND='noninteractive' \
  DEBCONF_NONINTERACTIVE_SEEN='true' \
  apt-get install --yes \
    build-essential \
    git \
    curl \
    python3-pip \
    cmake \
    openmpi-bin \
    libopenmpi-dev \
    libeigen3-dev \
    libboost-all-dev \
    libmetis-dev \
    netcdf-bin \
    libnetcdf-dev \
    libfftw3-dev \
    libhdf5-dev

RUN useradd \
  --create-home \
  axisem

USER axisem

WORKDIR /home/axisem/

RUN git clone https://github.com/AxiSEMunity/AxiSEM3D.git AxiSEM3D;



RUN cd AxiSEM3D; mkdir build; cd build; cmake ..; cmake --build .

ENV PATH="/home/axisem/AxiSEM3D/build:${PATH}"
