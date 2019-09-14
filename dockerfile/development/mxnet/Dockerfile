ARG cuda_version=10.1
ARG cudnn_version=7
FROM nvidia/cuda:${cuda_version}-cudnn${cudnn_version}-devel

# Install system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
      g++ \
      git \
      sudo \
      nano \
      curl \
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
ARG python_version=3.7

# Install Python
RUN conda config --append channels conda-forge
RUN conda install -y python=${python_version}

# Install Daytabase python pip dependency 
ADD requirement_pip.txt requirement_pip.txt
RUN pip install --upgrade pip && \
    pip install -r requirement_pip.txt



# Install General python conda dependency
RUN conda update conda
RUN conda install \
      h5py \
      matplotlib \
      notebook \
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
