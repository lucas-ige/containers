This repository contains resources I use to create and run containers.

I use [podman](https://podman.io/) to create and manage images.

# Installation and basic configuration of podman

## MacOS

You can install the podman desktop client from the official website (cf. link above), which lets you use podman out of
the box.

For a more lightweight experience, I choose to install just the podman command-line tools with [homebrew](https://brew.sh/) instead:

```sh
brew install podman
```

The containers technology relies on Linux-specific features and most (or all?) containers are based on GNU/Linux
images. Podman therefore needs a virtual machine (VM) to run containers on MacOS. To download such a virtual machine,
run:

```
podman machine init
```

You will see that podman downloads a virtual machine from [quay.io](quay.io).

You need to do this step only once: podman will find the downloaded file next time you will need it.

However, once per session (ie. every time you log out or restart your computer), you need to start the VM with:

```
podman machine start
```
