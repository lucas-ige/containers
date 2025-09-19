# Copyright (c) 2025-now Institut des Géosciences de l'Environnement, France.
#
# License: BSD 3-clause "new" or "revised" license (BSD-3-Clause).

"""Download cartopy data.

This script downloads Cartopy data. This can be useful to transfer said data to
a machine that firewalls off the connections needed for such download.

"""

import cartopy

features = (
    ("physical", "coastline", "50m"),
    ("physical", "antarctic_ice_shelves_polys", "50m"),
)

for feature in features:
    cartopy.feature.NaturalEarthFeature(*feature)
