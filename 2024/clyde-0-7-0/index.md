---
public: true
pub_date: 2024-04-07 08:45:40 +02:00
tags: [clyde, statusupdate, forgejo]
title: March 2024 update, Clyde 0.7.0
mastodon: https://mastodon.xyz/@agateau/112229120400566258
---

The focus of this month was on [Clyde](https://github.com/agateau/clyde). There was a number of changes I wanted to make, and I am happy to report I was able to implement most of them and release [Clyde 0.7.0][clyde-0.7.0] on April 2!

## New command: `clyde doc`

If a package provides documentation in its release assets, such as a README or an FAQ, Clyde packages install them in `$CLYDE_HOME/inst/share/doc/<package_name>`. If it provides man pages, they get installed in `$CLYDE_HOME/inst/share/man/man<number>`. This is useful, but let's face it, it's too much effort to `cd` there and open these files.

Enter `clyde doc`! Pass this new command a package name: it lists all documentation files provided by the package, let you pick one and opens it for you. If it's a man page it opens it with `man`, if it's a text file it uses your preferred pager, and for other file types like PDF it starts the system default application for this file.

Here is how it looks if I run it on ripgrep:

```
$ clyde doc ripgrep
  share/doc/ripgrep/CHANGELOG.md
> share/doc/ripgrep/FAQ.md
  share/doc/ripgrep/GUIDE.md
  share/doc/ripgrep/README.md
  share/man/man1/rg.1
```

You can control the `>` arrow with the up and down keys, then press Enter to read the selected file.

I am fan of offline documentation, but offline documentation is not always easy to reach. This feature has been on the back of my mind for a long time, I am happy to have it now!

<!-- break -->

## `clyde install` improved robustness

Until now, `clyde install` behavior was quite bullish: it did not look at where it stepped and would overwrite any file in its way. This should theoretically not be a problem because one is not supposed to manually add files where Clyde installs packages, but:

1. There is a difference between theory and practice;
2. If packages A and B were to provide the same file then installing package B after package A would cause Clyde to crash because its database does not allow a file to belong to more than one package. This was especially bad because it would leave the system in an inconsistent state: all B files installed (including the file in common with A) but no record of the installation, so `clyde uninstall B` would tell you B is not installed and do nothing.

This cannot happen anymore: with version 0.7.0 if `clyde install` finds that a file it wants to install already exists, it stops and remove all files it has already installed, leaving the system in a consistent state.

## `clydetools fetch` improvements

`clydetools fetch` is used by the Clyde store to find new releases of given packages. In Clyde 0.7.0 it learned two new tricks to be able to find updates for more packages.

### Forgejo support

First it got a new fetcher: ForgejoFetcher. As its name implies, this fetcher can find updates for package hosted on Forgejo (and Gitea) Git forges. This is important for me because even if Clyde itself is hosted on GitHub, I don't want it to become a GitHub only tool.

For now the only package using this new fetcher is [Forgejo][] itself, but I would love to add more. If you know of nice tools hosted on a Forgejo or Gitea forge, let me know: leave a comment, request a package for it by [filling an issue on Clyde store][pkgissue] or even better: read the [package tutorial][pkgdoc] and create one yourself!

### `include` fetcher option

Some projects publish multiple assets in the same release. This is problematic for Clyde fetchers because they try to get them all and gets confused as to which asset to use.

The new `include` fetcher option makes it possible to provide a regular-expression to limit which assets Clyde should look at.

Examples of such packages include [DuckDB][], which I just packaged, or the [redistributable Python builds by Gregory Szorc][python], which I am in the process of packaging (but the Windows launchers are getting in the way...)

## Get it

Clyde is available for Linux, macOS and Windows from its [GitHub page](https://github.com/agateau/clyde). If you like the idea of Clyde please spread the word about it! Talk about it with your coworkers or geek friends, share this article, anything helps!

[pkgdoc]: https://github.com/agateau/clyde/blob/80fcb1c82c64b741470ba509e0b980786d1e9987/docs/creating-a-package.md
[Forgejo]: https://forgejo.org
[DuckDB]: https://www.duckdb.org
[python]: https://github.com/indygreg/python-build-standalone
[pkgissue]: https://github.com/agateau/clyde-store/issues/new?template=package.md
[clyde-0.7.0]: https://github.com/agateau/clyde/releases/tag/0.7.0
