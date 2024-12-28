FROM gitpod/workspace-python:2024-12-11-07-51-54

# Python packages for scientific programming
RUN pip install --no-cache-dir \
    numpy \
    pandas \
    scipy \
    scikit_learn \
    matplotlib \
    jupyterlab \
    seaborn \
    awscli

# Nextflow
RUN sudo apt-get update && \
    sudo apt-get install -y openjdk-17-jre && \
    sudo rm -rf /var/lib/apt/lists/*

RUN /bin/bash -c 'curl -s https://get.nextflow.io | bash && \
  sudo mv nextflow /usr/local/bin'
