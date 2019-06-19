ARG cuda_version=10.1
ARG cudnn_version=7
FROM nvidia/cuda:${cuda_version}-cudnn${cudnn_version}-devel

# Install system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
      bzip2 \
      g++ \
      git \
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
ARG python_version=3.7

RUN conda config --append channels conda-forge
RUN conda install -y python=${python_version}
RUN pip install --upgrade pip && \
    pip install opencv-python

RUN conda update conda
RUN conda install \
      h5py \
      numpy \
      scipy \
      pyyaml \z
      tabulate \
      pillow \
      matplotlib \
      pygpu \
      notebook \
      pandas \
      scikit-learn \
      && \
    conda clean -yt

RUN pip install --no-deps git+git://github.com/Theano/Theano

RUN pip install --no-deps git+git://github.com/benanne/Lasagne

RUN pip install --no-deps git+git://github.com/dnouri/nolearn

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

ENV CUDA_ROOT /usr/local/cuda/bin 
ENV PYTHONPATH='/src/:$PYTHONPATH'

WORKDIR /py

RUN echo "[global]\ndevice=cuda\nfloatX=float32\nroot=/usr/local/cuda-10.1\n[nvcc]\nfastmath = True\n[blas]\nldflags = -lopenblas\n[cuda]\nroot = /usr/local/cuda-10.1" > /root/.theanorc

RUN echo 'alias py="python"' >> ~/.bashrc


EXPOSE 2233

CMD jupyter notebook --port=2233 --ip=0.0.0.0
