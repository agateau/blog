---
public: yes
tags: []
title: Pixel Wheels merch
comments: false
jinja: true
---

<nav class="page-nav">
<ul>
    <li><a href="../">Home</a></li>
    <li><a href="../vehicles/">Vehicles</a></li>
    <li class="active"><span>Merch</span></li>
</ul>
</nav>

## Pixel Wheels shop

Visit [Pixel Wheels shop](/redirect/pw-goodies) at RedBubble!

<div class="pwmerch-container">
{% for item in items: %}
    <a class="dl-button" href="{{ item.url }}" title="{{ item.title }}">
        <div class="thumbnail-container">
        {% for idx in range(4) %}
            <img src="{{ item.thumbnailPrefix }}{{ idx + 1 }}.jpg" width="{{ thumbnailSize }}" height="{{ thumbnailSize }}">
        {% endfor %}
        </div>
        <div class="caption">{{ item.name }}</div>
    </a>
{% endfor %}
</div>

## Game tile

Here is a Pixel Wheels cover tile made by Isaac E to be used in game management apps such as [Lutris][].

[Lutris]: https://lutris.net/

![Game tile](game-tile.png)
