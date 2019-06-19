FROM ufoym/deepo

# Install system packages
RUN apt-get update && \	
      apt-get install -y --no-install-recommends \
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
ENV CONDA_DIR=/opt/conda \
    PATH=/opt/conda/bin:$PATH
ADD requirement.txt requirement.txt
RUN pip install -r requirement.txt && \
    rm requirement.txt

ENV LC_ALL=C.UTF-8 \
    DISPLAY=unix$DISPLAY \
    LANG=C.UTF-8 \
    PYTHONPATH='/src/:$PYTHONPATH'

RUN echo "alias py='python'">>~/.bashrc

WORKDIR /py

EXPOSE 2233

CMD jupyter notebook --port=2233 --ip=0.0.0.0
