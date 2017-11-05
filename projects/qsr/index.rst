public: yes
tags: []
disqus: false

QSR
---

QSR stands for Qt Search and Replace.

This tool makes it possible to perform search or search-and-replace operations
on all files or a subset of files of a directory.

.. thumbimg:: qsr.png
    :thumbsize: 600

Most interesting features
=========================

Files can be selected with one or more wildcards. For example, enter ``*.h *.cpp``
to look for C++ source files.

Search pattern may be either plain-text or a Python regular expression and may
be case-sensitive or not.

Replacement expression can use Python placeholders to reuse parts of the search
pattern. For example if the search pattern is ``int (foo|bar|baz);``, and
replacement expression is ``long \1;`` then ``int foo;`` will be replaced with
``long foo;``.

Interactive editing: after a search, it is possible to click on a search result
to edit the text at the matching line from within the application. Double
clicking the result opens the file at the matching line with an external editor.

More Information
================

- `README <http://quickgit.kde.org/index.php?p=scratch%2Fgateau%2Fqsr.git&a=blob_plain&f=README.md>`__

Get It!
=======

Clone the Git repository: ``git://anongit.kde.org/scratch/gateau/qsr.git`` or `browse it <http://quickgit.kde.org/index.php?p=scratch%2Fgateau%2Fqsr.git&a=summary>`__.
