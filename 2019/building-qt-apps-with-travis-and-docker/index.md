pub_date: 2019-01-19 17:28:18 +01:00
public: true
tags: [qt, docker, travis-ci, ci, nanonote, pko]
title: Building Qt apps with Travis CI and Docker

I recently configured [Travis CI][] to build [Nanonote][], my minimalist
note-taking application. We use Jenkins a lot at work, and despite the fact
that I dislike the tool itself, it has proven invaluable in helping us catch
errors early.  So I strongly believe in the values of Continuous Integration.

[Travis CI]: https://travis-ci.org
[Nanonote]: https://github.com/agateau/nanonote

<!-- break -->

When it comes to CI setup, I believe it is important to keep your distances
with the tool you are using by keeping as much setup as possible in
tool-agnostic scripts, versioned in your repository, and making the CI server
use these scripts.

Ensuring your build scripts are independent of your CI server gives you a few
advantages:

- Your setup is easier to extend and debug, since you can run the build scripts
  on your machine. This is lighter than running an instance of your CI server
  on your local machine (nobody takes the time to do that anyway) and more
  efficient than committing changes in a temporary branch then wait for your
  CI server to build them to see if you got it right (everybody does that).

- It keeps the build instructions next to your code, instead of being stored
  in, say, Jenkins XML file. This ensures that you can add dependencies and
  adjust the build script in one commit. It also ensures that if your build
  script evolves, you can still build old branches on the CI server (for
  example because you have a fix to do on a released version).

- If your CI server is Jenkins or something similar, you spend less time
  cursing against the slow web-based UI (yes, I know about Jenkins Pipelines,
  but those have other problems...).

- It is easier to switch to another CI server.

With this in mind, here is how I configured Nanonote CI.

## Create a Build environment using Docker

The first element is to create a stable build environment. To do this I created
a Docker with the necessary build components. Here is its Dockerfile, stored
in the `ci` directory of the repository:

```docker
FROM ubuntu:18.04
RUN apt-get update \
    && apt-get install -y -qq --no-install-recommends \
        cmake \
        dpkg-dev \
        file \
        g++ \
        make \
        ninja-build \
        python3 \
        python3-pip \
        python3-setuptools \
        qt5-default \
        qtbase5-dev \
        qttools5-dev \
        rpm \
        xvfb
COPY requirements.txt /tmp
RUN pip3 install -r /tmp/requirements.txt
ENTRYPOINT ["/bin/bash"]
```

Nothing really complicated here, but there are a few interesting things to
point out nevertheless.

It installs `dpkg-dev` and `rpm` packages, so that CPack can build .deb
and .rpm packages.

It also installs the `xvfb` package, to be able to run tests which require
an X server.

Finally it copies a `requirements.txt` file and `pip install` it. This is to
install [qpropgen][] dependencies. This `requirements.txt` is in
`3rdparty/qpropgen`, which Docker cannot reach (because it only sees files
inside the `ci` directory), so I created a simple `ci/build-docker` script to
build the Docker image:

[qpropgen]: https://github.com/agateau/qpropgen

```bash
#!/bin/sh
set -ev
cd $(dirname $0)
cp ../3rdparty/qpropgen/requirements.txt .
docker build -t nanonote:1 .
```

This gives us a clean build environment, now lets create a build script.

## The build script

This script is `ci/build-app`. Its job is to:

1. Create a source tarball
2. Build and run tests from this source tarball
3. Build .rpm and .deb packages

You may wonder why the script creates a source tarball, since GitHub
automatically generates them when one creates a tag. There are two reasons for
this:

1. GitHub tarballs do not contain repository submodules, making them useless
   for Nanonote.
2. I prefer to rely on my own build script to generate the source tarball as it
   makes the project less dependant on GitHub facilities, should I decide to
   move to another git host service.

Reason #1 also explains why the script builds from the source tarball instead
of using the git repository source tree: it ensures the tarball is not missing
any file necessary to build the app.

I am not going to include the script here, but you can [read it
on GitHub][build-app].

[build-app]: https://github.com/agateau/nanonote/blob/56dfa7516b8be48a82a5ebb327f4351a876ffc09/ci/build-app

## Travis setup

Now that we have a build script and a build environment, we can make Travis
uses them. Here is Nanonote `.travis.yml` file. As you can see, it is just a
few lines:

```yaml
dist: xenial
language: minimal
services:
- docker
install:
- ci/build-docker
script:
- docker run -v $PWD:/root/nanonote nanonote:1 /root/nanonote/ci/build-app
```

Not much to say here:

- We tell Travis to use an Ubuntu Xenial (16.04) distribution and Docker.
- The "install" step builds the Docker image.
- The "script" step mounts the source tree inside the Docker image and runs the
  build script.

Travis runs this on all branches pushed to GitHub. I configured GitHub to
refuse pushes to the master branch if the commits have not been validated by
Travis. This rule applies to all project contributors, including me. Since
there is not (for now?) a large community of contributors to the project, I
don't open pull requests: I just push commits to the dev branch, once Travis
has checked them, I merge dev into master.

## Releases

When it's time to create a release, I just do what Travis does: rebuild the
Docker image then run the build script inside it.

Since the source tree is mounted inside the Docker image, I get the source and
binary packages in the `dist` directory of the repository, so I can test them
and publish them.

Travis has a publication system to automatically attach build artefacts to
GitHub releases when building from a tag, but I prefer to build them myself
because that gives me the opportunity to test the build artefacts before
tagging and it prevents me from becoming too dependent on Travis service.

## Conclusion

That's it for this description of Nanonote CI setup. It's still young so I
might refine it, but it is already useful. I am probably going to create
similar setups for my other C++ Qt projects.

I hope it helped you as well.
