public: true
pub_date: 2022-11-07 19:07:21 +01:00
tags: [clyde, pixelwheels, monthlyupdate]
title: October 2022 monthly update

## Introduction

As expected, this month was not very productive because of [Inktober](../inktober). I made some progress on Pixel Wheels and Clyde though.

## Pixel Wheels

### Android API Level

I am preparing the next release of Pixel Wheels. Google notified Android developers they would start requiring Android API Level 31 for updated applications on November 1st, I had to bump dependencies for the release. I try to avoid dependencies update right before a release because I want to have enough time to test the game after updates, but there was no choice here. Updating the Android SDK to API Level 31, in turn required an update of the Android Gradle Plugin, which itself required an update of Java and Gradle 😅.

After the usual battle with the build system, I managed to get the game to work again on desktop and Android, using Android SDK 31. We are good to go for the release!

### Getting "turbo-blocked"

The new track features some shortcuts among the trees, with turbo cells to avoid loosing too much time by driving in the snow:

![Snow shortcut](snow-shortcut.png)

This triggered an "interesting" behavior: if you hit a tree while on a turbo cell, the turbo would continuously trigger, making it impossible to unstuck yourself. I modified the way turbo cells work to avoid that bug: now a turbo cell won't trigger again until your wheels have left it.

<!-- break -->

### Android TV launcher fixes

I fixed the listing of the game on Android TV, so that it appears in "games" and not in "apps" ([#276][]).

[#276]: https://github.com/agateau/pixelwheels/issues/276

### XDG support

A [bug report][fpbug] on the Flatpak package, reminded me that while Pixel Wheels uses the default directories suggested by the [XDG Base Directory][spec] specification, it did not support the XDG environment variables. I fixed this, but I still have to test it solve the issue.

[fpbug]: https://github.com/flathub/com.agateau.PixelWheels/issues/1
[spec]: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html

### Translations

Translators have been busy updating their translation. The following languages are ready:

- Basque
- Chinese
- German
- Russian
- Swedish

## Clyde

### `package-dir` support has been merged

`package-dir` support, the ability to define a package as a directory containing an `index.yaml` file has been merged in the main branch. This support makes it possible to ship extra files and opens the way to define a custom fetch script.

A custom fetch script would make it possible to automate package update for packages hosted everywhere, instead of only supporting packages hosted on GitHub. I haven't decided yet the "API" of this script and whether I want to force a particular language to write them.

### Activation script improvements

Clyde activation script now defines the `$XDG_DATA_DIR` and `$CLYDE_INST_DIR` environment variables. The first one helps improving integration on Linux systems. The second one can be useful for Clyde-specific scripts installed by packages.

Since the activation script now requires being updated, `clyde setup` learned the `--update-scripts` option. When using this option, the command update existing activation scripts, instead of preparing a new Clyde installation.

## Clyde store

Not a lot of changes on the store beside the regular version updates:

- one new package: [battop](https://github.com/svartalf/rust-battop)
- git-filter-repo now works on macOS, but only in the `next` branch, as the fix needs some unreleased change on Clyde side

## What's coming next?

For November, I want to release Pixel Wheels 0.24.0, and a new version of Clyde. Let's see if I can get this done!
