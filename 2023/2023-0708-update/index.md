---
public: true
pub_date: 2023-09-08 08:05:30 +01:00
tags: [monthlyupdate, pixelwheels, burgerparty, sfxr-qt, nanonote, colorpick]
title: July-August 2023 monthly update
mastodon: https://mastodon.xyz/@agateau/111034418447293741
---

## Introduction

Monthly updates are not dead! They just took some summer vacations 😅. Let's see what happened during these two months.

## Pixel Wheels

I finally released Pixel Wheels 0.25.0. It's been a long time coming, but now it's there. Here is the [release announcement][].

[release announcement]: ../pixelwheels-0-25-0/

This release was made a bit harder by Google Play getting in the way, see this [frustrated Mastodon thread][] for more details :)

[frustrated Mastodon thread]: https://mastodon.xyz/@agateau/110977197958988935

## SFXR-Qt

[SFXR-Qt][] received a bit of build-system and dependency love. I merged a PR from Mailaender to add an option to use the system provided Catch2 library instead of the bundled one. This prompted me to update the bundled Catch2 to version 3.4.0.

[SFXR-Qt]: https://github.com/agateau/sfxr-qt

## Burger Party

Shortly after the release of [Burger Party][] 1.4.2, I received two new translations: Basque by Josu Igoa (who also translates Pixel Wheels!) and Spanish by YottaMxt. Probably going to make a new release in September to make these translations available.

Keep these translations coming! I am still amazed how publishing the game on F-Droid injected some new life in it!

[Burger Party]: ../../projects/burgerparty/

## Clyde store

The Clyde store received two new packages:

- [dust](https://github.com/bootandy/dust)
- [vale](https://vale.sh)

I also improved the CI a bit further: adding pre-commit and making it even easier to trigger updates.

## Nanonote

[Nanonote][] now speaks Polish, thanks to Marek Szumny. With Danish and Dutch, that makes 3 new translations since the last release. Another app to release in September...

[Nanonote]: https://github.com/agateau/nanonote

## Colorpick

Colorpick is a color picker I built a long time ago, whose distinctive features are the ability to check the contrast between a background and a foreground color as well as an arrow-keys-operated magnifying glass to pick the exact pixel you want to pick. I haven't been active on this app for years. Recently [redtide][] started contributing to it. They wanted to do many changes, and I was not that motivated to work on this app, so I offered to transfer it to them, which they accepted, so [Colorpick][] is now part of the [qtilities organization][]!

[Colorpick]: https://github.com/qtilities/colorpick
[qtilities organization]: https://github.com/qtilities
[redtide]: https://github.com/redtide

## What's next?

As mentioned in this report, I have some releases to do: a new Burger Party and a new Nanonote. Beside these, I have some work planned on Pixel Wheels. I need to add a 3rd track to Pix Cities championship, but that would increase the number of tracks to 9, which would not fit on the individual track selection screen anymore. This means I am going to work on this track selection screen first. I plan to change it so that one picks the championship first, and then the tracks inside it. This should fit the screen.
