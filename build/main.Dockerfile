FROM ubuntu:24.04

# OS libraries
RUN apt-get update && \
    apt-get install -y curl openjdk-17-jre gh python3 python3-pip python-is-python3 docker.io bash-completion \
        r-base r-base-dev r-cran-roxygen2 r-cran-knitr r-cran-rmarkdown qpdf pandoc tidy && \
    rm -rf /var/lib/apt/lists/*

# Code CLI
RUN curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' --output vscode_cli.tar.gz && \
    tar -xf vscode_cli.tar.gz && mv code /usr/local/bin/ && rm vscode_cli.tar.gz

# Python packages
RUN pip install --no-cache-dir --break-system-packages uv
RUN uv pip install --system --break-system-packages --no-cache \
    numpy \
    pandas \
    scipy \
    scikit_learn \
    matplotlib \
    jupyterlab \
    seaborn \
    awscli

# Nextflow
RUN /bin/bash -c 'curl -s https://get.nextflow.io | bash && \
  mv nextflow /usr/local/bin'
