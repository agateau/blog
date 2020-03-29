pub_date: 2013-01-31 23:07:59 +01:00
public: true
tags: [gwenview, kde]
title: "Little bits of news about Gwenview"
summary: |
    A short update on latest changes happening in Gwenview project

Some news from Gwenview world:

## New mailing-list

One year ago, I decided to [replace Gwenview mailing list with a forum][forum].
The idea behind that move being that forums were more adapted for user support.

Gwenview forum is doing quite well: there are more users helping each others
there than what used to happen on the mailing-list. I assume this is because
there are more users on KDE forums.

One thing happened during this cycle, though: a new contributor, Benjamin Löwe,
joined and has been very active on Gwenview. Therefore I decided it would be a
good idea to create a developer mailing-list: [gwenview-devel][].

## Gwenview 2.10.0 is dead, long live Gwenview 4.10.0!

Until now Gwenview has always been using its own version number, which was
the same as KDE SC version number, except the major was 2 instead of
4. For example, the version of Gwenview which came KDE SC 4.9.5 was 2.9.5.

This made sense to me because the version of Gwenview shipped with KDE SC 4.0.0 was
the first major rewrite of Gwenview: so I bumped the version number to 2.0.0.

Even if it made sense to me, people were often confused by these two version
numbers. Furthermore, Benjamin pointed out that since we used 2.y.z in
the "FIXED-IN" Bugzilla field, our fixes did not show up in KDE SC release
changelogs. Therefore I decided to bump the version to 4.10.0. No more confusion!

## More reviews

Benjamin and I have been busy fixing as much bugs as possible for the 4.10.0
release. I am quite happy that almost all the latest commits have gone through
review before landing in the KDE/4.10 branch.

I believe doing more reviews will help improve the quality of Gwenview code and
avoid regressions. To this end I decided to start asking for review for my own
code as well. Gwenview has been mostly a one-man project until now, so I
committed directly to master. Now that the [bus factor][bus-factor] has been
multiplied by 2, it is possible to get all code reviewed before it lands in
master.

That's it for now, time to plan 4.11!

_(PS: I am going to [FOSDEM][], see you in Brussels!)_

[forum]: /2011/12/14/announcing-gwenview-forum/
[FOSDEM]: http://fosdem.org
[gwenview-devel]: https://mail.kde.org/mailman/listinfo/gwenview-devel
[bus-factor]: https://en.wikipedia.org/wiki/Bus_factor
