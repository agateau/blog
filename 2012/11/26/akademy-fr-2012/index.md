public: true
tags: [KDE, Akademy, Krita, Plasma, Homerun, Calligra]
title: Akademy-fr 2012
summary: |
    Wrap-up of the 2012 edition of Akademy-fr, a french KDE event

This weekend was the second edition of Akademy-fr, a French KDE event organized by
[Toulibre](http://www.toulibre.org), and co-hosted in Toulouse as part of [Capitole du
Libre 2012](http://www.capitoledulibre.org/2012).

## Saturday

Just like last year, Akademy-fr 2012 was a two-day event. On Saturday we held a
KDE booth and gave talks. I didn't give any talk this year, though, instead I spent most
of my time on the KDE booth.

Our booth was equipped with two laptops running latest release of KDE SC as well
as two Weetab tablets running Plasma Active. Thanks to the hard work of Kévin
Ottens we had a nice set of demo materials on all machines: videos, music,
pictures and other documents as well as real-world-like KDE activities.

Tablets really are visitor magnets: if you have tablets on a booth you want to
put them in front to attract people. Our demo scenario usual went like this:
catch the attention of someone with our tablets, then demo the way Plasma Active works
and introduce them to the concept of activities. After this, transition to the
laptops, explain the activity concept exists on laptops as well, and continue
with a demo of KDE there.

On the merchandising front, we didn't try to sell anything as there was already
a [Freewear](http://freewear.org) booth selling KDE T-shirts, mugs, cushion and
other goodies. Having nothing to sell saved us from having to handle cash.
Instead we gave away KDE stickers and buttons. Thanks to Kévin Kin-Foo and
[PixCyl](http://pixcyl.free.fr/) we also had a nicely done KDE leaflet in French and A3-sized KDE Akademy-fr
posters.

.. thumbimg :: leaflet.jpg

_KDE leaflets. Top-left: a stack of them. Top-right: content. Bottom-right: additional page inserted inside_

Before flying to Toulouse I printed two A2-sized posters: a big K logo and a
poster intended to recruit testers. As you can see it took me a few attempts to
get proper prints :)

.. thumbimg :: preparing-a2-posters.jpg

I was quite happy with the way the recruiting poster ended up, but unfortunately
didn't get any success on the tester recruiting front :(.

_(The SVG document for the recruiting poster is available [from here](kde-qa.svg),
should you be interested in re-using it. French texts should be easy to change.
Note that this mostly not my work, I started from a [Konqi wallpaper from
Pilaf](http://kde-look.org/content/show.php/KDE+SVG+-+Konqui?content=19173),
removed the background, slightly adjusted the eye direction, created the "wall"
and drew the pointing hand)_

At the end of the day we had a nice chat with David Revoy, who gave a great
presentation about Krita. David is an artist who now creates all his artwork
with Krita, MyPaint and GIMP. He worked, among other projects, on
[Sintel](http://sintel.org) and [Tears of Steel](http://tearsofsteel.org), the
latest movies from the Blender Foundation. This was really inspiring, you may
want to visit [his website](http://www.davidrevoy.com).

## Sunday

Sunday was a workshop day. David Faure and Kévin Ottens ran a KDE Frameworks 5
workshop, Sébastien Renard ran a translation quality workshop, I ran a "UI
Clinic" workshop.

My clinic was not overcrowded: I had only one patient. Jean-Nicolas Artaud came
to discuss Calligra Stage. Together we came up with a good set of changes to
improve slide thumbnails as well as many of Stage toolboxes. Some of those
changes should also benefit other Calligra applications as well, which is nice.

## After-thoughts

I had a great time at Toulouse and I am looking forward to the 2013 edition. I
am also very happy about the demo data files Kévin put together. This is
something we always thought of creating after each Solutions Linux exhibition,
but never actually did.

We were discussing the best way to share them: the whole set is quite big
(2.3GB). There is a already a [git repository for KDE Promo
Material](https://projects.kde.org/projects/others/kde-promo/repository) but a
git repository is a bit impractical in my opinion: Storing big data files for all languages in one
git repository means one has to get all languages when cloning the repository.

I think the solutions are either to use Subversion (which allows for partial
checkouts) or to setup separate git repositories per language|country. I see the
Brazil team already has a separate repository, so maybe we should follow them
and create a French repository.  Subversion would however have the advantage of
being able to checkout only parts of the repository using non-recursive
checkouts, which could be handy when you are trapped with booth-quality
internet access and want to download a few files.

I also thought a bit about this "UI Clinic" idea. I was actually lucky only one
person show up: we ended up spending two hours on Stage, and could probably have
spent more if lunch and having to fly back home had not interfered. This is
similar to what happened in the UI Clinic BoF at Berlin Desktop Summit: I spend
3 hours on two applications, luckily Nuno was also there to help and worked on
other applications. This organization simply does not scale.

I would like to try something different for next Akademy: recruit some "UI
doctors" early, contact application developers before Akademy and see if they
are interested in discussing UI improvements for their applications, have the
"UI doctors" study applications before the event and schedule individual 1 or 2
hour sessions, one for each application. This should be more efficient.
