# Copyright (c) 2025-now Institut des Géosciences de l'Environnement, France.
#
# License: BSD 3-clause "new" or "revised" license (BSD-3-Clause).

"""Download cartopy data.

This script downloads Cartopy data. This can be useful to transfer said data to
a machine that firewalls off the connections needed for such downloads. One way
to trigger download of data by Cartopy is to create mock figures using these
features. This is what is done here.

"""

import os
import matplotlib.pyplot as plt
import cartopy

features = (
    ("physical", "coastline", "50m"),
    ("physical", "antarctic_ice_shelves_polys", "50m"),
)

crs = cartopy.crs.PlateCarree()
figure_name = "figure.pdf"

for feature in features:
    ax = plt.figure().add_subplot(1, 1, 1, projection=crs)
    ax.add_feature(cartopy.feature.NaturalEarthFeature(*feature))
    plt.savefig(figure_name)
    plt.close()
    os.remove(figure_name)
