pub_date: 2015-04-19 23:29:55 +02:00
public: true
tags: [development, source-control, quality]
title: "Extensive Source Comments or Extensive Commit Messages?"
summary: |
    What is more important? Source comments or commit messages?

If you consider yourself as a serious developer, you know writing good commit messages is important. You don't want to be that guy:

[![XKCD #1296: Git Commit](http://imgs.xkcd.com/comics/git_commit.png)][xkcd]

_[XKCD #1296][xkcd]_

[xkcd]: https://xkcd.com/1296/

This applies to source comments as well: good comments save time, bad comments can be worse than no comments.

For a long time, I usually favored source comments over commit messages: whenever I was about to commit a change which needed some explanations, I would often start to write a long commit message, then pause, go back to the code, write my long explanation as a comment and then commit the changes with a short message. After all, we are told we should not repeat ourselves.

Recently I was listening to Thom Parkin talking about rebasing on [Git Minutes #33][gm33] (Git Minutes is a great podcast BTW, highly recommended) and he said this: "Commits tell a story". That made me realize one thing: we developers read code a lot, but we also read a lot of commit histories, either when tracking a bug or when reviewing a patchset. Reading code and reading history can be perceived as two different views of a project, and we should strive to make sure both views are readable. Our readers (which often are our future selves...) will thank us. It may require duplicating information from time to time, but that is a reasonable trade-off in my opinion.

So, "Write extensive source comments or extensive commit messages?" I'd say: "Do both".

<a href="https://flattr.com/submit/auto?url=http%3A%2F%2Fagateau.com%2F2015%2Fextensive-source-comments-or-extensive-commit-messages&description=Which+are+more+importants%3F+Source+comments+or+commit+messages%3F&title=Extensive+Source+Comments+or+Extensive+Commit+Messages%3F&user_id=agateau">
<img src="https://api.flattr.com/button/flattr-badge-large.png" alt="Flattr this" border="0">
</a>

[gm33]: http://episodes.gitminutes.com/2015/03/gitminutes-33-thom-parkin-on-mastering.html
