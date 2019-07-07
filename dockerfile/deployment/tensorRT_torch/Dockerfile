FROM nvcr.io/nvidia/tensorrt:19.05-py3
# nvcr.io/nvidia/tensorrt:<xx.xx>-py<x>
# TRT_container 19.06 : TRT 5.1.5 RC, cuDNN 7.6.0, CUDA 10.1.168, cuBLAS 10.2.0.168
# TRT_container 19.02 : TRT 5.0.2, cuDNN 7.4.2, CUDA 10.0.130, cuBLAS 10.0.130
# TRT_container 18.08 : TRT 4.0.1, cuDNN 7.2.1, CUDA 9.0.176

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


