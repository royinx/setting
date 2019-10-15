FROM nvcr.io/nvidia/tensorrt:19.09-py3
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

RUN pip3 install https://files.pythonhosted.org/packages/ae/05/50a05de5337f7a924bb8bd70c6936230642233e424d6a9747ef1cfbde353/torch-1.3.0-cp36-cp36m-manylinux1_x86_64.whl
RUN pip3 install https://files.pythonhosted.org/packages/fc/23/d418c9102d4054d19d57ccf0aca18b7c1c1f34cc0a136760b493f78ddb06/torchvision-0.4.1-cp36-cp36m-manylinux1_x86_64.whl

RUN pip3 install onnx

RUN echo "alias py='python'">>~/.bashrc

WORKDIR /py


