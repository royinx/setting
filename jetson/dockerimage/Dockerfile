# FROM nvcr.io/nvidia/l4t-pytorch:r32.4.4-pth1.6-py3

# ARG OPENCV_VERSION="4.3.0"
# ARG OPENCV_DO_TEST="FALSE"
# # note: 8 jobs will fail on Nano. Try 1 instead.
# ARG OPENCV_BUILD_JOBS="1"
# # required for apt-get -y to work properly:
# ARG DEBIAN_FRONTEND=noninteractive

# WORKDIR /usr/local/src/build_opencv

# COPY build_opencv.sh .

# RUN /bin/bash build_opencv.sh

FROM gammonhk/jetson_cv:v0.3

RUN apt-get install -y \
    libopenmpi2 \
    libjpeg-dev \
    zlib1g-dev

RUN wget https://nvidia.box.com/shared/static/wa34qwrwtk9njtyarwt5nvo6imenfy26.whl -O torch-1.7.0-cp36-cp36m-linux_aarch64.whl  && \
    pip3 install torch-1.7.0-cp36-cp36m-linux_aarch64.whl  && \
    rm torch-1.7.0-cp36-cp36m-linux_aarch64.whl

RUN git clone --branch v0.5.1 https://github.com/pytorch/vision torchvision && \
    cd torchvision && \
    python3 setup.py install

WORKDIR /workspace