pub_date: 2015-12-05 11:19:36 +01:00
public: true
tags: [Git, Tips]
title: "Includes in your git config"
summary: |
    Using includes to split your git configuration

So, let's assume you work on several machines. You have set up a system to centralize all your dot files so that you have a familiar environment everywhere you log in.

There are many ways to do this, I personally created a Git repository for my dot files. This repository contains a script which creates symbolic links at the right place, and another script which periodically commits any changes, pulls then pushes.

So far so good. Now, what if you want your Git configuration to be subtly different from machine to machine? In my case I wanted to have a different value for `user.email` when I am on a work account and when I am on a personal account.

Git supports includes, so you can modify your `~/.gitconfig` like this:

    [include]
    path = ~/.gitconfig.local

Then you can create a `~/.gitconfig.local` with account-specific configuration, for example:

    [user]
    name = Aurélien Gâteau
    email = me@example.com

Simple enough, but I actually lost a lot of time because I was testing the configuration like this:

    $ git config --global user.email

The `--global` option tells Git to ignore the repository configuration and only look at the `~/.gitconfig`. Turns out that when you specify a configuration file, using `--global` or `-f <somefile>`, then `git config` does not expand includes! Reading documentation a bit more, I found out that the correct command is:

    $ git config --global --includes user.email
    me@example.com

That's it, hope it saves you some time!