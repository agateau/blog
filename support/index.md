public: yes
tags: []
title: "Support"
disqus: false
jinja: true
supportLinks:
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

I asked for donations from 2010 to 2012. Generous donors from this period are all listed on [this page](/support-2010-2012). Thanks again to them!
