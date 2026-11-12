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
    echo "cd /where/you/want/to/work"
    echo "/path/to/this/script /path/to/opencode-geosciences.sif"
    echo ""
    exit 0
fi

mkdir -pv ./.opencode_fs/local/share/opencode
mkdir -pv ./.opencode_fs/local/state/opencode
mkdir -pv ./.opencode_fs/config/opencode
mkdir -pv ./.opencode_fs/cache/opencode

[ -e ~/.config/opencode/opencode.json ] && cp -Lv ~/.config/opencode/opencode.json ./.opencode_fs/config/opencode/
[ -e ~/.config/opencode/opencode.jsonc ] && cp -Lv ~/.config/opencode/opencode.jsonc ./.opencode_fs/config/opencode/
[ -e ~/.config/opencode/AGENTS.md ] && cp -Lv ~/.config/opencode/AGENTS.md ./.opencode_fs/config/opencode/
[ -e ~/.config/opencode/skill ] && cp -Lv ~/.config/opencode/skill ./.opencode_fs/config/opencode/
[ -e ~/.config/opencode/skills ] && cp -Lv ~/.config/opencode/skills ./.opencode_fs/config/opencode/

apptainer exec --no-mount home,hostfs,bind-paths \
          --bind ./.opencode_fs/local/share/opencode:/containerhome/$(whoami)/.local/share/opencode \
          --bind ./.opencode_fs/local/state/opencode:/containerhome/$(whoami)/.local/state/opencode \
          --bind ./.opencode_fs/config/opencode:/containerhome/$(whoami)/.config/opencode \
          --bind ./.opencode_fs/cache/opencode:/containerhome/$(whoami)/.cache/opencode \
          "$1" \
          /bin/bash
