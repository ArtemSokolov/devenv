FROM gitpod/workspace-python:2023-03-06-18-43-51

# Python packages for scientific programming
RUN pip install --no-cache-dir \
    numpy \
    pandas \
    scipy \
    scikit_learn \
    matplotlib \
    jupyterlab \
    awscli

# Nextflow
RUN sudo apt-get update && \
    sudo apt-get install -y openjdk-17-jre && \
    sudo rm -rf /var/lib/apt/lists/*

RUN /bin/bash -c 'curl -s https://get.nextflow.io | bash && \
  sudo mv nextflow /usr/local/bin'
