public: yes
tags: []
title: "Welcome!"
comments: false
template: welcome.html
description: Hi I am Aurélien. I create games, desktop and command-line apps.
image: /static/images/avatar.png
image_alt: Aurélien Gâteau
jinja: true

I make open-source games, apps and tools, such as:

<div class="app-blocks">
{% for item in content %}
  <a class="app-block dl-button" href="{{ item.url }}">
    <figure>
      <img src="/welcome/{{ item.thumbnail }}" width="{{ thumbnailSize }}" height="{{ thumbnailSize }}">
      <figcaption><h2>{{ item.name }}</h2>
      {{ item.description }}</figcaption>
    </figure>
  </a>
{% endfor %}
</div>

...and others.

You can find them on my [games](/games/) and [apps](/apps/) pages.

I also have a [blog](/blog/).
