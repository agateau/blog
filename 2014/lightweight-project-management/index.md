pub_date: 2014-11-13 22:52:09 +01:00
﻿pub_date: 2014-10-12 23:33:00 +02:00
public: true
tags: [project-management, side-projects]
title: "Lightweight Project Management"
summary: |
    How I plan to manage my many side projects from now on.

Hi, my name is Aurélien and I have a problem: I start too many side projects. In fact my problem is even worse: I don't plan to stop running them, or creating new ones.

Most of those projects are tools I created to fill a personal need, but a few of them evolved to the point where I believe they can be useful to others. I restrain from talking about them however because I don't have the time to turn them into proper projects: creating a home page for them, doing regular releases and so on. This means they only exist as git repositories and end up staying unknown, unless I bump into someone who could benefit from one of them, at which point I mention the git repository.

Running software from git repositories is not always a great experience though: depending on how a project is managed, upgrading to the latest content can be a frustrating game of hit-and-miss if one cannot rely on the "master" branch being stable. I don't want others to experience random regressions. To address this, I decided that starting today, I will now run such potentially-useful-to-someone-else side-projects using what I am going to pompously call my "Lightweight Project Management Policy":

- The "master" branch is always stable. You are encouraged to run it.

- There is no "release" branches and no manually created release archives, but there *may* be release tags if need arise.

- All developments happen in the "dev" branch or in topic branches which are then merged into "dev".

- To avoid regressions, code inside the "dev" branch does not get merged into "master" until it has received at least three days of real usage.

- The project homepage is the README.md file at the root of the git repository.

- The policy is mentioned in the README.md.

Any project managed with this policy should thus always be usable as long as you stick with the "master" branch, and it should not take me too much time to keep them alive.

In the next weeks, I am going to "migrate" some of my projects to this policy. Once they are ready, I'll blog about them. Who knows, maybe you will find some of them useful?
