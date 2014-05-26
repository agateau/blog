pub_date: 2013-07-10 00:04:53 +02:00
public: true
tags: [KDE, Akregator, KDEPIM]
title: "Fixing my Akregator morning routine"
summary: |
    How my morning routine brought me to do a few Akregator fixes.

When I wake up, I often start the day with a few webcomics (yes, I am a slacker) which I read with Akregator. One of them is [Penny Arcade](http://www.penny-arcade.com). This site also features articles, mostly about the game industry. One morning I bumped into an article about the [OUYA](http://www.ouya.tv/), an Android-based console. Unfortunately, the link from Akregator did not work. This was not the first time it has happened so I decided to look into it.

Downloading the RSS feed, it turned out some articles do not have a complete URL, instead, the `<link>` item contains only an absolute path. The RSS spec says the `<link>` is an URL, so the feed is not spec-compliant, but that is probably to be expected when the feed announces itself like this :)

    <?xml version="1.0" encoding="utf-8"?>
    <rss version="2.0">
    <channel>
        <title>Penny Arcade</title>
        <link>http://www.penny-arcade.com</link>
        <description>News Fucker 6000</description>
        ...

Anyway, I made a small patch to add support for that spec deviation. Happy with my fix, I went bug-hunting on Bugzilla, wondering if someone had reported it before. I stumbled on [bug 117478][bug117478], which looked similar, but was actually about an ATOM feed. I thought the fix would be similar and dived into it. Turns out this new fix had nothing to do with the previous one... (by the way, [the feed from the bug][tbray] is quite interesting, I added it to my feed list)

Having fixed two Akregator bugs, I decided this would be an Akregator day, and went to look into another one which had been annoying me for too long, [bug 103216][bug103216]: "Icons created by embedded browser remain in status bar". This one took me quite some time to figure out. I tried multiple approaches before setting on one which also required a small change in kdelibs. But it's fixed now, Akregator feels a bit nicer to use!

PS:

![Akademy 2013](akademy-2013.png)

[bug117478]: https://bugs.kde.org/show_bug.cgi?id=117478
[bug103216]: https://bugs.kde.org/show_bug.cgi?id=103216
[tbray]: http://www.tbray.org/ongoing/
