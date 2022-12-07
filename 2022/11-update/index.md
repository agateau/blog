pub_date: 2022-12-07 08:37:11 +01:00
public: true
tags: [clyde, pixelwheels, monthlyupdate]
title: November 2022 monthly update, lots of releases!

## Introduction

This month is pretty packed with releases! A new Pixel Wheels, a new Git Bonsai and two Clyde releases!

<!-- break -->

## Pixel Wheels

I finally released version 0.24.0. This release includes a new track: "Up, up, up and down!" and a new vehicle, the "Broster Truck". It comes quite a few other changes too, have a look at the [release announcement](../pixelwheels-0-24-0/) to learn more.

A few issues have been reported on this release, so I may have to publish a 0.24.1, we'll see.

Pixel Wheels also got an article in [issue 187][fcm] of Full Circle Magazine, an independent magazine about Ubuntu. Pretty happy about it!

[fcm]: https://fullcirclemagazine.org/2022/11/25/full-circle-magazine-187/

## Git Bonsai

I didn't plan to work on Git Bonsai, but I got annoyed enough by it not properly dealing with repositories whose default branch is not called "master" that I fixed that.

While I was at it, I made a bunch of clean-ups, such as adding a pre-commit configuration (and making the CI run them) and making `cargo clippy` happy. This is the curse of projects which get touched only so often: every time you return to them, the Rust tool-chain has updated and Clippy has learned to detect new sub-optimal code :)

Once this was done I released [version 0.3.0](https://github.com/agateau/git-bonsai/releases/0.3.0).

## Clyde

This month I released not one, but two versions of [Clyde](https://github.com/agateau/clyde)! The changes introduced by these new versions are mostly useful to create packages.

The first significant change is the ability to ship extra files with a package. I planned to make use of this to package Firefox: it works, but I did not take into account the fact that the prebuilt Firefox auto-updates itself. This is a nice feature, especially for a browser, but it makes packaging it with Clyde odd, since it can change versions without Clyde being aware of it... I am probably going to use this extra files feature to package more AppImage-based applications instead.

The second significant change is the ability to define tests. Tests are commands run by `clydetools check` (and thus by the CI). If one of them fails, the package update is not merged in the store. This is important to ensure new packages work on all supported platforms. This second feature was released a bit too fast, and... did not work properly on Windows, hence the 0.4.1 release.

Finally, work is on-going to make it easier for `clydetools fetch` to automatically fetch updates for all packages, not only GitHub hosted ones. This is issue [#119](https://github.com/agateau/clyde/issues/119).

## Clyde store

Beside the regular updates, I added 3 new packages:

- [lazydocker](https://github.com/jesseduffield/lazydocker)
- [tv](https://github.com/alexhallam/tv)
- [xsv](https://github.com/BurntSushi/xsv)

Another important change was adding tests to most packages. Doing so highlighted a CI issue: some packages cannot be tested because the CI cannot run them (see [#124](https://github.com/agateau/clyde/issues/124)).

## What's coming next?

For December, besides preparing for Christmas 🎅, I am going to fix the issues reported on Pixel Wheels and maybe publish a bug fix release. On Clyde front, I plan to continue the work to be able to fetch updates for packages not hosted on GitHub.
