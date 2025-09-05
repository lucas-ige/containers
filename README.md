This repository contains resources I use to create and run containers.

I use [podman](https://podman.io/) to create and manage images.

# Installation and basic configuration of podman

## MacOS

You can install the podman desktop client from the official website (cf. link above), which lets you use podman out of
the box.

For a more lightweight experience, I instead choose to install just the podman command-line tools with [homebrew](https://brew.sh/):

```sh
brew install podman
```

The containers technology relies on Linux-specific features and most (or all?) containers are based on GNU/Linux
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

# Build an image

Each directory in ./images corresponds to an image that can be built with podman.

By convention, the instructions to build an image are in a file named `Containerfile`.

To build an image, go to the image's directory and run:

```sh
podman build --format=docker -t $name-of-the-image
```

This will build the image using the instructions in `Containerfile` for the host's architecture (ie for arm64 on MacOS
with Silicon chips). You can build an image for another architecture as follows:

```sh
podman build --platform linux/amd64 --format=docker -t $name-of-the-image
```

# Useful links

 - The [RedHat documentation on podman and
   containers](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/10/html/building_running_and_managing_containers)
   is pretty nice.
