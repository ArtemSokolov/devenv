FROM gitpod/workspace-base

USER root

# Install R
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc |\
    tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc && \
    add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/" && \
    apt-get update && \
    apt-get install -y gdebi-core r-base

# Install RStudio
RUN wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-2022.07.2-576-amd64.deb && \
    gdebi -n rstudio-server-2022.07.2-576-amd64.deb

# Configure Rstudio for gitpod
RUN echo "session-default-working-dir=/workspace" | tee -a /etc/rstudio/rsession.conf && \
    echo "session-default-new-project-dir=/workspace" | tee -a /etc/rstudio/rsession.conf && \
    echo "gitpod:gitpod" | chpasswd

# Install tidyverse
RUN R -e 'install.packages("tidyverse")'

USER gitpod
