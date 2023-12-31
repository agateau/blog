---
public: true
pub_date: 2023-12-31 19:17:40 +01:00
tags: [clyde]
title: "Clyde: a cross-platform package manager for pre-built applications"
mastodon: "https://mastodon.xyz/@agateau/111675034022166854"
---

## Introduction

The popularity of Go and Rust and their ability to produce self-contained static binaries has made it easier for developers to publish builds of their applications working reliably on all platforms.

Downloading standalone binaries is easy and fast when one wants to try a new application (no need to build from source, no need to add a third-party repository...). On the other hand, keeping track of these applications over time is tedious and time consuming. This is what [Clyde][] is here to solve: Clyde is a cross-platform package manager for pre-built applications.

Installing [fd](https://github.com/sharkdp/fd), for example, can be done with `clyde install fd`.

Keeping installed applications updated consists of running `clyde update` to get an up-to-date list of packages, then `clyde upgrade` to install the latest version of all installed packages.

[![Clyde demo](https://asciinema.org/a/629496.svg)](https://asciinema.org/a/629496)
_Recording of setting up Clyde and installing fd_

<!-- break -->

## Other niceties

In addition to making it easy to keep applications up to date, Clyde provides other niceties such as installing man pages or making auto-completion work out-of-the-box.

It is also simple to rollback to a previous version and pin it if the latest one does not work for you for some reason.

Finally, Clyde is cross-platform. It supports 3 OS: Linux, macOS and Windows, and 3 architectures: x86, x86-64 and Aarch64 (aka ARM64). Future versions may add other OS or architectures.

## Yet another package manager developers must take care of?

No: compared to other package managers, Clyde does not require application developers to do anything when they release a new version: as long as the layout of the published archive does not change from one version to another, the Clyde store will pick up new releases and make them available.

## Getting started in 2 minutes

- Download version 0.6.0 for your machine from the [release page](https://github.com/agateau/releases/0.6.0).
- Unpack it and set it up:

```
$ tar xf clyde-0.6.0.tar.gz
$ cd clyde-0.6.0
$ ./clyde setup
(...)
All set! To activate your Clyde installation, add this line to your shell startup script:

. /home/demo/.cache/clyde/scripts/activate.sh

```

- Add the `activate.sh` script to your shell startup script as suggested (the path to `activate.sh` will be different on macOS and Windows)

- Restart your shell

You can now:

- search for packages with `clyde search <something>`,
- install a package with `clyde install <package>`,
- show package info with `clyde show <package>`,
- show package files with `clyde show -l <package>`,
- list installed packages with `clyde list`,
- uninstall a package with `clyde uninstall <package>`.

## Under the hood

### The installation directory

Clyde installs all applications in "Clyde home directory": a directory created in the default cache directory of your home directory.

The hierarchy of Clyde home directory looks like this:

- `$CLYDE_HOME`
    - `inst`: Clyde "prefix": where package files are installed
        - `bin`
        - `share`
        - `opt`
    - `download`: where Clyde downloads package assets
    - `store`: Clyde store (see below)
    - `scripts`: activation scripts
    - `tmp`: used while installing
    - `clyde.sqlite`: installed packages database

Clyde activation script ensures `$CLYDE_HOME/inst/bin` is in `$PATH` and other environment variables are set up accordingly.

### The Clyde store

The Clyde store is a [git repository](https://github.com/agateau/clyde-store) holding all Clyde packages.

A package is a YAML file containing:

- some metadata about the package (name, URL for its home and repository...)
- for each version, a list of asset URLs with their sha256 checksum.
- installation directives, telling Clyde where to put which files.
- test commands. These are used by the store CI: after updating a package, the CI installs the new version and runs these test commands.

You can learn more about the package format by reading [its documentation][pkg-doc].

[Clyde]: https://github.com/agateau/clyde
[pkg-doc]: https://github.com/agateau/clyde/blob/620a86dcc037d59666ad893a41f92b0a519a3afb/docs/package-file-format.md

## What's next?

Clyde itself is fully usable at this point, though a few new features are planned. What's needed is more packages! If you like the idea but do not see your favorite application, do not hesitate to add new packages. There is [a tutorial][tut] to get you started, and I am always happy to answer any questions!

[tut]: https://github.com/agateau/clyde/blob/620a86dcc037d59666ad893a41f92b0a519a3afb/docs/creating-a-package.md
