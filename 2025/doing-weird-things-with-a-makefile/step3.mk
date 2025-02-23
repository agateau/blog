# step3.mk
SHELL := python

.ONESHELL:

all:
	import sys
	print(sys.version)
