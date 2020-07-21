# agateau.com blog

## Setup

- Create a virtualenv
- Install rstblog in it

```sh
git clone https://github.com/agateau/rstblog
git checkout integration
cd rstblog
pip install -r requirements.txt
pip install -e .
```

- Install dependencies

```sh
make install-deps
```

## Create config.mk

## Get storage files

```sh
make download-storage
```

## Building

```sh
make
```

## Deploying

```sh
make deploy
make deploy-storage
```
