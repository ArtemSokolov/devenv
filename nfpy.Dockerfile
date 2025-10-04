FROM gitpod/workspace-python:2025-08-25-18-17-39

# Code CLI
RUN curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' --output vscode_cli.tar.gz && \
    tar -xf vscode_cli.tar.gz && sudo mv code /usr/local/bin/ && rm vscode_cli.tar.gz

# Python packages for scientific programming
RUN pip install --no-cache-dir \
    numpy \
    pandas \
    scipy \
    scikit_learn \
    matplotlib \
    jupyterlab \
    seaborn \
    awscli \
    scikit-image \
    imagecodecs

# Nextflow
RUN sudo apt-get update && \
    sudo apt-get install -y openjdk-17-jre && \
    sudo rm -rf /var/lib/apt/lists/*

RUN /bin/bash -c 'curl -s https://get.nextflow.io | bash && \
  sudo mv nextflow /usr/local/bin'
