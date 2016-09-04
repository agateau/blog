pub_date: 2016-09-04 11:27:09 +01:00
public: true
tags: [Yokadi]
title: Yokadi 1.1.0 is out
summary: |
    A new version of Yokadi has been released.

I am happy to announce version 1.1.0 of Yokadi!

This new version adds a new command to manipulate your tasks: `t_medit`. `t_medit` lets you edit all tasks of a project in one go. Learn more about it from [this article about t_medit][1] I wrote earlier.

This new version also brings some new goodies for aliases: they can now be modified. The name of the alias can be modified with `a_edit_name` and the command with `a_edit_command`.

It also brings the following changes:

- New features & Improvements:
    - Database format updates are now easier to run: just run `yokadi -u`, no more separate `update.py` command. Updates are also much faster.
    - Task lists have been improved:
        - Borders look nicer.
        - Some bugs in the rendering of the title column have been fixed (wrong width, badly cropped text).
    - Yokadi now uses standard paths by default: the database is stored in ~/.local/share/yokadi/yokadi.db and non-essential data is in ~/.cache/yokadi/.
    - Reviewed and improved documentation. Moved developer documentation to a separate dir (doc/dev).
- Bug fixes:
    - The code handling recurrences has been made more robust.
    - Recurrences are now stored in a more future proof way.
    - Fixed `bug_edit` crash.
    - Fixed negative keyword filter: A task with two keywords k1 and k2 would not be excluded by a filter !k1.

You can install it with `pip3 install yokadi`, or get the source code from [Yokadi web site][2].

[1]: /2016/mass-edit-your-tasks-with-t-medit
[2]: http://yokadi.github.io/download.html
