---
public: true
pub_date: 2024-11-10 07:36:54 +01:00
tags: [monthlyupdate, pixelwheels]
title: October status update
mastodon: https://mastodon.xyz/@agateau/113459980422243559
---

## Introduction

In October I worked on the different difficulty levels of Pixel Wheels, and I am happy to report it's done and has been merged. While this looked simple there were quite a few details to take care of.

<!-- break -->

## The devil is in the details

First I had to change the file format used to save player game statistics to store championship results by difficulty. This also required writing code to seamlessly migrate the old file format to the new one.

Then I changed some of the vehicle unlock rules to make them depend on the difficulty.

Finally I needed to adjust the default track records: best times must be higher for lower difficulty levels because the vehicles are slower. The game had 3 default records per track, so I initially planned to modify the data files to store 3 default records per track per difficulty, and wrote most of the code to do so, but when it came time to replay all tracks with the different difficulties to fill the data my lazy-developer-brain was like:

> Mmm, replaying all those levels twice sounds boring. What if you wrote a script to take the records for the highest difficulty levels, scale them up using the speed ratio between the two difficulty levels and fill the game data files for you?

And then my lazy-developer-brain had an even smarter/lazier idea:

> Instead of writing a script to do that scaling and store it in game data, make the game dynamically do the scale, this way if you adjust the difficulty speed ratio, the default records adjust automatically!

So this is what I ended up doing. Thank you, lazy-developer-brain 😁.

## What's next

For November I plan to do some work on improving control handling, because I often receive messages from players praising the game but finding it hard to control. This is a difficult issue to tackle because there is no clear way to fix the issue, just lots of knobs to adjust until it feels right, or at least, better.
