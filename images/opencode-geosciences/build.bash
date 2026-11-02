#!/bin/bash
#
# Copyright (c) 2026-now Institut des Géosciences de l'Environnement, France.
#
# License: BSD 3-clause "new" or "revised" license (BSD-3-Clause).
#
# Script that builds the container image.

rm opencode-geosciences.sif
apptainer build \
          --build-arg USER_NAME_ON_HOST=$(whoami) \
          opencode-geosciences.sif \
          ./opencode-geosciences.def
