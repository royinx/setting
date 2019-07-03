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

RUN mkdir -p /home/temp
WORKDIR /home/temp/

ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH

RUN wget --quiet --no-check-certificate https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    /bin/bash /Miniconda3-latest-Linux-x86_64.sh -f -b -p $CONDA_DIR && \
    rm Miniconda3-latest-Linux-x86_64.sh && \
    echo export PATH=$CONDA_DIR/bin:'$PATH' > /etc/profile.d/conda.sh

RUN conda install -y tensorflow-gpu \ 
					keras && \
					conda clean -yt

RUN echo "alias py='python'">>~/.bashrc

WORKDIR /py


