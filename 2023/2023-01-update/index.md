public: true
pub_date: 2023-02-03 07:49:58 +01:00
tags: [clyde, pixelwheels, nanonote, monthlyupdate, tmfi]
title: January 2023 monthly update

## Introduction

## Pixel Wheels

Hendursaga fixed mouse navigation in the language selection screen as well as the font used for Esperanto, thanks!

On my side, I fixed a tricky bug which caused the player rank to be wrong on championships on the 2nd and 3rd race. I also fixed some potential stuttering issues, should help keep the game smooth on screens with refresh rates higher than 60 Hz.

Finally, I have been making some R&D, trying to evaluate how much work would be required to add LAN-based multiplayer support! That's potentially a large Pandora box, so I am approaching this with caution. I actually wrote an article about [Pixel Wheels Pandora boxes][pandora].

[pandora]: ../opening-another-pandora-box/

As explained in the article, I am building a very simple network-based Pong game. Since the Pandora boxes article I managed to keep two machines synchronized reliably, so I can move to the next step: introduce Box2D in the game.

![NPong screenshot](npong.png)

## Clyde store

Things have been calm on Clyde development front, but the Clyde store gained new packages:

- [Delta](https://github.com/dandavison/delta)
- [GitUI](https://github.com/extrawurst/gitui)
- [Hadolint](https://github.com/hadolint/hadolint)
- [Sylver-cli](https://github.com/sylver-dev/sylver-cli)
- [Vault](https://www.vaultproject.io)

I also streamlined a bit more package updates, I am close to the point where they can be fully automated.

Something interesting happened with the Vault package. Because of the [attack on Circle CI][circle-ci], Hashicorp [decided to rotate the key][rotate-key] they use to sign the macOS binaries. They also re-signed and re-uploaded all their already released binaries.

[circle-ci]: TODO
[rotate-key]: TODO

The Clyde Store repository CI checks all packages every day. This is meant to detect if a binary goes away, or if it has been tampered with. This check worked well: the day Hashicorp changed the binary, Clyde Store CI turned red, until I dug into this (at first I thought Hashicorp has been breached, but that would have been surprising!), found about the re-upload and updated macOS checksum.

## TMFI - The Missing Firefox Installer

This is a very small project I put together as a simple way to install Firefox on them machines I maintain: Mozilla provides prebuilt binaries for all OSes, including Linux, but Linux support is rough: Mozilla provides a plain tarball with no integration: no Firefox launcher in the desktop menu, no `firefox` binary in `$PATH`. TMFI fixes that. When you run `tmfi`, it:

- Downloads the latest binary
- Installs it in `~/.cache/firefox`
- Creates a desktop menu entry for it
- Creates a `firefox` symbolic link in `~/.local/bin`

Since the prebuilt binaries automatically update themselves, you never have to worry about your installation being outdated. This is the reason I ended up creating this installer instead of adding Firefox to Clyde store: it's no good if you install a package at vN and behind Clyde back the packages changes itself to vN+1, adding and removing files without Clyde knowing about it.

![TMFI screenshot](TODO)

## Nanonote

[Nanonote][] is a minimalist note taking application I built a few years ago. I haven't worked on it for literally years, but I use it every day! But this week I received a pull request from Daniel Laidig fixing keyboard shortcuts not showing in Nanonote context menu on macOS. This is all the more welcome that I don't have a macOS machine to test Nanonote anymore. Daniel is also busy with another interesting feature, which should hopefully land in February 🤞.

![Nanonote screenshot](TODO)

The CI was not happy, that's what happen when some dependencies are not pinned and you leave a project alone for too long... This prompted me to refresh it: moving the coding-style step to a separate job, updating Qt (required much wrestling with [aqtinstall][]), SingleApplication and Catch 2.

I am mostly done with the fixes, but I am considering simplifying the dependency installation code, which is very messy, by using Clyde. The CI is an interesting use-case because Clyde makes it easy to install pinned versions of required tools on all platforms.

[aqtinstall]: TODO
[Nanonote]: https://github.com/agateau/nanonote

## What's coming next?

I am currently in the process of releasing Pixel Wheels 0.24.2. Google Play just approved it, so it might be out by the time you read this. Apart from this, I plan to continue working on the network Pong game, and spend some time helping Daniel land his new feature in Nanonote!
