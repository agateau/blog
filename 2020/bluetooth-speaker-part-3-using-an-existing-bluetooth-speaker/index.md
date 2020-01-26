pub_date: 2020-01-13 08:43:46 +01:00
public: true
tags: [diy, bluetooth, speaker]
title: Bluetooth Speaker - Part 3 - Using an existing Bluetooth speaker

This article is part of a series on creating a Bluetooth speaker from an old vacuum tube radio and spare parts I had lying around in the house.

- [Part 1: Introduction][part1]
- [Part 2: Attempting to update the audio hardware][part2]
- Part 3: Using an existing Bluetooth speaker
- [Part 4: Frontend work][part4]

[part1]: /2019/bluetooth-speaker-part-1-introduction
[part2]: /2019/bluetooth-speaker-part-2-audio-hardware
[part4]: /2020/bluetooth-speaker-part-4-frontend-work

So after the failure of [part 2][part2], I decided to try a seemingly safer approach: buy a small Bluetooth speaker, tear it down and use its guts to power my radio.

I bought a small portable Grundig GSB 710 Bluetooth speaker. It's a mono speaker, but since the radio I am working was also mono, as was common by the time it was created, it felt like a good fit. I checked it worked and started to tear it down:

.. gallery::
    :square:

    - full: teardown1.jpg
      alt: Opening the box
    - full: teardown2.jpg
      alt: Main circuit is out, unplugged from its speaker
    - full: teardown3.jpg
      alt: Control board removed
    - full: teardown4.jpg
      alt: Soldering wires to the ribbon cable, ghetto-style, because I didn't have any connector handy
    - full: teardown5.jpg
      alt: Covering the mess with thermoretractable tube

<!-- break -->

While rummaging through the basement I found another treasure left by the previous house owner: an old mono speaker.

.. gallery::
    :square:

    - full: speaker1.jpg
      alt: The speaker
    - full: speaker2.jpg
      alt: The box says it's 15 W RMS, 4 Ohms. Sounds good

After checking it worked, I decided to use it for the radio. That meant tearing it down as well and creating a chassis for it:

.. gallery::
    :square:

    - full: speaker-chassis1.jpg
      alt: That front plate is a bit rusty
    - full: speaker-chassis2.jpg
      alt: Back view
    - full: speaker-chassis3.jpg
      alt: I had to break the front plate to get the speakers out without damaging any component
    - full: speaker-chassis4.jpg
      alt: All parts of the chassis have been cut
    - full: speaker-chassis5.jpg
      alt: Let the glue dry
    - full: speaker-chassis6.jpg
      alt: You never have too many clamps
    - full: speaker-chassis7.jpg
      alt: Installing the speakers in their new home
    - full: speaker-chassis8.jpg
      alt: All connected
    - full: speaker-chassis9.jpg
      alt: Looks good enough, especially since it will be covered eventually
    - full: speaker-chassis10.jpg
      alt: Checking the chassis fits correctly in the original case

It was time to test... We used the radio to play music during Christmas Eve. It was working well, but after pausing the music during the meal, we were unable to turn it back on. Damn.

The next day it was back to normal. I suspect there is a power-saving feature in the GSB 710. I spent a few hours trying to figure out how to bring the amplifier back from that state, without success...

This meant I am almost back to square 1: the chassis and the speaker I can keep, but I need to find yet another replacement for the Bluetooth amplifier.

After some more research I found this website: [the Radio Workshop][workshop]. Ray, the workshop owner, is clearly a passionate. He prefers bringing back the original electronics to life, but he actually supports [adding Bluetooth to beyond repair radios][workshop-bluetooth], and even produced an [eBook explaining how he does so][ebook]. I bought the eBook, ordered the components, and now I am waiting for them to all arrive.

[Next article][part4] will be about some work I did on the front-side, waiting for the required components to arrive.

[workshop]: https://www.radio-workshop.co.uk/
[workshop-bluetooth]: https://www.radio-workshop.co.uk/bluetooth-technology/
[ebook]: https://www.radio-workshop.co.uk/turn-a-vintage-radio-into-a-bluetooth-speaker-ebook/
