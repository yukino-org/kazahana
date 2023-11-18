#!/bin/bash

set -eu

self=$(readlink -f "$0")
here=${self%/*}
root_dir=$(realpath "${here}/../..")

image_name="kazahana-dev/ubuntu"
containerfile_path="${here}/Containerfile"

podman build -t "${image_name}" -f "${containerfile_path}" "${root_dir}"
