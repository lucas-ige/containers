This repository contains resources I use to create and run containers.

It is hosted [here on GitHub](https://github.com/lucas-ige/containers) and [here on my institutional GitLab](https://gricad-gitlab.univ-grenoble-alpes.fr/bastiluc/containers).

I use [podman](https://podman.io/) to create and manage images.

# Installation and basic configuration of podman

## MacOS

You can install the podman desktop client from the official website (cf. link above), which lets you use podman out of
the box.

For a more lightweight experience, I instead choose to install just the podman command-line tools with [homebrew](https://brew.sh/):

```sh
brew install podman
```

The containers technology relies on Linux-specific features. Besides, many containers are based on GNU/Linux
images. Podman therefore needs a virtual machine (VM) to run containers on MacOS. To download such a virtual machine,
run:

```sh
podman machine init
```

You will see that podman downloads a virtual machine from [quay.io](quay.io).

You need to do this step only once: podman will find the downloaded file next time you will need it.

However, once per session (ie. every time you log out or restart your computer), you need to start the VM with:

```sh
podman machine start
```

# Build an image with podman

Each directory in [./images](./images) corresponds to an image that can be built with podman.

By convention, the instructions to build an image are in a file named `Containerfile`. These files use the same syntax
as [Docker](https://www.docker.com/) files.

To build an image, go to the image's directory and run (choose any tag you like for your image):

```sh
podman build --format=docker -t $tag_of_the_image .
```

This will build the image using the instructions in `Containerfile` for the architecture of the system where the
command was run (eg arm64 when run on MacOS with a Silicon chip). You can build an image for another architecture as
follows:

```sh
podman build --platform=linux/amd64 --format=docker -t $tag_of_the_image .
```

# Managing images and containers with podman

A container is an instance of an image. You can run several separate containers initialized from the same image.

List available images:

```sh
podman image list
```

Remove an image:

```sh
podman image rm $the_image
```

List running containers:

```sh
podman ps
```

List all containers (those that are running and those that are stopped):

```sh
podman ps -a
```

Run a container from an image in none-interactive mode:

```sh
podman run $the_image
```

Use option `--rm` if you do not want the container to be in the list (`podman ps -a`) after it has finished running:

```sh
podman run --rm $the_image
```

Use the option `-it` to run a container in interactive mode:

```sh
podman run -it $the_image
```

Run a command through a container:

```sh
podman run $the_image $the_command $command_arg1 $command_arg2
```

Remove a container from the list:

```sh
podman rm $container_name
```

Make tar file of existing image so that it can be transfered to another machine:

```sh
podman save -o $my_tar_file $the_image
```

# Running containers with pcocc

I use [pcocc](https://pcocc.readthedocs.io/en/latest/manpages/man1/pcocc.html) on a supercomputer where it is already
installed and configured. I use it to run containers created from images that I prepared on a different machine and
that I saved as a `tar` file (cf documentation above). You can run `pcocc` or its more recent Rust re-implementation
`pcoss-rs`.

The first step is to import the image that will be used to spawn containers:

```sh
pcocc-rs image import docker-archive:$the_image_as_tar_file $tag_of_the_image
```

You can list available images with:

```sh
pcocc-rs image list
```

To run a command through a container:

```sh
pcocc-rs run $tag_of_the_image $the_command $command_arg1 $command_arg2
```

You must use `--` before specifying the list of dashed options for your program, for instance:

```sh
pcocc-rs run $tag_of_the_image /bin/bash -- --norc -c "echo Hello World"
```

Using the `--norc` option with `/bin/bash` is useful in environments where the host's home directory is mounted in the
container (we do not want `bash` to source the host's user's `~/.bashrc` file).

# Useful links

 - The [Dockerfile reference](https://docs.docker.com/reference/dockerfile/) documents all the instructions that can be
   used in a Docker-like `Containerfile`.

 - The [RedHat documentation on podman and
   containers](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/10/html/building_running_and_managing_containers)
   is pretty nice.
