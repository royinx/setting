ARG cuda_version=10.0
ARG cudnn_version=7
FROM nvidia/cuda:${cuda_version}-cudnn${cudnn_version}-devel

# Install system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
      bzip2 \
      g++ \
      git \
      openssh-server \
      sudo \
      nano \
      curl \
      libsm6 \
      libxext6 \
      libxrender1 \
      wget && \
    rm -rf /var/lib/apt/lists/*

# Install conda
ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH

RUN wget --quiet --no-check-certificate https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    /bin/bash /Miniconda3-latest-Linux-x86_64.sh -f -b -p $CONDA_DIR && \
    rm Miniconda3-latest-Linux-x86_64.sh && \
    echo export PATH=$CONDA_DIR/bin:'$PATH' > /etc/profile.d/conda.sh

# Install Python packages and keras
ENV NB_USER keras 
ENV NB_UID 1000

RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER && \
    echo "keras:keras" | chpasswd && \
    adduser docker sudo && \
    chown $NB_USER $CONDA_DIR -R && \
    mkdir -p /src && \
    chown $NB_USER /src

USER $NB_USER

# RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
# USER docker

ARG python_version=3.7

RUN conda config --append channels conda-forge
RUN conda install -y python=${python_version}
RUN pip install --upgrade pip && \
    pip install opencv-python \
      tensorflow-gpu 

# Install pytorch 
RUN pip install https://download.pytorch.org/whl/cu100/torch-1.1.0-cp37-cp37m-linux_x86_64.whl
RUN pip install https://download.pytorch.org/whl/cu100/torchvision-0.3.0-cp37-cp37m-linux_x86_64.whl      


RUN mkdir -p /home/keras/temp
# Install Apex (pytorch half precision)
WORKDIR /home/keras/temp
RUN git clone https://github.com/NVIDIA/apex 
WORKDIR apex/
RUN pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" .

# Install Torchreid 
WORKDIR /home/keras/temp
RUN git clone https://github.com/KaiyangZhou/deep-person-reid.git
WORKDIR deep-person-reid/
RUN pip install -r requirements.txt && \
    python setup.py install

RUN rm -rf /home/keras/temp/*


RUN conda update conda
RUN conda install \
      h5py \
      matplotlib \
      notebook \
      pandas \
      scikit-learn \
      && \
    git clone git://github.com/keras-team/keras.git /src && pip install -e /src[tests] && \
    pip install git+git://github.com/keras-team/keras.git && \
    conda clean -yt


ENV LC_ALL=C.UTF-8 \
    KERAS_BACKEND=tensorflow \
    DISPLAY=unix$DISPLAY \
    LANG=C.UTF-8 \
    PYTHONPATH='/src/:$PYTHONPATH'
RUN echo "alias py='python'">>~/.bashrc
WORKDIR /py

EXPOSE 2233

CMD jupyter notebook --port=2233 --ip=0.0.0.0

ENTRYPOINT service ssh restart && bash

