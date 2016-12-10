pub_date: 2016-12-10 19:02:26 +01:00
public: true
tags: [Android, Cat, Avatar, Pepper&Carrot]
title: Cat Avatar Generator, the Android app!
summary: |
    I built an Android version of David Revoy cat avator generator.

David Revoy, the author of the amazing [Pepper & Carrot][pac] webcomic, recently published an online [cat avatar generator][cag]. My kids loved it, so last Sunday I took this as a pretext to do a bit of Android development by building an Android app for it.

.. thumbimg :: screenshot.png
    :alt: Cat Avatar Generator screenshot

It's a bit spartan for now since it was built in one day, but it works. You can get it on [Google Play][gplay].

If you want to improve it, you can find the source code on [GitHub][gh].

## Synchronizing cats is complicated

One of the things I wanted to improve was to modify the generator so that entering a name in the app would produce the same cat as David online generator. In this early version I did not copy the way the seed for the random generator is computed, because I knew it would not be enough: PHP and Java do not share the same random number generator.

This week I decided to try to extract the code used in PHP to generate random numbers so that I could re-implement it in my app. I created a PHP sample page which seeded the random generator and printed 3 numbers, then I downloaded PHP 7.1.0 source code, extracted the random code and turned it into a standalone C program doing the same thing my PHP sample page did. After a bit of tweaking I managed to get it to compile and run, but the numbers did not match what my PHP sample produced. After much head scratching and random (sic) experiments, I decided I needed more info so I recompiled PHP 7.1.0, planning to add some log output to understand what was going wrong.  Once this was done, I ran my PHP sample using my recompiled PHP 7.1.0 instead of the PHP I had installed via apt... Surprise! the numbers matched my C program!

Since the PHP installed on my machine was 7.0.8, I looked at the changelog for 7.1.0, and found this:

> rand() and srand() have now been made aliases to mt_rand() and mt_srand(), respectively. This means that the output for the following functions have changes: rand(), shuffle(), str_shuffle(), and array_rand().

[The rationale][rationale] behind this change is that the output of `rand()` was weak and system dependent, so did not produce consistent values when ran on different systems... still, that's annoying.

[rationale]: https://wiki.php.net/rfc/rng_fixes

At this point, I am not sure I want to spend more time on trying to synchronize avatars.

## Other possible future features

One feature I would love to add is the ability to define contact pictures in my phone based on the generator. My kids on the other hand, would like to pick avatar parts themselves. We'll see what I ([or you?][gh]) decide to add next.

[pac]: http://peppercarrot.com
[cag]: http://peppercarrot.com/extras/html/2016_cat-generator/index.php?seed=Linux
[gplay]: https://play.google.com/store/apps/details?id=com.agateau.catgenerator
[gh]: https://github.com/agateau/cat-avatar-generator-app
