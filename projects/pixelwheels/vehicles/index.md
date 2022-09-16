---
public: yes
tags: []
title: Pixel Wheels vehicles
comments: false
jinja: true
---

[Home](../) | Vehicles
{% for vehicle in vehicles: %}

## {{ vehicle.name }}

<div style="float: right; margin-left: 6px"><img src="{{ vehicle.icon }}"></div>

{{ vehicle.description }}
{% endfor %}
