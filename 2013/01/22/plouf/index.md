pub_date: 2013-01-22 22:49:59 +01:00
public: true
tags: [games, Amiga, AMOS]
title: "And now for something old... Plouf!"
summary: |
    Bringing Plouf!, an Amiga game I wrote a long time ago, on the Internet

This is by far my longest release ever: 18 years!

18 years ago I was learning the ropes of coding on an [Amiga 500][a500]. Using
[AMOS][], a game-oriented Basic, I played with creating games and demos. I was
not as persevering as nowadays: most of those creations got started and
abandoned a few weeks later, but I did manage to finish one of those game
attempts: Plouf!

## The game

Plouf! is a top-down game where players sit on floats, trying to sink the other
players by throwing sea urchins at them. "Plouf!" is the French onomatopoeia
for the sound made by an object when it falls into a liquid.

You control your float like an RC car: you can accelerate, slow down and rotate
left or right. The islands on the screen are randomly generated, so each game
looks different.

It only support 2 or 3 players: I didn't have the skills to code a computer
player by then.

You start with a very limited number of sea urchins, so you need to collect them
as they appear randomly in the sea. You can also grab float bonuses which
increase the strength of your float by one point.

Here are some screenshots:

.. thumbimg:: plouf-start.png
    :thumbsize: 320
    :alt: The start screen
_The start screen_

.. thumbimg:: plouf-2players.png
    :thumbsize: 320
    :alt: A 2 player game, blond guy has just thrown a sea urchin, but it's going to miss its target
_A 2 player game, blond guy has just thrown a sea urchin, but it's going to miss its target_

.. thumbimg:: plouf-3players.png
    :thumbsize: 320
    :alt: A 3 player game starting
_A 3 player game starting_

## First release

I released Plouf! as a shareware in 1994: a floppy disk of the demo version
(limited to 4 games) could be obtained from a few Amiga freeware and shareware
floppy disk dealers (this was a time where Internet was not ubiquitous...)

It sold the impressive number of 0 full versions :( Playing with friends is a
lot of fun, but I guess the lack of a single-player mode was a show stopper.

## Fast forward

Some time ago I decided to release it as free software. I bought a NULL-modem
cable and transfered the source code to my laptop.

There was one problem though: all text was in French :( I wanted to at least
translate all visible strings to English. One would think it would just be a
matter of opening the source code with a modern editor and run the AMOS
Compiler to regenerate binaries... It's not that simple: the format of `.AMOS`
files is binary: it bundles the source code and the program assets. This means
it can only be edited with AMOS Editor. I thus ran AMOS Editor in UAE to do all
my edits... I can confirm editors have made a lot of progress since 1994...

.. thumbimg:: amos.png
    :thumbsize: 320
    :alt: Editing Plouf! source code with AMOS

Nevertheless, it was a lot of fun to use these tools again. I eventually
managed to figure out again how everything worked. I translated the visible
strings (note that I didn't went as far as translating the source code),
adjusted a few other things and here it is: Plouf! is released under GPL 3 or
later license!

## Playing Plouf!

To play Plouf! you first need to download [plouf-1.1.adf][adf]. Then either you are
the lucky owner of an Amiga and you know how to transfer it on a disk to use on
your machine, or you don't have an Amiga and you can run it with an Amiga
emulator.

If you want to give it a try on an emulator, I recommend [FS-UAE][], a user-friendly
fork of UAE, with a nicely done frontend.

## Source code

The source code is available from github: <https://github.com/agateau/plouf>.
Just keep in mind you can't really read it online since the `.AMOS` files are
not text files.


[a500]: https://en.wikipedia.org/wiki/Amiga_500
[AMOS]: https://en.wikipedia.org/wiki/AMOS_%28programming_language%29
[adf]: /projects/plouf/plouf-1.1.adf
[FS-UAE]: http://fengestad.no/fs-uae/
