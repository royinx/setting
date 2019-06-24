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

RUN pip3 install https://download.pytorch.org/whl/cu100/torch-1.1.0-cp35-cp35m-linux_x86_64.whl
RUN pip3 install https://download.pytorch.org/whl/cu100/torchvision-0.3.0-cp35-cp35m-linux_x86_64.whl
RUN pip3 install onnx

RUN echo "alias py='python'">>~/.bashrc

WORKDIR /py


