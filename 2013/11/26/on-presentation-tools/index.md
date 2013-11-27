pub_date: 2013-11-26 22:46:59 +01:00
public: true
tags: [Akademy-fr, presentation, tools]
title: "On presentation tools"
summary: |
    The challenges of choosing a geek-friendly presentation tool...

Last week-end I attended [Akademy-fr][akfr] and gave a presentation about
Kdenlive.

I don't present very often, and it seems with every presentation I prepare I try
a few presentation tools before settling on one. It usually starts with a "Let's
give Stage and Impress one more try" thought, where I pretend to act like a
normal person preparing a presentation. I then get frustrated by the lack of
consistent styling support and start exploring around.

In the past I have used [S5][S5], an HTML-based tool, but writing lists in HTML
gets old very quickly. I also used [Landslide][ls], a command-line tool which
can turn [Markdown][md] into HTML slides. I am a huge Markdown fan, so writing
slides in Markdown suits me well, but for some reason Landslide got into my way
too much while writing slides for the Kdenlive presentation: I could not get the
appearance I wanted and the many features was getting on my nerves (it feels a
bit like each key can trigger an action and I don't always find the way to get
out of it) I managed to resist the urge of writing my own tool and went shopping
for existing Markdown-enabled presentation tools.

I first tried [Reveal.js][reveal]. It produces impressive presentations, but it
felt too fancy for my tastes. I recently read an excellent article by Kathy
Sierra titled: ["Presentation Skills Considered Harmful"][ks-article] and this
quote resonated a lot for me:

> [...]
>
> My path to coping with heart-stopping stage-fright is to focus NOT on what I
> do but on what they experience. And since I'm a software developer, I'll think
> of the audience as my users.
>
> And if they're my users, then this presentation is a user experience.
>
> And if it's a user experience, then what am I?
>
> Ah... now we're at the place where stage fright starts to dissolve.
>
> Because if the presentation is a user experience, then **I am just a UI.**
>
> [...]
>
> **And what's a key attribute of a good UI?**
>
> It disappears.
>
> It does not draw attention to itself.
>
> **It enables the user experience, but is not itself the experience.**
>
> [...]

(Emphasis mine)

With this approach in mind, I finally settled on [Remark.js][remark]. It is very
simple yet efficient. The way it works is surprising: one create the
presentation slides by writing markdown in a text area!

Once you get over this unusual system, you find out it works very well.  Being
JavaScript-based means there is no build step: just type your content and hit F5
in the browser window to see the results. Tweaking the appearance of the
presentation is easy as the tool does not impose too much CSS structure on you.
I was also able to make use of [Font Awesome][fa] icons to illustrate my slides
without any problem.

If you have similar feelings about how presentation tools should work, I highly
recommend giving Remark a try.

[akfr]: http://2013.capitoledulibre.org/akademy-fr.html
[S5]: http://meyerweb.com/eric/tools/s5/
[ls]: https://github.com/adamzap/landslide
[md]: http://daringfireball.net/projects/markdown/
[reveal]: http://lab.hakim.se/reveal-js/
[ks-article]: http://seriouspony.com/blog/2013/10/4/presentation-skills-considered-harmful
[remark]: http://remarkjs.com
[fa]: http://fontawesome.io/
