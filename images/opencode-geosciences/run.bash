#!/bin/bash
#
# Copyright (c) 2026-now Institut des Géosciences de l'Environnement, France.
#
# License: BSD 3-clause "new" or "revised" license (BSD-3-Clause).
#
# Script to run my Apptainer "opencode-geosciences" image.
#
# The idea here is to give opencode access to your current working directory
# and nothing else. For that, we create a .opencode folder in the current
# directory.
#
# See just below for usage instructions :)

if [ $# -ne 1 ]; then
    echo ""
    echo "Usage:"
    echo "------"
    echo ""
    echo "cd /where/you/want/to/work:"
    echo "/path/to/this/script /path/to/opencode-geosciences.sif:"
    echo ""
    exit 0
fi

mkdir -pv ./.opencode/local/share/opencode
mkdir -pv ./.opencode/local/state/opencode
mkdir -pv ./.opencode/config/opencode
mkdir -pv ./.opencode/cache/opencode

apptainer exec --no-mount home,hostfs,bind-paths \
          --bind ./.opencode/local/share/opencode:/containerhome/$(whoami)/.local/share/opencode \
          --bind ./.opencode/local/state/opencode:/containerhome/$(whoami)/.local/state/opencode \
          --bind ./.opencode/config/opencode:/containerhome/$(whoami)/.config/opencode \
          --bind ./.opencode/cache/opencode:/containerhome/$(whoami)/.cache/opencode \
          "$1" \
          /bin/bash
