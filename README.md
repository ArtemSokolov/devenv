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

## Using a different image
By default, the image specified in `deploy/main.yml` is used. To override it, pass `--image` as the first argument to `run.sh`:

```bash
./run.sh --image ghcr.io/artemsokolov/devenv:my-tag -f deploy/main.yml up
```

Alternatively, set the `DEVENV_IMAGE` environment variable:

```bash
DEVENV_IMAGE=ghcr.io/artemsokolov/devenv:my-tag ./run.sh -f deploy/main.yml up
```

Note that `deploy/main.yml` uses `pull_policy: always`, so for a locally built image that hasn't been pushed, add `--pull never` to `up`.
