pub_date: 2018-12-23 11:29:33 +01:00
public: true
tags: [burgerparty, release-month, pko]
title: Release month, Burger Party 1.3.0!

Another weekend, another release! This one is special. You may remember a few
years ago I created a burger game for Android: [Burger Party][bp]. At that time
I had plans to generate some revenue through this game. After investigating the
different revenue models, I sadly concluded [I would have to include ads][ads].

That did not work out (surprise!): at its peak Burger Party reached a few
thousand installations, which generated a meager $30 of revenue. I guess the
reasons for this failure was that:
1. There were not enough ads to make it work: I decided against permanent
   banners so the game only displayed interstitials between levels, and no more
   than one ad every two minutes,
2. It did not reach enough installations, marketing is not my forte.

[bp]: /projects/burgerparty/
[ads]: /2014/burgerparty-0.11/

I also never felt comfortable with the idea of one my personal projects being
ad-based and proprietary. I kept telling myself I should remove the ads and
release a new version of Burger Party as free software, but I never got around
to do it...

![Screenshot](/projects/burgerparty/1.0rc1/us-world.png)

<!-- break -->

Last week when I uploaded Pixel Wheels 0.11.0 to Google Play, I found out that
Burger Party had been pulled out because it did not have a privacy policy and
the ad SDK was sending data to the ad company. That decided me to finally take
the plunge and do the work.

Here it is: Burger Party, as of 1.3.0, is now ad-free and licensed under
GPL-3.0 or later, with some parts under Apache 2.0! And it's back on [Google
Play][gp]!

[gp]: https://play.google.com/store/apps/details?id=com.agateau.burgerparty

You can find the complete game (source code and assets) on [GitHub][gh].

[gh]: https://github.com/agateau/burgerparty

## Music

Speaking of assets, I am also happy to be able to share the game music,
which I like a lot:

<audio controls style="width: 100%">
  <source src="https://raw.githubusercontent.com/agateau/burgerparty/master/burgerparty-android/assets/music/burger-party_main-theme.mp3">
</audio>

The music was composed by one of my brothers. It was not that easy for him to
produce, his normal style is [slightly][thomas1] [more][thomas2]
[aggressive][thomas3] :)

[thomas1]: https://www.youtube.com/watch?v=ybRCS5xMQl8
[thomas2]: https://www.youtube.com/watch?v=8tLvGizac8Y
[thomas3]: https://www.youtube.com/watch?v=p_4o_Z1QWCA

## Goodies

To celebrate this release I created two T-shirts based on the game visuals:

<div>
<a href="https://www.redbubble.com/people/agateau/works/35854931-burger?p=triblend-tee"><img style="width: 30%; display: inline" src="/projects/burgerparty/tshirt-1.jpg"></a>
<a href="https://www.redbubble.com/people/agateau/works/35854515-huge-burger?p=triblend-tee"><img style="width: 30%; display: inline" src="/projects/burgerparty/tshirt-2.jpg"></a>
</div>

Who knows, maybe this can be more profitable than ads? It should not be too
difficult, considering I never got any money from the ad system because I never
reached the minimum threshold ($100) to actually get paid! In any case I prefer
earning a bit of money from someone buying a T-shirt than from someone clicking
on an ad and installing another app.

That's it for this release. I wish you a Merry Christmas! See you next weekend
for one last edition of the release month!
