FROM nvcr.io/nvidia/tensorrt:19.05-py3
# nvcr.io/nvidia/tensorrt:<xx.xx>-py<x>


# Install system packages
RUN apt-get update && \	
      apt-get install -y --no-install-recommends \
      g++ \
      git \
      sudo \
      nano \
      curl \
      wget && \
    rm -rf /var/lib/apt/lists/*

RUN echo "alias py='python'">>~/.bashrc

WORKDIR /py


