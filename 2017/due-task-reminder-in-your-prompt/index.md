pub_date: 2017-01-22 17:42:24 +01:00
public: true
tags: [Yokadi, Tips]
title: Due task reminder in your prompt
summary: |
    Showing the number of tasks due in your prompt.

Over my years of managing my TODO list with [Yokadi](https://yokadi.github.io) I have tried many approaches, with various levels of success.

Yokadi comes with a daemon, Yokadid, which pops notifications on your desktop for tasks which are late or about to be late. I don't personally use it because I find it too intrusive, especially when looking at my screen with a coworker or sharing my screen during a remote meeting.

Since I spend a lot of time in terminals, I figured out it would be nice to have a reminder there. To keep this discreet, I only wanted to show the number of due tasks. This is what it looks like:

    [agateau ~/src d: 4]
    $ █

As you can see, the only indication that I have 4 tasks due is the `d: 4` part of my prompt.

I use the same Yokadi database for my personal and my professional user account, so for my personal account I wanted a count of all overdue tasks for projects whose name does not start with "geny" (the company I work for is called Genymobile, so all my work projects are named "genysomething").

I didn't want to access Yokadi database every time the prompt shows up, so instead I did the following:

First I created a short script called "ydue", which prints the number of overdue tasks matching a given filter. It looks like this:

    #!/bin/sh
    set -e
    filter="$*"
    yokadi "t_list --format plain --overdue $filter" | grep --count '^- '

That's a bit hackish: it calls Yokadi to list all tasks matching the filter in plain mode, and prints the number of tasks, based on the fact that a task line starts with `- `.

Then I setup a cronjob to call `ydue` every 5 minutes and store the output in `~/.cache/taskcount`

    */5 * * * * ydue "!geny%" > ~/.cache/taskcount

Finally, I modified my `.zshrc` to include the task count in the prompt if it's greater than 0.

    if [ -e "$HOME/.cache/taskcount" ] ; then
        local taskcount=$(cat $HOME/.cache/taskcount)
        if [ "$taskcount" -gt 0 ] ; then
            extraps="${extraps} d: $taskcount"
        fi
    fi

    PS1="[$user$host %~$extraps]$nl$ "

(`$extraps` is a variable which can contain other info like the current branch when inside a git repository. `$nl` is a newline character)

That's it, I now get a discreet reminder that I have tasks due today. Every time I get it down to 0, I pat myself on the back :)
