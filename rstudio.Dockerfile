FROM gitpod/workspace-base

USER root

# Install R
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc |\
    tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc && \
    add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" && \
    apt-get update && \
    apt-get install -y gdebi-core r-base

# Install RStudio
ARG RSTUDIO="rstudio-server-2023.03.0-386-amd64.deb"
RUN wget "https://download2.rstudio.org/server/jammy/amd64/$RSTUDIO" && \
    gdebi -n "$RSTUDIO" && \
    rm -rf "$RSTUDIO"

# Configure Rstudio for gitpod
RUN echo "session-default-working-dir=/workspace" | tee -a /etc/rstudio/rsession.conf && \
    echo "session-default-new-project-dir=/workspace" | tee -a /etc/rstudio/rsession.conf && \
    echo "gitpod:gitpod" | chpasswd

# Install tidyverse
RUN R -e 'install.packages("tidyverse")'

USER gitpod

# Python packages for scientific programming
RUN pip install --no-cache-dir \
    numpy \
    pandas \
    scipy \
    matplotlib \
    jupyterlab \
    awscli
