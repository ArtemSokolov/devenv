# devenv: personal developer environment(s)

**Prerequisites:** git, Docker

## Quick start:
* [Optional] If on Windows and wanting to user Docker inside the devenv:
  * `wsl` to ensure that the Docker socket is at `/var/run/docker.sock`
* [Optional] For GitHub access inside the container:
  * Install the [GitHub CLI](https://cli.github.com/)
  * Authenticate on the host: `gh auth login`
* Clone the repo: `git clone https://github.com/ArtemSokolov/devenv.git`
* Spin up a container: `cd devenv; ./run.sh -f deploy/main.yml up`
* Follow on-screen instructions to connect with a `vscode.dev` IDE

