pub_date: 2017-08-26 22:42:21 +01:00
public: true
tags: [pixelwheels, gamedev]
title: Your car just sank
summary: |
    Implementing water "ground" in Tiny Wheels.

This week focus was on being able to sink cars in water, and more importantly, to recover them.

It is starting to work, as you can see:

<video width="800" height="480" controls>
  <source src="/storage/blog/2017/tinywheels-sinking.mp4" type="video/mp4">
</video>

It still looks ugly, but a few things are now working:

- Declaring "hole" tiles in which vehicle can sink. In this video it's water, but it could be sand or deep space (Rainbow Road anyone?)
- Detecting when the vehicle just sank
- Computing a good position and angle to restart after recovery
- Moving and rotating the vehicle to the recovery position

There is more work to do on this topic though:

- Adding a recovery "helper": the vehicle should not just translates to the recovery position. I am thinking about adding an helicopter which would fly in to carry your vehicle.
- Render the vehicle differently when it's sinking
- Squash a few bugs, in particular the translation animation is sometimes glitchy

I also need to redraw the water tiles, especially the mid water one which I put together in a hurry to be able to test my code.
