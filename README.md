# agateau.com blog

## Setup

- Create a virtualenv
- Install rstblog in it
    git clone https://github.com/agateau/rstblog
    git checkout integration
    cd rstblog
    pip install -r requirements.txt
    pip install -e .

- Install dependencies

    make install-deps

## Create config.mk

## Get storage files

    make download-storage

## Building

    make

## Deploying

    make deploy
    make deploy-storage
