This is an Apptainer image to use [OpenCode](https://opencode.ai/) for geoscientific numerical work.

The idea is to make using OpenCode as safe and as private as reasonably possible.

To build the image:

```sh
./build.bash
```

This will create the image file named `opencode-geosciences.sif`.

To use the image:

```sh
"cd /where/you/want/to/work:"
"/path/to/run.bash /path/to/opencode-geosciences.sif"
```

where (run.bash)[./run.bash] is the one located in this directory.

This script will launch the image and mount your current working directory and (hopefully) nothing else. Note that the script creates a directory named `.opencode` in your current working directory, where OpenCode will store configuration files and other local information.
