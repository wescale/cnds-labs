#!/bin/bash -e

[ -x "$(command -v podman)" ] && BIN=podman || BIN=docker

dockerfile="$1"

DIRNAME=$(dirname -- "$0";)

echo -e "
\033[1;33m--------------------\033[1;0m
[$0]
\033[1;34mNOTE\033[0m: Mounting hadolint.yaml file to docker volume at mount point \033[1;33m/config/hadolint.yaml\033[1;0m
  You might want to use '\033[1;32m-c /config/hadolint.yaml\033[0m' to configure rules using the configuration file
\033[1;33m--------------------\033[1;0m
"

shift

# To output command
set -x
$BIN run --rm -i \
    --mount type=bind,src=${PWD}/${DIRNAME}/hadolint.yaml,dst=/config/hadolint.yaml hadolint/hadolint \
    hadolint "$@" - < "$dockerfile"