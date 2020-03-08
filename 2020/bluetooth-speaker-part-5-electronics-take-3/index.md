pub_date: 2020-03-08 17:41:40 +01:00
public: true
tags: [diy, bluetooth, speaker]
title: Bluetooth Speaker part 5 - Electronics, take 3

This article is part of a series on creating a Bluetooth speaker from an old vacuum tube radio and spare parts I had lying around in the house.

- [Part 1: Introduction][part1]
- [Part 2: Attempting to update the audio hardware][part2]
- [Part 3: Using an existing Bluetooth speaker][part3]
- [Part 4: Frontend work][part4]
- Part 5: Electronics, take 3

[part1]: /2019/bluetooth-speaker-part-1-introduction
[part2]: /2019/bluetooth-speaker-part-2-audio-hardware
[part3]: /2020/bluetooth-speaker-part-3-using-an-existing-bluetooth-speaker
[part4]: /2020/bluetooth-speaker-part-4-frontend-work

If you remember well, my first attempt at electronics for this Bluetooth speaker project was using an [all-in-one Bluetooth + amplifier board][part2]. It did not go well, so I tried to [use the guts of an existing Bluetooth speaker][part3] instead. That almost worked, but I experienced stability issues I was not able to solve :(

This article is about the third attempt: following the instructions from [the Radio Workshop][workshop] (which I mentioned at the end of part 3) to get a working Bluetooth + mono amplifier (hopefully).

[workshop]: https://www.radio-workshop.co.uk/

<!-- break -->

### Assembling

The original instructions from the Radio Workshop connected everything using heat-shrinking tubes, but I felt it would be more robust and cleaner to use some prototyping circuit boards to hold all components together.

I made a mistake when I ordered the boards though. The ones I received look like this:

.. thumbimg:: pcb.jpg
    :alt: The PCB

I later discovered these kinds of board are meant to be used with connectors like these to create circuits:

.. thumbimg:: connector.jpg
    :alt: A PCB connector

Since my boards did not come with any connectors, I add to resort to connecting my components using loads of solder, the remainings of resistor pins and a good deal of cursing! Live and learn, they say. For sure I am learning a lot with this project...

Here is the circuit, connected to the speaker:

.. thumbimg:: completed-circuit.jpg
    :alt: The circuit

The connecting mess on the back side:

.. thumbimg:: connecting-mess.jpg
    :alt: Connecting mess

And the hackish connection between the Bluetooth receiver and the amplifier:

.. thumbimg:: hackish-bluetooth-amp-connection.jpg
    :alt: Hackish Bluetooth receiver to amp connection

### Testing

After all this it was time to test it... Does it work?

Short answer: YES, mostly!

Long answer: as you can see on the circuit picture, I powered the circuit using AAA batteries from one of my son toys, but I would prefer to power it using either an USB plug or an USB battery. Unfortunately, when I tested this it caused crackling sound. I suspect either the amplifier or the Bluetooth receiver are a bit sensitive to power variations.

I assume this can be fixed using a capacitor to clean the output of the power supply, but in the worst case I'll just use a set of rechargeable AAA batteries, so at least this is not a blocker. Any suggestion on this topic are very welcome!

### Wood support

To make the circuit less messy and less prone to breakage, I mounted it on a small piece of wood:

.. thumbimg:: circuit-on-wood-support.jpg
    :alt: The circuit on its wood support

The volume potentiometer is not on the amplifier board anymore, I desoldered it and inserted wires between it and the PCB to be able to mount it on the front side of the radio.

I had to drill holes in the circuit board since none of my screws would fit the tiny corner holes... I left the Bluetooth receiver hanging as there was no room to drill any hole in its board :)

Since there need to be some room between the boards and the support, I hacked some spacers by cutting the top of 3 ribbed anchors:

.. thumbimg:: diy-spacers.jpg
    :alt: DIY spacers

### What's next?

Next article is going to be about mounting the buttons to the front side. It's taking way longer than expected, but I am getting there!
