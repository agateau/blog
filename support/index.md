---
public: yes
tags: []
title: "Support"
comments: false
jinja: true
supportLinks:
- title: Patreon
  text: Become my Patron
  button: patreon-button.png
  url: https://patreon.com/agateau
- title: GitHub
  text: Become a sponsor
  button: github-button.svg
  url: https://github.com/sponsors/agateau
- title: Liberapay
  text: Donate via Liberapay
  button: liberapay-button.svg
  url: https://liberapay.com/agateau/donate
- title: Ko-fi
  text: Buy me a coffee!
  button: ko-fi-button.png
  url: https://ko-fi.com/I2I51Q4C0
- title: PayPal
  text: Donate via PayPal
  button: paypal-button.svg
  url: https://paypal.me/aureliengateau
- title: itch.io
  text: Buy one of my games
  button: itch-button.svg
  url: https://agateau.itch.io
---
## Why support me?

I love writing free software, but it is difficult to make a living from it. In the server world, you can sell support and training. Unfortunately this does not work for end-user applications and games, which happen to be the areas I enjoy working on.

This is where you come in: by supporting me, I can take days off from work and spend more time working on these free software apps and games.

You can support me in various ways:

<div class="support-blocks">
{% for sl in supportLinks %}
    <a class="support-block dl-button" href="{{ sl.url }}">
        <div class="support-button">
            <img src="{{ sl.button }}" width="{{ buttonSize }}" height="{{ buttonSize }}">
        </div>
        <div class="support-text">
                <div class="support-title">{{ sl.title }}</div>
                <div>{{ sl.text }}</div>
        </div>
    </a>
{% endfor %}
</div>

## Previous supporters

From November 2010 to April 2012 I asked for donations. The records of these is kept in a [separate page](/support-historic/). Thanks again to these generous supporters.
