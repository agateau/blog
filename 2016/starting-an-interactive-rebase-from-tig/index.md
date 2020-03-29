pub_date: 2016-09-16 23:17:51 +01:00
public: true
tags: [tig, git, tips]
title: "Starting an interactive rebase from Tig"
summary: |
    A handy configuration tip to be able to start an interactive git rebase from Tig.

One of the tools I use a lot to work with git repositories is [Tig][]. This handy ncurses tool let you browse your history, cherry-pick commits, do partial commits and a few other things. But one thing I wanted to do was to be able to start an interactive rebase from within Tig. This week I decided to dig into the documentation a bit to see if it was possible to do so.

Reading the [manual][] I found out Tig is extensible: one can bind shortcut keys to trigger commands. The bound commands can use of several state variables such as the current commit or the current branch. This makes it possible to use Tig as a commit selector for custom commands. Armed with this knowledge, I added these lines to `$HOME/.tigrc`:

```
bind main R !git rebase -i %(commit)^
bind diff R !git rebase -i %(commit)^
```

That worked! If you add these two lines to your `.tigrc` file, you can start Tig, scroll to the commit you want and press Shift+R to start the rebase from it. No more copying the commit id and going back to the command line!

Note: Shift+R is already bound to the refresh action in Tig, but this action can also be triggered with F5, so it's not really a problem.

[Tig]: http://jonas.nitro.dk/tig
[manual]: http://jonas.nitro.dk/tig/manual.html
