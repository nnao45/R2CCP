FROM tensorflow/tensorflow:2.16.1-gpu-jupyter

RUN rm -rf /tf/tensorflow-tutorials
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    bzip2 \
    ca-certificates \
    libglib2.0-0 \
    libxext6 \
    libsm6 \
    libxrender1 \
    git \
    vim \
    mercurial \
    subversion \
    cmake \
    libboost-dev \
    libboost-system-dev \
    libboost-filesystem-dev \
    gcc \
    g++ \
    ocl-icd-opencl-dev \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

RUN pip install poetry \
  && poetry config virtualenvs.create false

COPY ./pyproject.toml ./poetry.lock* ./
RUN poetry install