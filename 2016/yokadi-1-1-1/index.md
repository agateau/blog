pub_date: 2016-11-14 08:01:17 +01:00
public: true
tags: [Yokadi]
title: Yokadi 1.1.1
summary: |
    Here is the first bug fix release of Yokadi 1.1

On Friday last week I released version 1.1.1 of [Yokadi][y], the console-based TODO list system. This new version brings the following changes:

- Improvements:
    - When listing multiple projects, order them alphabetically.
- Bug fixes:
    - Fixed parse error if the user sets a time of "17m".
    - When the user edits a task with `t_edit` and removes a keyword, remove the keyword from the task.
    - Made recurrence code work with dateutil 2.6.0.

Nothing earth-shattering, but a few nice to have. You can get it this new version from [Yokadi download page](https://yokadi.github.io/download.html) or install it directly with `pip3 install yokadi`.

[y]: https://yokadi.github.io