pub_date: 2018-01-05 19:14:01 +01:00
public: true
tags: [pixelwheels]
title: Tiny Wheels 0.5.0, the last Tiny Wheels?
summary: |
    A new Tiny Wheels version is out, but is it the last one?

Welcome to 2018! To celebrate this new year, here is a new release of Tiny Wheels!

## What's new?

The focus for this version was the user interface.

The game UI has been revamped, with big buttons and a checkerboard background. This new UI is more keyboard friendly: almost all screens can be navigated using the arrow keys. I still need to convert the high-score and developer options screens. This is an important step for gamepad support, which I want to work on soon.

I am not entirely sold on the purple for the buttons, so this might change again.

![Title screen](/projects/tinywheels/0.5.0/title.png)

The HUD received some love too: the rank text is bigger, making it easy to check your position at a glance.

The Android side is where I made the most changes. On this screenshot you can see I replaced the touch buttons with pie buttons:

![Touch buttons](/projects/tinywheels/0.5.0/touch-controls.png)

I like this layout, but I haven't seen it in any other games, so I am interested in your feedback on them: are they convenient to use? Do you understand their function at the first sight? The left and right button icons are pretty straightforward I think, but I had a hard time coming up with icons for the "brake" and "action" buttons of the lower-right corner. Again, if you have suggestions they are more than welcome.

I also fixed an embarrassing bug which prevented multi-touch to work: it was not possible for example to trigger a bonus while the left or right button was pressed. Embarrassing I told you.

Finally, I made the game use the immersive mode, where the Android navigation and status bars are hidden until you bring them back by swiping from the edges of the screen.

There are also a few game play changes: most important is you now start from the last position. This might sound unfair, but it is actually a lot more fun: it is more satisfying to pass others than to always try to keep the first position.

I also changed the way AI racers pick their vehicle so that they never select the same vehicle as a player, reducing confusion.

## Under the hood

I updated [libgdx][] from version 1.4.1 to 1.5.6. I still have a lot to catchup (current version is 1.9.8!) but I am going through this slowly because libgdx developers do not exactly practice [semantic versioning][semver]: they regularly make breaking API changes, even in patch releases. There are interesting features I want to use in the latest versions, such as animated tiles (useful for water tiles, for example) and improved gamepad support, so I am going to continue to catchup with each release of the game. 

## The last Tiny Wheels?

Why does this article title say this is the last Tiny Wheels? Am I giving up on the game?

No, I am not, I just wanted to grab your attention with a slightly click-bait title, sorry for that :)

What happened is it has been brought to my attention that there is already a game called [Tiny Wheels][other-tw], so I am going to rename the game. That's unfortunate because I really liked this name, but better avoid confusion. Right now I am considering changing the name to "Pixel Wheels". What do you think? Any other suggestions?

## Download links

As usual, you can get this release from the [game page][tw], I hope you enjoy it!

[libgdx]: http://libgdx.badlogicgames.com
[semver]: http://semver.org
[other-tw]: http://store.steampowered.com/app/577850/Tiny_Wheels/
[tw]: /projects/tinywheels/
