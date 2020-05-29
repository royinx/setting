FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    libopencv-dev \
    python-dev \
    python3-pip \
    libgomp1 \
    nano \
    wget \
    curl \
    libcurl4-gnutls-dev \	
    git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


RUN git clone https://github.com/Kitware/CMake cmake && \
	cd cmake && \
	./bootstrap --system-curl && \
	make -j"$(nproc)" install


ENV CMAKE_VERSION="3.16.4"
RUN wget --no-check-certificate https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz && \
	tar -xzf cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz && \
	export PATH=$PWD/cmake-${CMAKE_VERSION}-Linux-x86_64/bin:$PATH


