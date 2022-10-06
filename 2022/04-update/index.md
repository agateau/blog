public: true
pub_date: 2022-05-08 09:47:20 +01:00
tags: [pixelwheels, git-bonsai, monthlyupdate]
title: April 2022 monthly update

## Introduction

This month I spent all my time on Pixel Wheels except for adding a small new feature to Git Bonsai.

## Pixel Wheels

### Pixel Wheels know speaks German

Christian Schrötter contributed a German translation for Pixel Wheels, growing the supported languages to 9. That's awesome, keep them coming!

### Make championship, track and vehicle names translatable

Speaking of translations, championship, track and vehicle names are now translatable. This fixes bug [#168](https://github.com/agateau/pixelwheels/issues/168). While translating these is not mandatory for latin-based languages, it is required for the game to look good  in non-latin languages.

<!-- break -->

### Introducing the Miramar

Last month I wrote about adding a monster truck vehicle, and how that required some changes in the way vehicles are rendered. I hoped to finish these changes this month, but it turned out to be too large and I didn't want this to delay the next release for too long, so I changed my plan and decided to introduce a vehicle which would not require engine changes. Here comes the Miramar!

![The Miramar](miramar.png?3)

You can unlock the Miramar by finishing at least 2nd in the Pix Cities championship. It's the first vehicle unlockable this way. I plan to make other vehicles unlock-able in a similar fashion: version 1.0.0 should have fewer vehicles unlocked by default.

The name Miramar has a secret meaning, if you make some research you might find out what it refers to. Let me know if you figure it out!

### Dependency updates

I spent some time updating libgdx, the library powering Pixel Wheels. One of the reasons for this, apart from getting bug fixes and hopefully performance improvements, is to add support for M1 Macs.

I thought latest version of libgdx had support for this, but it turns out it's only in the master version so far, so M1 support is going to have to wait. I did nevertheless update libgdx to 1.9.14, gdx-controllers to 2.2.1 and updated all internal apps and tools to lwjgl3. libgdx latest version is actually 1.10.0 but this version performed poorly on my test low-spec Android tablet, so I stayed at 1.9.14. I think the next version fixes these issues (and hopefully brings M1 support!), fingers crossed!

These updates make the gap to jump to get M1 support smaller, so it's a good thing to have them in already.

## git-bonsai

[Git Bonsai](https://github.com/agateau/git-bonsai) is a small command-line tool to clean merged branches in a git checkout. I added a small feature to make it possible to configure per-repository protected branches, using `git config`.

## What's next

For May I want to release Pixel Wheels 0.23.0, or at least make it "ready to release". Right now there are four issues marked for the 0.23.0 milestone:

- [#225 "Open log file folder" does not work on Windows](https://github.com/agateau/pixelwheels/issues/225)
- [#223 Show championship name in "championship finished" screen](https://github.com/agateau/pixelwheels/issues/223)
- [#221 MultiPlayerScreen: "up" key does not work](https://github.com/agateau/pixelwheels/issues/221)
- [#186 Police car is not animated in championship finished screen](https://github.com/agateau/pixelwheels/issues/186)

I might postpone #186, but I should be able to take care of the others.

I don't plan to do much more in May, seeing that we are already the 8th and I am still writing this report :)
