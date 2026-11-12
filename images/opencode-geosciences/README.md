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

This script will launch the image and mount your current working directory and (hopefully) nothing else. Note that the script creates a directory named `.opencode_fs` in your current working directory, where OpenCode will store configuration files and other local information. The run script will copy any relevant OpenCode configuration file it can find in your home directory on the host to this `.opencode_fs` directory prior to running the container.

Note that this `.opencode_fs` will represent the user-wide OpenCode configuration inside the container (eg. `.opencode_fs/config` will be mounted to `~/.config`). On top of that, you can have a `.opencode` directory inside the current working directory to store your project-specific configuration.
