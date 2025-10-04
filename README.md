# devenv: personal developer environments.

Each dev-env is defined in the corresponding `Dockerfile` and gets automatically built by Github Actions. The resulting Docker images get pushed to the `ghcr.io` repository and tagged with the build date, as well as `latest`. The environments can be pulled directly from [the registry](https://github.com/ArtemSokolov/devenv/pkgs/container/devenv) or further customized in downstream projects. For example, R projects will likely want to do the following:

```
FROM ghcr.io/artemsokolov/devenv:rstudio-latest

# Install additional packages
RUN sudo R -e 'install.packages(c("qs", "microbenchmark"))'
```

Currently available dev-envs:

* `darkroom` - a Python environment with a noVNC virtual desktop and preinstalled Napari and basic image processing libraries. The environment also includes a client for interfacing with [Synapse](https://synapse.org/) for data management. The virtual desktop is served on port 6080.
* `rstudio` - The RStudio environment is effectively a replica of the popular `rocker/tidyverse`, with tidyverse and RStudio server installed on top of the default `gitpod/workspace-base`. This provides access to all standard Gitpod tools (including `pyenv`) on top of RStudio/tidyverse, thus enabling integration between R and Python with `reticulate` and `rpy2`. RStudio server is available on port 8787. The server can be started with `sudo /usr/lib/rstudio-server/bin/rstudio-server start`.
* `nfpy` - An environment containing basic Python packages for scientific programming (`numpy`, `scipy`, `pandas`), Nextflow for pipeline buildings and AWS CLI for interacting with the S3 data buckets.
