public: no
pub_date: 2017-05-19 16:55:26 +01:00
tags: [howto, unison]
title: "Unison"
disqus: false

## Basic config

~/.unison/common

```
copythreshold = 5000
perms = 0
dontchmod = true
# Ignore some backup files
ignore = Name .*.lock
ignore = Name .*.sw?
ignore = Name .*~
ignore = Name *~
```

~/.unison/foo.prf

```
root = /home/bob/doc
root = ssh://example.com//home/bob/doc
include common
```

## Manual

<https://www.cis.upenn.edu/~bcpierce/unison/download/releases/stable/unison-manual.html>
