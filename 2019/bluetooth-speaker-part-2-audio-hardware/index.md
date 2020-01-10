pub_date: 2019-12-30 12:02:04 +01:00
public: true
tags: [diy, bluetooth, speaker]
title: Bluetooth Speaker - Part 2 - Attempting to update the audio hardware

This article is part of a series on creating a Bluetooth speaker from an old vacuum tube radio and spare parts I had lying around in the house.

- [Part 1: Introduction][part1]
- Part 2: Attempting to update the audio hardware

[part1]: /2019/bluetooth-speaker-part-1-introduction

As I explained in part 1, the electronics looked too old so I decided to replace it with a small Bluetooth audio amplifier board and two loud speakers.

I ordered a TPA3116D2-based Bluetooth amplifier from Nobsound and a pair of MTX TX450C, 4 Ohms loud speakers.

.. gallery::
    :square:

    - full: audio-amplifier.png
      alt: The Bluetooth amplifier
    - full: loudspeakers.png
      alt: The loud speakers

<!-- break -->

Once the part were there, I quickly tested them using a spare power adapter I had lying around and started to build a chassis using MDF wood.

.. gallery::
    :square:

    - full: chassis-1.jpg
      alt: Checking the loudspeaker fits
    - full: chassis-2.jpg
      alt: The completed chassis

This chassis was not the finest wood work ever, but it did the job, so it was time to fit the speakers in, connect the amplifier board and give it a more thorough test.

That's when it went all wrong :(

First: the setup was really loud. The amplifier is 50W RMS, turning the volume knob to one tenth of its course was already too much for the room I was testing it in.

Second: when not playing any sound, one of the speakers would often pop at a regular rate. I suspect something was wrong with the board, but maybe it was some interference caused by the power supply. I tried another power supply but the result was the same. I don't think it was caused by the speaker because swapping the left and right speakers led to the same result.

Third: audio playback would cut randomly from time to time. That really made the thing unusable.

Because of all of that, I decided to return the parts I ordered and try a different approach. Some people on Youtube had success buying a cheap Bluetooth speaker, tearing it down and fitting it in an existing case. Since I am not really that good at electronics, this sounded like a safer solution.

Next article will be about this new approach.
