pub_date: 2014-12-31 16:19:49 +01:00
public: true
tags: [mup, markup, qt, python, markdown]
title: "MUP, a Markup Previewer"
summary: |
    Introducing another side-project of mine: MUP

Following up on [my decision to promote more side-projects][lpmp], here is a new one: MUP.

MUP is a markup previewer. It supports multiple markup formats. You can use it to read markup text, but it is also useful when writing markup text to check how your work looks, thanks to its refresh-as-you-save feature.

[lpmp]: /2014/lightweight-project-management/

![MUP in action](/hotlink/mup.png)

## Features

- Supports multiple markup formats, easy to extend
- Automatically refreshes itself when the document is modified, tries to retain the position in the document after refreshing
- Skips metadata headers, such as those used by static blog generators like Jekyll
- Supports gzipped documents, useful to read documentation shipped with Debian packages

## Supported Formats

MUP supports Markdown and reStructuredText using Python modules.

It also supports other formats using external converters. External converters are command line tools which are invoked by MUP to convert input files. To be used as an external converter, the tool must accept markup on stdin and produces HTML on stdout.

Right now, MUP supports the following converters:

- Markdown variants (you can never have too many Markdown parsers!):
    - Pandoc Markdown
    - GitHub Flavored Markdown via Kramdown
    - CommonMark
    - Gruber original Markdown
- Man pages:
    - Ronn
    - Groff
- Asciidoc

Adding a new converter is only a matter of creating a yaml file to describe its command line and the files it works with.

## Sounds Familiar?

You may have heard about this project as "mdview". It used to be named like this but I renamed it because a) it supports more than Markdown and b) there are at least a dozen projects named "mdview" on GitHub :)

## Want It?

MUP is on GitHub: <https://github.com/agateau/mup>. `git clone` it and follow the instructions from the Install section of the README.
