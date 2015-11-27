pub_date: 2015-11-27 22:36:15 +01:00
public: true
tags: [Yokadi]
title: "Resuming work on Yokadi"
summary: |
    After a long period of inactivity, we are back working on Yokadi.

A few weeks ago we started working again on [Yokadi][], our command-line oriented, todo list. We are now finally ready to release version 1.0. This new version fixes a few bugs but does not bring new features. This lack of new features is actually a conscious decision: we wanted to make changes under the hood, and doing changes under the hood at the same time as adding new features is often a recipe for disaster.

What happened under the hood? I hear you asking.

Well, we finally ported Yokadi to Python 3. Mind you, it was not a straightforward port. The main pain point was [SQLObject][], the ORM we have been using since we started Yokadi. At the  time we wanted to start porting Yokadi to Python 3, SQLObject had not been ported (the port is still not ready, only an alpha has been released) so we had to first switch to another ORM — we went with [SQLAlchemy][] — before actually porting the application to Python 3. In fact I suspect Sébastien started the Python 3 port just to get rid of SQLObject, which he does not really like :)

The code is pretty much frozen by now, we have been using it for real-life todo-list work for quite some time: even if there are periods without active development, we still use and depend on Yokadi daily. We plan to get 1.0 out this weekend. Then we can start working on improvements and new features, a few of them are actually in progress, but I'll write more about them later.

[Yokadi]: http://github.com/agateau/yokadi
[SQLObject]: http://sqlobject.org
[SQLAlchemy]: http://sqlalchemy.org