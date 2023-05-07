public: true
pub_date: 2023-05-05 07:55:07 +01:00
tags: [monthlyupdate, pixelwheels, burgerparty, nanonote, clyde]
title: April 2023 monthly update

## Introduction

April has been a busy month. I worked on reviving 2-player split screen for Pixel Wheels and preparing to crank it to <strike>11</strike> 4. I also made some Nanonote releases and put some work on Clyde too. Finally I started refreshing Burger Party to keep it on Google Play!

## Pixel Wheels

As I [wrote earlier](../split-screen-revival-progress/), split-screen is back in Pixel Wheels. 2-player split screen already works and I am busy getting the game  ready for 4 players. The engine already supports 4 players. I "just" need to update the UI to do the same, but it's easier said than done.

So far the vehicle selection can select up to 4 players and the internals support 4 different inputs.

What remains to do is:

- Make it possible to select the number of players
- Rework the settings screens to support configuring 4 different inputs

<!-- break -->

## Nanonote

This month I released 2 release candidates of Nanonote. Then I integrated a Czech translation from Amerey (thanks!) right before releasing [Nanonote 1.4.0](../nanonote-1-4-0/).

There may be a new patch release later with new translations, but for now I am going to leave Nanonote as it is for a while.

## Clyde

Clyde received an important fix to make upgrades of itself smoother: when it detects itself in the upgrade list, it only upgrades itself and ask the user to restart the upgrade.

The reason for this is that sometimes Clyde vN+1 comes with support for a new feature in the package format. If other packages to upgrade make use of this new feature, trying to install them with Clyde vN is likely going to fail. By upgrading Clyde first we can be sure the other packages are installed with Clyde vN+1.

Clyde also gained support for installing completion files for Fish shell (that is a good example of a new feature in the package format...). I also added completion files to Clyde itself.

## Clyde store

Clyde store gained 3 new packages this month:

- [git-branchless](https://github.com/arxanas/git-branchless)
- [mkcert](https://mkcert.dev)
- [vhs](https://github.com/charmbracelet/vhs)

I also revisited packages with shell completion to make sure they install Fish shell completion files if they support it. This is in the `next` branch for now until the next Clyde release.

## Burger Party

After updating Cat Avatar Generator in [February](../2023-02-update), I am updating [Burger Party](/projects/burgerparty) so that it stays on Google Play.

So far I made a massive dependencies update:

- libgdx: 0.9.9 → 1.9.1
- Android SDK: 26 → 33
- Java: 1.6 → 11
- Gradle: 3.3 → 7.3.3
- Android Gradle Project: 2.3.3 → 7.2.2

This is what happens when a project is left alone for 5 years 😅.

I have some unfinished business with Burger Party: the game currently does not have an "end scene". There are sketches for it in the repository but at the time I drew them I just wanted to be done with the game and did not integrate them. That's why you only get a "Congratulations, you finished the game!" placeholder message, which is underwhelming to say the least.

That has always stayed nagging in a corner of my mind. Since I am refreshing the game, I decided to go ahead and finally integrate this end scene. It's mostly done, and I am quite happy I finally did it!

## What's next?

In May I plan to finish my Burger Party update and release it. Then finish Pixel Wheels 4 player support... and probably a bit of Clyde, we'll see!
