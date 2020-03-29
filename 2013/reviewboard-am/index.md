pub_date: 2013-08-16 23:59:47 +02:00
public: true
tags: [kde, git, tips, "review board"]
title: "reviewboard-am, applying patches from ReviewBoard made easy"
summary: |
    Presentation of a little tool I wrote to simplify the task of applying a patch posted on KDE ReviewBoard.

Let's imagine you are a KDE developer and contribute to a reasonably successful project. This project often receives patches, and these patches are reviewed using [KDE Review Board][rb]. Pre-commit reviewing helps improving quality, so it's good for us.

So far so good, you go through all those review requests, but actually downloading the diff and applying it to your local checkout of the source tree gets old very fast: developers are lazy creatures after all... Pretty soon you end up doing only static reviews: read the code, comment on mistakes you notice from this read and once it looks good enough, tick the "Ship It" check box. After all, the person who wrote that code certainly tested it before requesting a review, right? I am as guilty as others there, I did a few reviews that way in the past and I felt bad about it.

## Fixing laziness with code

A year ago, I got bored and spent some time to put together a simple command-line tool using Review Board API: [reviewboard-am][rbam]. Given a review-id, `reviewboard-am` downloads the diff, applies it to the current repository and commits the changes using information from the review request (author name, email request summary and description).

Here it is in action, applying a commit on Gwenview:

    $ reviewboard-am 112061
    Fetching request info
    Downloading diff
    Creating rb-112061.patch
    Running 'git am rb-112061.patch'
    Applying: Move code to check next image is selected after removal to ContextManager

I shared it with a few friends, but it stayed relatively unknown, hosted in a Gist on GitHub.

This week I finally took the time to move it to a proper place, it is now part of the [kde-dev-scripts repository][kds]. I hope it simplifies your life reviewing and applying patches.

## What about `rbt patch`?

A few months after I initially wrote this script, Review Board developers released [version 0.5 of RBTools][rbt-05], a set of command line utilities to work with Review Board servers. RBTools 0.5 features `rbt patch`, a tool to apply patches from a Review Board server.

The main difference with `reviewboard-am` is `rbt patch` applies the patch but does not do the commit for you (a feature which I imagine is more difficult to implement in a cross-VCS way). It may be good enough for you though. In any case it certainly beats downloading and applying the diff by hand.

[rb]: http://git.reviewboard.kde.org
[rbam]: http://quickgit.kde.org/?p=kde-dev-scripts.git&a=blob&h=6e6da8af6eb33e759c587f01ec020e2a731ddce2&hb=9c61f8d8f933949e3e255e32de7c4953f0781ca4&f=reviewboard-am
[kds]: https://projects.kde.org/projects/kde/kdesdk/kde-dev-scripts
[rbt-05]: http://www.reviewboard.org/news/2013/03/19/rbtools-0-5-released/
