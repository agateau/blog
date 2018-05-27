public: no
pub_date: 2017-11-02 21:35:41 +01:00
tags: [howto, docker]
title: "Docker 1.12 howto"
disqus: false

## Example Dockerfile

```
FROM mhart/alpine-node:8
RUN some-command-at-build-time
COPY some-file to-this-dir

# Expose a port
EXPOSE 3030
# Run this command when starting the image
CMD ["some-command", "with", "args"]
```

## Building an image

Builds an image named "me/product:1.0" from the Dockerfile in $PWD.

    docker build -t me/product:1.0 .

## Starting an image

    docker run me/product:1.0

To map a port:

    docker run -p <outside_port>:<inside_port> me/product:1.0

To run in the background: `-d`

## Container management

List running containers:

    docker ps

List all:

    docker ps -a

Stopping a container:

    docker stop <container_id>

More violent:

    docker kill <container_id>

Deleting a container:

    docker rm <container_id>

## Image management

    docker images

    docker rmi
