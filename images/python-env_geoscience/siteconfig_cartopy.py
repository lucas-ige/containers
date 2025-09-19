# Copyright (c) 2025-now Institut des Géosciences de l'Environnement, France.
#
# License: BSD 3-clause "new" or "revised" license (BSD-3-Clause).

"""Site configuration file for cartopy."""

def update_config(config):
    """Update Cartopy's dictionary of configuration options.

    Parameters
    ----------
    config: dict
        The dictionary of existing Cartopy options, which are being updated in
        place here in this function.

    """
    for key in ("pre_existing_data_dir", "data_dir"):
        config[key] = "/python-geoscience/cartopy_data"
