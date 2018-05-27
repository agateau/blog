pub_date: 2014-09-28 20:09:04 +02:00
public: true
tags: [kde, shortcuts, ui]
title: "Experimenting with keyboard shortcuts"
summary: |
    My new keyboard shortcut setup is a bit unusual, here is what it looks like.

A few weeks ago, I decided to make an experiment and completely rework the global shortcuts of my KDE desktop. I wanted them to make a bit more sense instead of being the agglomerated result of inspirations from other systems, and was ready to pay the cost of brain retraining.

My current shortcut setup relies on a few "design" decisions:

- All workspace-level shortcuts must use the Windows (also known as Meta) modifier key, application shortcuts are not allowed to use this modifier.

- There is a logical link between a shortcut and its meaning. For example, the shortcut to maximize a window is Win + M.

- The Shift modifier is used to provide a variant of a shortcut. For example the shortcut to minimize a window is Win + Shift + M.

I am still playing with it, but it is stabilizing these days, so I thought I'd write a summary of what I came up with:

## Window management

- Maximize: Win + M.

- Minimize: Win + Shift + M.

- Close: Win + Escape. This is somehow consistent with the current Win + Shift + Escape to kill a window.

- Always on top: Win + T.

- Shade: Win + S.

- Switch between windows: Win + Tab and Win + Shift + Tab (yes, this took some work to retrain myself, and yes, it means I no longer have shortcuts to switch between activities).

- Maximize left, Maximize right: Win + :, Win + !. This is very localized: ':' and '!' are the keys under 'M' on my French keyboard. Definitely not a reusable solution. I used to use Win + '(' and Win + ')' but it made more sense to me to have the maximize variants close to the full Maximize shortcut.

- Inner window modifier key: Win. I actually changed this from Alt a long time ago: it is necessary to be able to use Inkscape, as it uses Alt + Click to select shapes under others.

## Virtual desktop

- Win + Left, Win + Right: Go to previous desktop, go to next desktop.

- Win + Shift + Left, Win + Shift + Right: Bring the current window to the previous desktop, bring the current window to the next desktop.

- Win + F1, Win + F2, Win + F3: Switch to desktop 1, 2 or 3.

## Application launch

- Win + Space: KRunner.

- Win + Shift + Space: Homerun.

## Misc

- Win + L: Lock desktop.

## How does it feel?

I was a bit worried about the muscle-memory retraining, but it went quite well. Of course I am a bit lost nowadays whenever I use another computer, but that was to be expected.

One nice side-effect I did not foresee is that this change turned the Win modifier into a sort of [quasimode][]: all global workspace operations are done by holding the Win key. I said "sort of" because some operations requires you to release the Win key before they are done, for example when switching from one window to another, no shortcuts work as long as the window switcher is visible, so one needs to release the Win key after switching and press it again to do something else. I notice this most often when maximizing left or right.

Another good point of this approach is that, almost no shortcuts use function keys. This is a good thing because: a) it can be quite a stretch for small hands to hold both the Win or Alt modifier together with a function key and b) many laptops these days come with the function keys mapped to multimedia controls and need another modifier to be held to become real function keys, some other laptops do not even come with any function keys at all! (heresy I know, but such is the world we live in...)

What about you, do you have unusual shortcut setups?

<a href="https://flattr.com/submit/auto?user_id=agateau&url=http%3A%2F%2Fagateau.com%2F2014%2Fexperimenting-with-keyboard-shortcuts%2F" target="_blank"><img src="//api.flattr.com/button/flattr-badge-large.png" alt="Flattr this" title="Flattr this" border="0"></a>

[quasimode]: https://en.wikipedia.org/wiki/Mode_%28computer_interface%29#Quasimodes
