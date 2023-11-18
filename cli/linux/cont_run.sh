#!/bin/bash

set -eu

self=$(readlink -f "$0")
here=${self%/*}

X_ATTACH_DISPLAY=1 "${here}/cont_exec.sh" dart run ./cli/linux/run.dart "$@"
