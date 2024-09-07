---
public: yes
tags: []
title: Pixel Wheels vehicles
comments: false
jinja: true
---

[Home](../) | Vehicles | [Goodies](../goodies/)
{% for vehicle in vehicles: %}

## <span id="{{ vehicle.id }}">{{ vehicle.name }}</span>

<div style="float: right; margin-left: 6px"><img src="{{ vehicle.id }}.png"></div>

{{ vehicle.description }}
{% endfor %}
