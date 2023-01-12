pub_date: 2020-03-22 20:59:50 +01:00
public: true
tags: [git, rust, pko]
title: Introducing Git Bonsai

I don't know about you, but when I work in a git repository for a long time, I tend to accumulate branches, which I need to clean up.

There are a number of tools to do this, but since I have been teaching myself Rust I thought it was a good topic for a first "real" program. So here is "[Git Bonsai][git-bonsai]", a command-line tool to help you keep your git repository clean and tidy by:

- updating all branches to their remote ones
- deleting the merged branches

[git-bonsai]: https://github.com/agateau/git-bonsai

For example, given a repository like this:

```
$ git log --all --oneline --graph
*   f97c782 (HEAD -> master) Merging topic1
|\
| *   f6bfa90 (topic1) Merging topic1-1
| |\
| | * 6943ed2 (topic1-1) Create topic1-1
| |/
| * 4ea41ff Create topic1
|/
| * eec4ebe (topic2) Create topic2
|/
* b8b1506 Init
$ git branch
* master
  topic1
  topic1-1
  topic2
```

<!-- break -->

When I run Git Bonsai in it, it asks me if I want to delete the `topic1` and `topic1-1` branch, but not `topic2` since it has not been merged yet (The checkboxes can be unchecked if you want to keep a branch untouched):

```
$ git bonsai
Info: Fetching changes
Select branches to delete:
> [x] topic1-1, contained in:
      - master
  [x] topic1, contained in:
      - master1
```

After pressing Enter:

```
Info: Deleting topic1-1
Info: Deleting topic1
```

Now the repository looks cleaner:

```
$ git log --all --oneline --graph
*   39b904b (HEAD -> master) Merging topic1
|\
| *   2e22609 Merging topic1-1
| |\
| | * d7c0943 Create topic1-1
| |/
| * 7e6b5e7 Create topic1
|/
| * 5757873 (topic2) Create topic2
|/
* dc94163 Init
$ git branch
* master
  topic2
```

I am thinking of adding other cleaning features later, like the ability to list branches ordered by the date of the last commit and asking you what to do with them (merge them, rebase them, delete them?) or listing "gone branches" (branches with a tracking remote branch whose remote branch has been deleted). Even in its current state, it's already useful, I have been happily using it daily for one or two months now.

If you want to try it, you can get a pre-compiled Linux binary for version 0.1.0 from the [release page](https://github.com/agateau/git-bonsai/releases/0.1.0), or follow the instructions from the [README](https://github.com/agateau/git-bonsai) to build it yourself. I hope you find it useful. Pull requests are welcome to fix my beginner Rust code!
