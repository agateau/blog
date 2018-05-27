pub_date: 2016-03-28 16:59:35 +01:00
public: true
tags: [yokadi]
title: Yokadi 1.0.2
summary: |
    Released a new bug fix version of Yokadi.

Today I released 1.0.2 of Yokadi, the command-line todo list, it comes with a few fixes:

- Use a more portable way to get the terminal size. This makes it possible to use Yokadi inside Android terminal emulators like [Termux][]
- Sometimes the task lock used to prevent editing the same task description from multiple Yokadi instances was not correctly released
- Deleting a keyword from the database caused a crash when a `t_list` returned tasks which previously contained this keyword

[Download it][dl] or install it with `pip3 install yokadi`.

[dl]: http://yokadi.github.io/download.html

[Termux]: https://termux.com
