---
public: true
pub_date: 2024-09-27 07:41:13 +01:00
tags: [rant]
title: Why I don't use a Mac
mastodon:
---

## Introduction

I often read about the obnoxious Linux evangelist, looking down on Mac or Windows users. As a non-evangelist Linux user I often experience the opposite. These days it mostly comes from Mac users, because Mac hardware is popular among developers. This article lists some of the reasons I don't use a Mac. It's not meant to convince you to change your mind, it exists so that I can send it to condescending Mac users (Did I just send you this article? Sorry, not sorry).

<!-- break -->

## Hardware

I find Apple hardware beautiful and usually high quality, but some design decisions do not work for me:

- Apple AZERTY layout is a pain for developers, the various braces and pipes are annoying to type, and they are not even drawn on the keyboard because... minimalism. Yes, I could get a QWERTY keyboard, but I don't want to because the other computers surrounding me are all AZERTY.
- No Delete key. Yes, one can press Command-Backspace. No, I don't find this as convenient.
- No Page-up / Page-down keys. See previous point. Some PC vendors are also culprit of that, I have to get by without these on my work laptop.
- No real buttons on the touchpad. This is also more and more common among PC vendors. Again my work laptop suffers from this.
- Glossy screen. If you're in a train and the sun is blasting its rays on your screen, a matte screen is much more comfortable.

## Software

MacOS behavior sometimes feels weird. Note that I am not writing this from the perspective of someone who just switched to a Mac and needs some adaptation period: while I never personally owned a Mac, I have been responsible for maintaining 3 cross-platform (macOS, Linux, Windows) graphical applications in different companies and nowadays I maintain a CLI one. I spent hundred of days using macOS. I was there debugging PowerPC-specific bugs during the PowerPC to Intel transition, and I went through the Intel to ARM one. I even wrote an iPhone app (but that was a looong time ago)!

Now that this is out, here are my gripes with macOS.

I don't like how it keeps windows and apps separated. I find it mind-boggling that one can close all windows of an app and it would still be running, waiting for you to stop it from the menu-bar or Command-Q.

Dubious file manager. Operating the Finder using the keyboard is weird. Using Enter to rename a file does not feel natural at all to me: I expect Enter to trigger the default action on an item in a list. Renaming should *not* be the default action of a file manager. It also likes to poop `.DS_Store` files every now and then.

Lack of keyboard shortcuts to manage windows.

General lack of ability to define keyboard shortcuts. Yes, I am a KDE Plasma user, I expect to be able to change any keyboard shortcut, in apps or in the workspace.

BSD userland. Give me GNU coreutils please.

Oh, and as a developer, I need to know how to set up code signing to publish apps. It was already a pain in the bottom when I shipped that iPhone app. It's not getting any better. In fact, it's getting worse.

## Politics

While I am not an evangelist, I strongly believe free software is a good thing for humanity. Whenever possible, I prefer running free software. Apple contributes to a lot of open-source projects these days, but macOS is not open-source, and I would be very surprised if it ever become open-source.

But even without this open-source vs closed-source issue, Apple is just a bad actor for the industry, especially for third-party developers.

No way to side-load apps on your phone. This is annoying for users, but it's even more painful for developers: you can build your own app on your Mac and test it as much as you want in the simulator but if you want to run your *own* app on your *own* device you must pay the $100 *yearly* registration fee. Even if you don't intend to ever publish it. Oh and you have to register the ID of your test devices to be able to install the app from your development machine. Oh and you only have a limited number of test devices possible. For comparison, Google (not an angel either) lets you side-load apps, and asks for a $25 *one-time* payment to publish and app on Google Play.

They take a 30% cut on all transactions (Yes, that can be reduced to 15% in some situations. No, Google is not much better there either). Does your app provide an alternative mean of payment? Apple forbids you to put a link to it in your app, or even mention it is possible! Ever wondered why the Netflix app does not provide a link to their site to register as a new user, or why you can't buy ebooks from Amazon iOS app? [That is why](https://www.iphonelife.com/content/how-to-buy-kindle-books-iphone-or-ipad).

The recent [Patreon scandal][Patreon]. It really feels like a mobster visiting a shop: "Nice business you have here, would be a shame if it were to close. How about you give us 30% of what users give to creators? What? Your cut is only 8%? Sucks to be you."

I am old enough to remember [Apple suing Freetype over software patents](https://en.wikipedia.org/wiki/FreeType#Patent_conflicts). Yes, for a long time the fonts on Linux machines didn't look very nice out of the box. That was not because those stupid free-software hippies did not know how to code proper font rendering. It was just not legal to ship it, thanks to Apple software patents.

Actively [fighting][repair1] [right to][repair2] [repair][repair3].

Deciding one is not allowed to run macOS in a VM unless it's running on Apple hardware. Making it painful and costly to setup CI, or to debug your cross-platform app.

[Patreon]: https://news.patreon.com/articles/understanding-apple-requirements-for-patreon
[repair1]: https://pluralistic.net/2023/09/22/vin-locking/#thought-differently
[repair2]: https://www.youtube.com/watch?v=e3e-b-7jCYk
[repair3]: https://www.theverge.com/2024/2/9/24067957/apple-right-to-repair-oregon-bill-parts-pairing-ban

Most of these facts affects phones and tablets more than computers, but I don't want to give money to a company with such behavior, even if it does not affect the products I use (no, I don't use an iPhone either).

All these are also legal. Apple is definitely within their rights to do what it does. That does not make it ethical. I could get by with hardware and software limitations, but I'd rather avoid compromising on politics.

## Conclusion

So this is why I don't use a Mac: beautiful hardware that does not fit my peculiar needs, not-good-for-me software and nefarious politics.
