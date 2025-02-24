# step6.mk
SHELL := python

.ONESHELL:

all: foo

foo:
	from pathlib import Path
	with Path("$@").open("w") as fp:
	    for line in range(1, 4):
	        fp.write(f"I am line {line}\n")
