---
public: true
pub_date: 2024-10-09 08:23:16 +01:00
tags: [pixelwheels, monthlyupdate]
title: September status update, Pixel Wheels has been released!
mastodon: https://mastodon.xyz/@agateau/113284982018695780
---

## Introduction

Finally, [Pixel Wheels 0.26.0 has been released](../pixelwheels-0-26-0)! It's been a long time coming. Now that it's out, I can focus on the last big feature I want to add before 1.0.0: difficulty levels.

<!-- break -->

## Pixel Wheels release

The release went reasonably well, I add to update a few Android related build-dependencies to please Google Play and make another change to please Flathub, but nothing major.

I was wondering how people would feel about the new weapon effect because it's a significant change, but so far so good, no angry feedback 🤞.

## Difficulty levels

As I said in the introduction, I am now working on adding difficulty levels to the game. The idea is to add something like Mario Kart 50cc, 100cc, 150cc (and 200cc since Mario Kart 8) engine classes.

I expect this feature will make the game easier to get into, by having new players start with slower vehicles. It should also slightly expand the lifetime of the game by providing extra challenges once players are more comfortable with the game.

I don't want to do a plain copy of Mario kart difficulty level names, so difficulties are called "Leagues". There are 3 leagues so far: "Casual", "Pro" and "Legendary". This is still subject to change though, if I find some more interesting names (suggestions are welcome!).

The user interface to select a league is a bit rough, but it does the job:

![Selecting a league](leagues.png)

At the moment the difficulty only affects the "max driving force", making vehicles go slower in easier leagues. More testing is required to decide if this is good enough, or if more settings should be changed, but the game engine can now handle such changes, so this is good.

## What's next?

For October I plan to continue working on this difficulty system. The next big change is modifying the way records are stored. They must now depend on the difficult they were performed in. This is a bit trickier than it sounds, and I will also have to migrate existing record savings.
