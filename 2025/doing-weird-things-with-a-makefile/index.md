---
public: true
pub_date: 2025-02-22 12:56:49 +01:00
tags: [makefile, tips]
title: "A cursed Makefile: using Python inside Makefiles"
mastodon:
---

## Introduction

Quoting [Wikipedia](https://en.wikipedia.org/wiki/Make_(software)):

> In software development, Make is a command-line interface software tool that performs actions ordered by configured dependencies as defined in a configuration file called a makefile.

By default, the actions to perform are *independent* (more on that later) shell commands.

Other tools like [`just`](https://just.systems) let you use different interpreters.

In this article I explain how to abuse some of Make variables to force it to use Python.

Disclaimer: I only tested the code from this article with GNU Make: they make not work on BSD or macOS systems.

## Telling Make to use Python

Make lets you define the shell to use to run targets via the variable `SHELL`. You can use this to force it to use `bash` for example instead of whatever `/bin/sh` points to. Nothing stops you from setting it to `python`...

```Makefile
# step1.mk
SHELL := python

all:
	print(f"Hello from {__name__}")
```

If we run this we get:

```
$ make -f step1.mk
print(f"Hello from {__name__}")
Hello from __main__
```

So far so good.

## Multi-line commands

Let's try something fancier:

```Makefile
# step2.mk
SHELL := python

all:
	import sys
	print(sys.version)
```

Let's run it:

```
$ make -f step2.mk
import sys
print(sys.version)
Traceback (most recent call last):
  File "<string>", line 1, in <module>
NameError: name 'sys' is not defined. Did you forget to import 'sys'?
make: *** [step2.mk:6: all] Error 1
```

Not so good. This is because Make executes each line of a target separately, so in our case it ran:

1. `python -c "import sys"`
2. `python -c "print(sys.version)"`

(In case you are wondering, the `-c` is defined in the variable `.SHELLFLAGGS`).

This is not what we want. Fortunately Make provides a way to change this behavior. When the Makefile contains the `.ONESHELL:` pseudo target, Make passes all the target commands at once to the shell. Using this let's you write complex shell commands without ending each line with `\`. Let's modify our Makefile:

```Makefile
# step3.mk
SHELL := python

.ONESHELL:

all:
	import sys
	print(sys.version)
```

Run it:

```
$ make -f step3.mk
import sys
print(sys.version)
3.12.3 (main, Feb  4 2025, 14:48:35) [GCC 13.3.0]
```

Much better.

## Python blocks

Python is famous for using indentation to define blocks. Can we make this work inside a Makefile?

```Makefile
# step4.mk
SHELL := python

.ONESHELL:

all:
	for x in range(4):
		print(x)
```
