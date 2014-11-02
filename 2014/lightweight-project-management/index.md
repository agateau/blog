pub_date: 2014-10-12 23:33:00 +02:00
public: false
tags: [project-management, side-projects]
title: "Lightweight Project Management"
summary: |
    How I plan to manage my many side projects

Hi, my name is Aurélien and I have a problem: I run too many side projects. And I have an even bigger problem: I don't plan to stop running them, or creating new ones.

Most of those projects are tools I created to fill a personal need, but a few of them evolved into "products" which I believe can be useful to others. I restrain from talking about them however because I don't have the time to turn them into proper projects: creating a home page for them, doing regular releases and so on. This means they only exist as git repositories and end up staying unknown, unless I bump into someone who could benefit from one of them, at which point I mention the git repository.

Running software from git repositories is not always a great experience though: depending on how a project is managed, upgrading to the latest content can be a frustrating game of hit-and-miss if one cannot rely on the "master" branch being stable. I don't want others to experience random regressions. To address this, I decided that starting today, I will now run side-projects which I consider worth others to use following what I am going to pompously call my "Lightweight Project Management Policy":

- There is no release.
- The "master" branch is always stable.
- All developments happen in the "dev" branch or in topic branches which are then merged into "dev".
- Code inside the "dev" branch does not get merged into "master" until it has received at least a few days of real usage.
- The root of the git repository contains a README.md, which acts as the project homepage (already common practice on GitHub anyway).
- The policy is mentioned in the README.md.

This policy means that as long as you stick with the "master" branch, you can reliably get any project running with this policy by simply cloning its repository.

In the next weeks, I am going to "migrate" some of my projects to this policy. Once they are ready, I'll blog about them. Who knows, maybe you will find some of them useful?