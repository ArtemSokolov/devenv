#!/usr/bin/env bash
set -euo pipefail

# Prevent Git Bash (MSYS) from mangling POSIX paths like /var/run/docker.sock
# into Windows paths before they reach docker.exe. No-op outside MSYS.
export MSYS_NO_PATHCONV=1

# Optional image override: ./run.sh --image <ref> [compose args...]
# Falls back to the default in the compose file when not provided.
if [[ "${1:-}" == --image=* ]]; then
  export DEVENV_IMAGE="${1#--image=}"
  shift
elif [[ "${1:-}" == "--image" ]]; then
  if [[ -z "${2:-}" ]]; then
    echo "error: --image requires a value" >&2
    exit 1
  fi
  export DEVENV_IMAGE="$2"
  shift 2
fi

# User attributes
export DEVENV_UID="$(id -u)"
export DEVENV_GID="$(id -g)"
export DEVENV_USER="$(id -un)"

# Scout to determine Docker GID inside containers
# Use a tiny container image busybox (~4MB)
export DEVENV_DOCKER_GID="$(docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
  --entrypoint stat busybox -c '%g' /var/run/docker.sock)"

# GitHub token (optional)
if command -v gh >/dev/null 2>&1 && GH_TOKEN="$(gh auth token 2>/dev/null)"; then
  export GH_TOKEN
else
  echo "warning: no GitHub token available (install gh and run 'gh auth login' to enable GitHub access in the container)" >&2
fi

exec docker compose "$@"
