---
public: true
pub_date: 2025-02-22 12:56:49 +01:00
tags: [makefile, tips]
title: "Using Python inside Makefiles"
mastodon: https://mastodon.xyz/@agateau/114061091389949752
---

## Introduction

Make is an ubiquitous tool to build software. It reads a configuration file (traditionally called `Makefile`). This file lists the targets to build, their dependencies and the recipes to build the targets from their dependencies.

Traditionally, the recipes are written in shell script. In this article I present how some creative use of Make variables can let us write those in Python instead.

Why? Well, I thought it would be an interesting challenge!

Disclaimers:

- While you might learn some useful tricks, I do not recommend doing this for serious work!
- I only tested the examples from this article with GNU Make: they make not work with BSD Make or with the one provided by macOS.

## Telling Make to use Python

Make lets you define the shell to use to run target recipes via the `SHELL` variable. You can use it to force Make to use `bash` instead of whatever `/bin/sh` points to. Nothing stops you from setting it to `python`:

```Makefile
# step1.mk
SHELL := python

all:
    print(f"Hello from {__name__}")
```

([step1.mk](step1.mk))

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

([step2.mk](step2.mk))

Run it:

```
$ make -f step2.mk
import sys
print(sys.version)
Traceback (most recent call last):
  File "<string>", line 1, in <module>
NameError: name 'sys' is not defined. Did you forget to import 'sys'?
make: *** [step2.mk:6: all] Error 1
```

Bummer, that does not work. This is because Make executes each line of the recipe separately, so in our case it ran:

1. `python -c "import sys"`
2. `python -c "print(sys.version)"`

ℹ️_The `-c` is defined in the `.SHELLFLAGGS` variable._

This is not what we want. Fortunately Make provides a way to change this behavior. When the Makefile contains the `.ONESHELL:` pseudo target, Make passes the whole recipe at once to the shell.

ℹ️_You can use `.ONESHELL:` to write complex shell recipes without having to end each line with `\`._

Let's modify our Makefile:

```Makefile
# step3.mk
SHELL := python

.ONESHELL:

all:
    import sys
    print(sys.version)
```

([step3.mk](step3.mk))

Run it:

```
$ make -f step3.mk
import sys
print(sys.version)
3.12.3 (main, Feb  4 2025, 14:48:35) [GCC 13.3.0]
```

Much better.

## Using automatic variables

[Automatic variables](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html) can be used in a Makefile to refer to the file name of a target (`$@`), the list of its prerequisites (`$^`), the first prerequisite (`$<`) and many other elements.

Since they are search-and-replaced inside the recipe they should just work. Let's try:

```Makefile
# step4.mk
SHELL := python

.ONESHELL:

all: foo

foo:
    from pathlib import Path
    path = Path("$@")
    path.write_text("I am $@\n")
```

([step4.mk](step4.mk))

Run it:

```
$ make -f step4.mk
from pathlib import Path
path = Path("foo")
path.write_text("I am foo\n")

$ cat foo
I am foo
```

That works. Let's move on to something trickier.

## Python blocks

If we want to write some serious Python-based recipes, at some point we are going to need `if` or `for` loops. Python uses indentation to define blocks. Can we make this work inside a Makefile?

```Makefile
# step5.mk
SHELL := python

.ONESHELL:

all: foo

foo:
    from pathlib import Path
    with Path("$@").open("w") as fp:
        for line in range(1, 4):
            fp.write(f"I am line {line}\n")
```

([step5.mk](step5.mk))

Run it:

```
$ make -f step5.mk
from pathlib import Path
with Path("foo").open("w") as fp:
for line in range(1, 4):
        fp.write(f"I am line {line}\n")
  File "<string>", line 3
    for line in range(1, 4):
    ^
IndentationError: expected an indented block after 'with' statement on line 2
make: *** [step5.mk:9: foo] Error 1
```

No luck. It looks like Make removes all leading tabs from the recipe lines before running it. In `step5.mk` all indentation is done using real tabs, so there are two tabs at the start of  the `for` line. Here is the same file with tabs replaced with `--->`:

```
# step5.mk
SHELL := python

.ONESHELL:

all: foo

foo:
--->from pathlib import Path
--->with Path("$@").open("w") as fp:
--->--->for line in range(1, 4):
--->--->--->fp.write(f"I am line {line}\n")
```

What about using spaces after the first tab, like this?

```
# step6.mk
SHELL := python

.ONESHELL:

all: foo

foo:
--->from pathlib import Path
--->with Path("$@").open("w") as fp:
--->    for line in range(1, 4):
--->        fp.write(f"I am line {line}\n")
```

([step6.mk](step6.mk))

Let's try:

```
$ make -f step6.mk
from pathlib import Path
with Path("foo").open("w") as fp:
    for line in range(1, 4):
        fp.write(f"I am line {line}\n")

$ cat foo
I am line 1
I am line 2
I am line 3
```

Yes, it works. If that sounds like a bad idea to you, then you are not alone...

A slightly less cursed approach is to use the `.RECIPEPREFIX` variable. This variable tells Make we want to use another character to indent our recipes:

```
# step7.mk
SHELL := python

.RECIPEPREFIX := >

.ONESHELL:

all: foo

foo:
>from pathlib import Path
>with Path("$@").open("w") as fp:
>    for line in range(1, 4):
>        fp.write(f"I am line {line}\n")
```

([step7.mk](step7.mk))

This works as well. Whether it's better or worse is up to you to decide... It is certainly going to look weird to others. In fact I had to disable syntax-highlighting on this snippet because [Pygment](https://pygments.org), the syntax highlighter used for this site, got very confused…

## Takeaways

With some combination of `SHELL`, `.ONESHELL:`, some creative use of tabs and spaces or of `.RECIPEPREFIX` it turns out one can use Python inside a Makefile, for maximum fun and confusion!
