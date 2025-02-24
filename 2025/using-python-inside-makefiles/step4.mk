# step4.mk
SHELL := python

.ONESHELL:

all: foo

foo:
	from pathlib import Path
	path = Path("$@")
	path.write_text("I am $@\n")
