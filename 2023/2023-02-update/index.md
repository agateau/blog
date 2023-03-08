public: true
pub_date: 2023-03-07 08:50:58 +01:00
tags: [monthlyupdate, pixelwheels, clyde, nanonote, cat-avatar-generator]
title: February 2023 monthly update

## Introduction

Welcome to this new monthly update!

This month I worked on the usual projects: Pixel Wheels and Clyde but also on Nanonote and an old one: Cat Avatar Generator. Let's get started.

## Pixel Wheels

As announced in January update, [Pixel Wheels 0.24.2 has been released][pwrel], adding 3 new translations (Hungarian, Esperanto and Turkish) and fixing 2 bugs:

- The display would sometimes stutter during races.
- In championships, the player rank could sometimes be wrong in the 2nd or 3rd race.

Since then, I fixed another bug which occurred while editing configuration keys ([#326][]). I also included another translation, this time it's Italian, thanks to Dario Canossi 🇮🇹!

[pwrel]: https://agateau.com/2023/pixelwheels-0-24-2/
[#326]: https://github.com/agateau/pixelwheels/issues/326

### NPong

I continued working on my NPong proof-of-concept network game. I added Android support, host discovery and introduced Box2D, making the game closer to Pixel Wheels. This might actually work 🤞!

<!-- break -->

## Cat Avatar Generator

[Cat Avatar Generator][catgen] is a small Android app I built a long time ago to... generate cat avatars (how surprising!) based on David Revoy excellent [Cat Avatar Generator][drcatgen].

It had not been updated for a few years, and Google warned me it would be removed from Google Play if it did not receive a new update, so... I did update it.

The internals have been modernized a bit and the dependencies updated:

- Gradle: 2.14.1 → 7.5.1
- AGP: 2.2.3 → 7.4.1
- SDK: 23 → 33

I also made the launcher icon adaptive, giving the app a more modern look, then released 0.2.1.

![Cat Avatar Generator screenshot](catgen.png)

[catgen]: https://github.com/agateau/cat-avatar-generator-app
[drcatgen]: https://www.peppercarrot.com/extras/html/2016_cat-generator/index.php

## Nanonote

Thanks to Daniel Laidig, [Nanonote][] now has support for Markdown-style tasks in lists!

[Nanonote]: https://github.com/agateau/nanonote

When creating a list entry with `- [ ]`, the next entry automatically starts with the same text checkbox. Ticking and un-ticking the box can be done with either Ctrl+Enter anywhere in the line of the entry or with Ctrl+Left click on the checkbox.

On my side, I worked on making sure standard actions like Copy or Paste are translated, on all OSes.

Now it only needs a new release!

## Clyde

A bunch of nice-to-have changes landed in [Clyde][] this month:

[Clyde]: https://github.com/agateau/clyde

- Clyde now tries 3 times to download assets before giving up. This makes it cope better with unreliable hosts.
- `clydetools fetch` now recognizes `aarch_64` in asset filenames as ARM 64bit architecture. This fixes fetching updates for Envoy.
- I reworked the file cache to avoid "corrupted assets" error messages when downloading assets whose names do not include version numbers (looking at you, [Difftastic](https://github.com/Wilfred/difftastic)!).
- `clyde setup` now makes a shallow clone of the store repository, reducing bandwidth usage.
- The URL for Clyde store can now be defined with `clyde setup --url STORE_URL`

## Clyde Store

Only one new entry this month: [dive](https://github.com/wagoodman/dive).

## What's coming next?

In March, I am going to:

- continue working on NPong;
- release a new version of Nanonote;
- if all goes well, release a new version of Clyde.
